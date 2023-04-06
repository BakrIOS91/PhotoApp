//
//  AppMasterView.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 05/04/2023.
//

import SwiftUI

struct AppMasterView: View {
    @ObservedObject var viewModel: AppMasterViewModel
    @Preference(\.rootView) var rootView
    
    var body: some View {
        LocalizedContentView {
            switch rootView {
            case .splash:
                UnImplmentedView()
            case .language:
                UnImplmentedView()
            case .home:
                UnImplmentedView()
            default:
                UnImplmentedView()
            }
        }
        .onAppear {
            viewModel.trigger(.onAppear)
        }
    }
}

struct AppMasterView_Previews: PreviewProvider {
    static var previews: some View {
        LocalePreview {
            AppMasterView(viewModel: .init())
        }
    }
}
