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

    }
    
    enum Action {
        case onAppear
    }
    
    init() {
        super.init(state: .init())
    }
    
    override func trigger(_ action: Action) {
        switch action {
        case .onAppear:
            state.splashViewModel = .init()
        }
    }
    
}
