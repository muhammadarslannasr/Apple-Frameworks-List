//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by Muhammad Arslan Nasr on 06/01/2024.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: viewModel.columns){
                    
                    ForEach(MockData.frameworks){framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                    }
                    
                   
                }
            }.navigationTitle("🍎 Arslan")
                .sheet(isPresented: $viewModel.isShowingDetailView, content: {
                    FrameworkDetailView(isShowingDetailView: $viewModel.isShowingDetailView, framework: viewModel.selectedFramework ?? MockData.sampleFramework
                    )
                })

        }
        
  
        
        
        
    }
}

#Preview {
    FrameworkGridView()
}


