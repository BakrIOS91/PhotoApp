//
//  SplashView.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 06/04/2023.
//

import SwiftUI

struct SplashView: View {
    @ObservedObject var viewModel: SplashViewModel

    var body: some View {
        ZStack {
            Image.splash
                .resizable()
                .ignoresSafeArea()
                .opacity(0.7)
            
            Image.appLogo
                .resizable()
                .frame(width: 180, height: 180, alignment: .center)
                .clipShape(
                    RoundedRectangle(cornerRadius: 30)
                )
        }
        .onAppear {
            viewModel.trigger(.onAppear)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        LocalePreview {
            SplashView(viewModel: .init())
        }
    }
}
