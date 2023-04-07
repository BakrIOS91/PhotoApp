//
//  ExploreView.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 07/04/2023.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel: ExploreViewModel

    var body: some View {
        NavigationView {
            WithViewState(
                viewModel.state.viewsState,
                isRefreshable: true) {
                    PhotoCell(model: .fake)
                    
                } loadingContent: {
                    
                } retryHandler: {
                    
                }
                .navigationTitle(Str.tbExplore.key)
                .navigationBarTitleDisplayMode(.inline)
                
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        LocalePreview {
            ExploreView(viewModel: .init())
        }
    }
}
