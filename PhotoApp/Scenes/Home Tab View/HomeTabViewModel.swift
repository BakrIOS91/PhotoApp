//
//  HomeTabViewModel.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 07/04/2023.
//

import Foundation
class HomeTabViewModel: BaseViewModel<HomeTabViewModel.State, HomeTabViewModel.Action>, NetworkHelper {
    
    struct State {
        
        //ViewModels
        var settingViewModel: SettingsViewModel?
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
            loadViewModels()
        }
    }
    
    fileprivate func loadViewModels() {
        state.settingViewModel = .init()
    }
}
