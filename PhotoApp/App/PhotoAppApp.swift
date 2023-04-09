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
       configureNavigationBarAppearance()
        NetworkMonitor.shared.startMonitoring()
        self.locale = Locale(identifier: Bundle.main.preferredLocalizations.first ?? "en")
    }
    
    var body: some Scene {
        WindowGroup {
            AppMasterView(viewModel: .init())
        }
    }
    
    fileprivate func configureNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.backgroundColor = .white
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
