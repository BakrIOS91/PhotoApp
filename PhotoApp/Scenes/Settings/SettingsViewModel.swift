//
//  SettingsViewModel.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 07/04/2023.
//

import SwiftUI

class SettingsViewModel: BaseViewModel<SettingsViewModel.State, SettingsViewModel.Action>, NetworkHelper {
    
    @Preference(\.rootView) var rootView
    
    struct State {
        
        //ViewModels
    }
    
    enum Action {
        case onAppear
        case didPressChangeLanguage
    }
    
    init() {
        super.init(state: .init())
    }
    
    override func trigger(_ action: Action) {
        switch action {
        case .onAppear:
            break
        case .didPressChangeLanguage:
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
        }
    }
}
