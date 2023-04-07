//
//  AppMasterViewModel.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 05/04/2023.
//

import SwiftUI

class AppMasterViewModel: BaseViewModel<AppMasterViewModel.State, AppMasterViewModel.Action>, NetworkHelper {
    
    struct State {
        
        //ViewModels
        var splashViewModel: SplashViewModel?
        var languageSelectionViewModel: LanguageSelectionViewModel?

    }
    
    enum Action {
        case onAppear
        case reloadView
    }
    
    init() {
        super.init(state: .init())
    }
    
    override func trigger(_ action: Action) {
        switch action {
        case .onAppear, .reloadView:
            loadViewModel()
        }
    }
    
    fileprivate func loadViewModel() {
        switch Preferences.shared.rootView {
        case .splash:
            state.splashViewModel = .init()
        case .language:
            state.languageSelectionViewModel = .init()
        default: break
        }
    }
    
}
