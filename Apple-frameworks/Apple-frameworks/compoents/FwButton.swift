//
//  FwButton.swift
//  Apple-frameworks
//
//  Created by Kwasi Nsiah on 6/20/24.
//

import SwiftUI

struct FwButton: View {
    
    var title: String = "Button"
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(15)
    }
}

#Preview {
    FwButton()
}
