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
                viewModel.state.viewState,
                isRefreshable: true) {
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 20) {
                            ForEach(viewModel.state.photoList, id: \.id) { photoModel in
                                if !photoModel.isAdModel {
                                    Button {
                                        
                                    } label: {
                                        PhotoCell(model: photoModel)

                                    }
                                    .buttonStyle(.plain)
                                } else {
                                    AdsCell()
                                        .frame(width: 200, height: 200)
                                }
                            }
                            
                            if viewModel.state.shouldPaginate {
                                ZStack {
                                    ProgressView()
                                        .padding(30)
                                        .onAppear {
                                            viewModel.trigger(.fetchPhotos(atPage: .next))
                                        }
                                }
                            }
                        }
                    }
                   
                    
                } loadingContent: {
                    ScrollView(showsIndicators: false){
                        VStack(spacing: 20){
                            ForEach(1...10, id: \.self) { _ in
                                PhotoCell(model: .fake)
                                    .shimmed
                            }
                        }
                    }
                } retryHandler: {
                    viewModel.trigger(.fetchPhotos(atPage: .first))
                }
                .padding(.top, 20)
                .navigationTitle(Str.tbExplore.key)
                .onAppear {
                    viewModel.trigger(.fetchPhotos(atPage: .first))
                }
                
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
