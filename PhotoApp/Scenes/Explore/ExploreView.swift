//
//  ExploreView.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 07/04/2023.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel: ExploreViewModel
    @Preference(\.isNetworkReachable) var isNetworkReachable
    
    var body: some View {
        NavigationView {
            WithViewState(
                viewModel.state.viewState,
                isRefreshable: true) {
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 20) {
                            ForEach(viewModel.state.photoList, id: \.id) { photoModel in
                                if !photoModel.isAdModel {
                                   
                                    PhotoCell(model: photoModel){ image, color in
                                        viewModel.trigger(.didSelectPhoto(image, color))
                                    }
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
                .if(!isNetworkReachable) {
                    $0.navigationBarItems(
                        trailing:
                            HStack{
                                Image(systemName: "wifi.slash")
                                .resizable()
                                .frame(width: 25, height: 20)
                                .foregroundColor(.appRed)
                                .blinking(duration: 1.0)
                            }

                    )

                }
                .navigation(item: $viewModel.state.photoDetailedViewModel) {
                    PhotoDetailedView(viewModel: $0)
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


struct BlinkViewModifier: ViewModifier {
    
    let duration: Double
    @State private var blinking: Bool = false
    
    func body(content: Content) -> some View {
        content
            .opacity(blinking ? 0 : 1)
            .animation(.easeOut(duration: duration).repeatForever())
            .onAppear {
                withAnimation {
                    blinking = true
                }
            }
    }
}

extension View {
    func blinking(duration: Double = 0.75) -> some View {
        modifier(BlinkViewModifier(duration: duration))
    }
}
