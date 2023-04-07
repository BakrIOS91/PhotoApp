//
//  PhotoAppApp.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 07/04/2023.
//

import SwiftUI

@main
struct PhotoAppApp: App {
    @Preference(\.locale) var locale
    
    init(){
        NetworkMonitor.shared.startMonitoring()
        self.locale = Locale(identifier: Bundle.main.preferredLocalizations.first ?? "en")
    }
    
    var body: some Scene {
        WindowGroup {
            AppMasterView(viewModel: .init())
        }
    }
}
