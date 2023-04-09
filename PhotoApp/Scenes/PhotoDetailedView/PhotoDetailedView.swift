//
//  PhotoDetailedView.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 09/04/2023.
//

import SwiftUI

struct PhotoDetailedView: View {
    @ObservedObject var viewModel: PhotoDetailedViewModel
    var body: some View {
        ZStack {
            viewModel.state.selectedImageAverageColor.ignoresSafeArea()
            
            viewModel.state.selectedImage
                .resizable()
                .frame(height: 300)
                .scaledToFit()
                .cornerRadius(30, corners: .allCorners)
                .padding(20)
        }
        .navigationTitle(Str.detailsView.key)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PhotoDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetailedView(viewModel: .init(selectedImage: .imagePlaceholder, selectedImageAverageColor: .gray))
    }
}
