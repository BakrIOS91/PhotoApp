//
//  LanguageSelectionViewModel.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 06/04/2023.
//

import SwiftUI


class LanguageSelectionViewModel: BaseViewModel<LanguageSelectionViewModel.State, LanguageSelectionViewModel.Action>, NetworkHelper {
    
    @Preference(\.locale) var locale
    @Preference(\.rootView) var rootView
    
    struct State {

    }
    
    enum Action {
        case didSelectLanguage(Locale)
    }
    
    init() {
        super.init(state: .init())
    }
    
    override func trigger(_ action: Action) {
        switch action {
        case let .didSelectLanguage(locale):
            self.locale = locale
            Bundle.setLanguage(language: locale.identifier)
            rootView = .home
        }
    }
}
