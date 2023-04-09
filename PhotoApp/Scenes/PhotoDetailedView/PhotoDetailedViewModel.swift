//
//  PhotoDetailedViewModel.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 09/04/2023.
//

import SwiftUI

class PhotoDetailedViewModel: BaseViewModel<PhotoDetailedViewModel.State, PhotoDetailedViewModel.Action>, NetworkHelper {
    
    struct State {
        var selectedImage: Image
        var selectedImageAverageColor: Color
    }
    
    enum Action {}
    
    init(
        selectedImage: Image,
        selectedImageAverageColor: Color
    ) {
        super.init(state: .init(selectedImage: selectedImage, selectedImageAverageColor: selectedImageAverageColor))
    }
    
    override func trigger(_ action: Action) {}
}
