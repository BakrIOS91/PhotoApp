//
//  LanguageSelectionView.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 06/04/2023.
//

import SwiftUI

struct LanguageSelectionView: View {
    @ObservedObject var viewModel: LanguageSelectionViewModel

    var body: some View {
        VStack(spacing: 10) {
            Image.languageSelection
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.appMainBlue)
                .padding()
            
            Text(Str.lsPleaseChooseLanguage.key)
                .font(.boldWithSize20)
                .multilineTextAlignment(.center)
            
            VStack(spacing: 10){
                ForEach(Locale.appSupported, id: \.self) { locale in
                    Button {
                        viewModel.trigger(.didSelectLanguage(locale))
                    } label: {
                        HStack {
                            languageFlagIconImageView(locale)
                                .frame(width: 35, height: 35)
                            
                            Text("\(locale.languageCode ?? "")".localizedStringKey)
                            
                        }
                        .frame(width: 200)
                        .padding()
                        .background(Color.appMainBlue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
    }
    
    @ViewBuilder
    fileprivate func languageFlagIconImageView(_ locale: Locale) -> some View {
        switch locale {
        case .en:  Image.britain.resizable()
        case .ar: Image.egypt.resizable()
        default: EmptyView()
        }
    }
}

struct LanguageSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        LocalePreview {
            LanguageSelectionView(viewModel: .init())
        }
    }
}
