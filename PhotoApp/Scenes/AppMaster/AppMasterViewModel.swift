//
//  AppMasterViewModel.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 05/04/2023.
//

import SwiftUI

class AppMasterViewModel: BaseViewModel<AppMasterViewModel.State, AppMasterViewModel.Action>, NetworkHelper {
    
    struct State {
        var rootView: AppRootView
        //ViewModels
        var splashViewModel: SplashViewModel?
        var languageSelectionViewModel: LanguageSelectionViewModel?
        var homeTabViewModel: HomeTabViewModel?
    }
    
    enum Action {
        case loadView(AppRootView?)
    }
    
    init() {
        super.init(state: .init(rootView: Preferences.shared.rootView ?? .splash))
        loadViewModel(state.rootView)
    }
    
    override func trigger(_ action: Action) {
        switch action {
        case .loadView( let rootView):
            loadViewModel(rootView ?? .splash)
        }
    }
    
    fileprivate func loadViewModel(_ rootView: AppRootView) {
        switch rootView {
        case .splash:
            state.splashViewModel = .init()
        case .language:
            state.languageSelectionViewModel = .init()
        case .home:
            state.homeTabViewModel = .init()
        }
        state.rootView = rootView
    }
    
}
