//
//  FrameworkDetailView.swift
//  Apple-frameworks
//
//  Created by Kwasi Nsiah on 6/20/24.
//

import SwiftUI

struct FrameworkDetailView: View {
    var framework: Framework = MockData.sampleFramework
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {
            XCloseButton(isShowingDetailView: $isShowingDetailView)
            
            Spacer()
                
            FrameworkTitleView(framework: framework)
                .padding(.bottom, 30)
            ScrollView {
                Text(framework.description)
                    .font(.body)
            }
            .padding()
            
            Button(action: {
                isShowingSafariView = true
            }) {
                FwButton(title: "Learn More")
            }
            Spacer()
        
        }
        .sheet(isPresented: $isShowingSafariView, content: {
            SafariView(url: (URL(string: framework.urlString) ?? URL(string: "www.apple.com")!))
        })
    }
}

#Preview {
    FrameworkDetailView(isShowingDetailView: .constant(false))
}
