//
//  AppMasterView.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 05/04/2023.
//

import SwiftUI

struct AppMasterView: View {
    @ObservedObject var viewModel: AppMasterViewModel
    @Preference(\.rootView) var rootView
    
    var body: some View {
        LocalizedContentView {
            switch rootView ?? .splash {
            case .splash:
                Unwrap(viewModel.state.splashViewModel) {
                    SplashView(viewModel: $0)
                } fallbackContent: {
                    UnImplmentedView()
                }
            case .language:
                Unwrap(viewModel.state.languageSelectionViewModel) {
                    LanguageSelectionView(viewModel: $0)
                } fallbackContent: {
                    UnImplmentedView()
                }
            case .home:
                Unwrap(viewModel.state.homeTabViewModel) {
                    HomeTabView(viewModel: $0)
                } fallbackContent: {
                    UnImplmentedView()
                }
            }
        }
        .onChange(of: rootView) { rootView in
            viewModel.trigger(.loadView(rootView))
        }
    }
}

struct AppMasterView_Previews: PreviewProvider {
    static var previews: some View {
        LocalePreview {
            AppMasterView(viewModel: .init())
        }
    }
}
