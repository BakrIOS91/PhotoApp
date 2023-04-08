//
//  AdsCell.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 08/04/2023.
//

import SwiftUI
import WebKit

struct AdsCell: UIViewRepresentable {
    private var adsItems = ["vodafone_1", "vodafone_2", "vodafone_3"]
       
       func makeUIView(context: Context) -> WKWebView {
           return WKWebView()
       }
       
       func updateUIView(_ uiView: WKWebView, context: Context) {
           guard let url = Bundle.main.url(forResource: adsItems.randomElement(), withExtension: "gif") else {
               return
           }
           
           let request = URLRequest(url: url)
           uiView.load(request)
       }
}

struct AdsCell_Previews: PreviewProvider {
    static var previews: some View {
        AdsCell()
    }
}
