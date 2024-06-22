//
//  ScannerVC.swift
//  Barcode Scanner
//
//  Created by Kwasi Nsiah on 6/21/24.
//

import AVFoundation
import UIKit

enum CameraError: String {
    case invalidDeviceInput = "There is an issue with the camera, we are unable to scan the object"
    case invalidScanValue = "The value scanned is invalid"
}

protocol ScannerVCDelegate: AnyObject {
    func didFind(barcode: String)
    func didSurface(error: CameraError)
}

final class ScannerVC: UIViewController {
    
    let captureSesion = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer?
    weak var scannerDelegate: ScannerVCDelegate!
    
//    init(previewLayer: AVCaptureVideoPreviewLayer? = nil, scannerDelegate: ScannerVCDelegate!) {
//        super.init(nibName: nil, bundle: nil)
//        self.previewLayer = previewLayer
//        self.scannerDelegate = scannerDelegate
//    }
    
    init(previewLayer: AVCaptureVideoPreviewLayer? = nil, scannerDelegate: ScannerVCDelegate!) {
        super.init(nibName: nil, bundle: nil)
        self.previewLayer = previewLayer
        self.scannerDelegate = scannerDelegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCaptureSession()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        guard let previewLayer = previewLayer else {
            scannerDelegate?.didSurface(error: .invalidDeviceInput)
            return
        }
        
        previewLayer.frame = view.layer.bounds
    }
    
    private func setupCaptureSession() {
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
            scannerDelegate?.didSurface(error: .invalidDeviceInput)
            return
        }
        
        let videoInput: AVCaptureDeviceInput
        
        do {
            try videoInput = AVCaptureDeviceInput(device: videoCaptureDevice)
                
        } catch {
            scannerDelegate?.didSurface(error: .invalidDeviceInput)
            return
        }
        
        if captureSesion.canAddInput(videoInput) {
            captureSesion.addInput(videoInput)
        } else {
            scannerDelegate?.didSurface(error: .invalidDeviceInput)
            return
        }
        
        let metaDataOutput = AVCaptureMetadataOutput()
        
        if captureSesion.canAddOutput(metaDataOutput) {
            captureSesion.addOutput(metaDataOutput)
            metaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metaDataOutput.metadataObjectTypes = [.ean8, .ean13]
        } else {
            scannerDelegate?.didSurface(error: .invalidDeviceInput)
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSesion)
        previewLayer!.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer!)
        
        captureSesion.startRunning()
    }
    
}

extension ScannerVC: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let object = metadataObjects.first else {
            scannerDelegate?.didSurface(error: .invalidScanValue)
            return
        }
        
        guard let machineReadableObject = object as? AVMetadataMachineReadableCodeObject else {
            scannerDelegate?.didSurface(error: .invalidScanValue)
            return
        }
        
        guard let barcode = machineReadableObject.stringValue else { 
            scannerDelegate?.didSurface(error: .invalidScanValue)
            return
        }
        
        scannerDelegate?.didFind(barcode: barcode)
    }
}
