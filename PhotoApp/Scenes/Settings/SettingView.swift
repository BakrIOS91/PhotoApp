//
//  SettingView.swift
//  

import SwiftUI

struct SettingView: View {
    @Preference(\.locale) var locale
    @ObservedObject var viewModel: SettingsViewModel
    var body: some View {
            VStack{
                Str.tbSettings.textView
                    .font(.boldWithSize20)
                    .padding()
                Divider()
                
                Button(action: {
                    viewModel.trigger(.didPressChangeLanguage)
                }, label: {
                    HStack{
                        Str.settingsCurrentLanguages.textView
                            .font(.mediumWithSize16)
                        Spacer()
                        HStack{
                            Text("\(locale?.languageCode ?? "")".localizedStringKey)
                                .font(.mediumWithSize16)

                            Image(systemName: "chevron.forward")
                        }
                    }
                })
                .foregroundColor(.black)
                .padding()

                Spacer()
                
            }
            .padding()
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        LocalePreview{
            SettingView(viewModel: .init())
        }
    }
}
