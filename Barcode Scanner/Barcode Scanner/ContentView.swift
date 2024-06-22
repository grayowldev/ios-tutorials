//
//  ContentView.swift
//  Barcode Scanner
//
//  Created by Kwasi Nsiah on 6/21/24.
//

import SwiftUI

struct ContentView: View {
    @State private var scannedCode = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text(scannedCode)
                    .font(.body)
                
                Spacer()
                
                // Camera
                ScannerView(scannedCode: $scannedCode)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  maxHeight: 300)
                
                Spacer()
                
                    Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                        .font(.title)
                
                Text(scannedCode.isEmpty ? "Not Yet Scanned" : "Scanned Code")
                    .font(.largeTitle)
                    .foregroundColor(scannedCode.isEmpty ? .red : .green)
                    .padding()
                
                Spacer()
            }
            .navigationTitle("Barcode Scanner")
        }
        
    }
}

#Preview {
    ContentView()
}
