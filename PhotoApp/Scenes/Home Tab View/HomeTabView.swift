//
//  HomeTabView.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 07/04/2023.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        TabView {
            UnImplmentedView()
                .tabItem {
                    Label(Str.tbExplore.key, systemImage: "map.fill")
                }
            
            UnImplmentedView()
                .tabItem {
                    Label(Str.tbSettings.key, systemImage: "gear")
                }
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        LocalePreview {
            HomeTabView()
        }
    }
}
