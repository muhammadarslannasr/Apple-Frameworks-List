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
                List{
                    
                    ForEach(MockData.frameworks){framework in
                        
                        NavigationLink(
                            destination: FrameworkDetailView(isShowingDetailView: $viewModel.isShowingDetailView, framework: framework)){
                                FrameworkTitleView(framework: framework)
                            }
                    }
                    }
            .navigationTitle("🍎 Arslan")
        }.accentColor(Color(.label))
        
  
        
        
        
    }
}

#Preview {
    FrameworkGridView()
}


