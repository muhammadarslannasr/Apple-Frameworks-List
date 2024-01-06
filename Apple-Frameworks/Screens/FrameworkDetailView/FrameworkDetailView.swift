//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Muhammad Arslan Nasr on 06/01/2024.
//

import SwiftUI

struct FrameworkDetailView: View {
    @Binding var isShowingDetailView: Bool
    var framework: Framework
    
    @State private var isShowingSafariView = false
    
    var body: some View {
        
        HStack{
            Spacer()
            Button{
                isShowingDetailView = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width: 40,height: 40)
            }
        }.padding()
        
       
        
        Spacer()
        
        FrameworkTitleView(framework: framework)
        
        Text(framework.description)
            .font(.body)
            .padding()
        
        Spacer()
        
        Button{       
           isShowingSafariView = true
            
        }label: {
            AFButton(title: "Learn More")
        }.fullScreenCover(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
        })
    }
}

#Preview {
    FrameworkDetailView(isShowingDetailView: .constant(false), framework: MockData.sampleFramework)
}
