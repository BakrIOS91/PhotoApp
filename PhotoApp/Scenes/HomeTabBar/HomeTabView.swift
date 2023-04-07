//
//  HomeTabView.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 07/04/2023.
//

import SwiftUI

struct HomeTabView: View {
    
    @ObservedObject var viewModel: HomeTabViewModel
    
    var body: some View {
        TabView {
            Unwrap(viewModel.state.exploreViewModel){
                ExploreView(viewModel: $0)
            } fallbackContent: {
                UnImplmentedView()
            }
                .tabItem {
                    Label(Str.tbExplore.key, systemImage: "map.fill")
                }
            
            Unwrap(viewModel.state.settingViewModel){
                SettingView(viewModel: $0)
            } fallbackContent: {
                UnImplmentedView()
            }
            .tabItem {
                Label(Str.tbSettings.key, systemImage: "gear")
            }
        }
        .onAppear {
            viewModel.trigger(.onAppear)
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        LocalePreview {
            HomeTabView(viewModel: .init())
        }
    }
}
