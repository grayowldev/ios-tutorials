//
//  XCloseButton.swift
//  Apple-frameworks
//
//  Created by Kwasi Nsiah on 6/20/24.
//

import SwiftUI

struct XCloseButton: View {
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                isShowingDetailView = false
            }label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
            }
        }
        .padding()
    }
}

#Preview {
    XCloseButton(isShowingDetailView: .constant(false))
}
