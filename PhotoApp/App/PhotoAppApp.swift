//
//  PhotoAppApp.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 07/04/2023.
//

import SwiftUI

@main
struct PhotoAppApp: App {
    var body: some Scene {
        WindowGroup {
            AppMasterView(viewModel: .init())
        }
    }
}
