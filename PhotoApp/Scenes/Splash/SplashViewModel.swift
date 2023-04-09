//
//  SplashViewModel.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 06/04/2023.
//

import SwiftUI

class SplashViewModel: BaseViewModel<SplashViewModel.State, SplashViewModel.Action>, NetworkHelper {
    
    @Preference(\.rootView) var rootView
    
    struct State {
        
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
            Helpers.shared.wait {
                self.rootView = .language
            }
        }
    }
}
