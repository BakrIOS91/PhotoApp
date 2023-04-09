//
//  ExploreViewModel.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 07/04/2023.
//

import SwiftUI


class ExploreViewModel: BaseViewModel<ExploreViewModel.State, ExploreViewModel.Action>, NetworkHelper {
    @Preference(\.offlinePhotosList) var offlinePhotosList
    struct State {
        var viewState: ViewState = .loading
        var pageIndex: Int = 0
        var photoList: [PhotoModel] = []
        var shouldPaginate = true
        
        // viewmodel
        var photoDetailedViewModel: PhotoDetailedViewModel?
    }
    
    enum Action {
        case fetchPhotos(atPage: PageIndex)
        case photoListResponse(Result<[PhotoModel]?, NetworkError>)
        case getNextPageIfNeeded
        case didSelectPhoto(Image?, Color?)
    }
    
    init() {
        super.init(state: .init())
        trigger(.fetchPhotos(atPage: .first))
    }
    
    override func trigger(_ action: Action) {
        switch action {
        case .fetchPhotos(let atPage):
            guard isConnectedToInternet() else {
                // Should Show Network disclaimer
                // load offline List
                
                state.shouldPaginate = false
                state.photoList = offlinePhotosList.filter({ $0.downloadURL != nil })
                state.viewState = .loaded
                return
            }
            
            state.shouldPaginate = true

            if atPage == .first {
                if state.photoList.isEmpty {
                    state.viewState = .loading
                }
                state.pageIndex = 0
            } else {
                state.pageIndex += 1
            }
            
            Task { [pageIndex = state.pageIndex] in
                await trigger(.photoListResponse(PhotoServices.shared.getPhotosList(pageIndex)))
            }
            
        case .photoListResponse(.success(let response)):
            if let photos = response {
                if state.pageIndex == 0 , photos.isEmpty {
                    state.viewState = .noData(description: "")
                    updateItems([])
                } else {
                    if state.pageIndex == 0 { updateItems([]) }
                    updateItems(photos.insertingAdPlaceholder(.adModel, afterEveryNthElement: 5))
                    state.viewState = .loaded
                }
            } else {
                state.viewState = .serverError(description: "")
            }
        case .photoListResponse(.failure(let error)):
            state.viewState = failHandler(error)
        case .getNextPageIfNeeded:
            trigger(.fetchPhotos(atPage: .next))
        case .didSelectPhoto(let image, let color):
            guard let selectedImage = image,
                  let selectedImageAverageColor = color
            else {
                return
            }
            
            state.photoDetailedViewModel = .init(selectedImage: selectedImage, selectedImageAverageColor: selectedImageAverageColor)
        }
    }
    
    fileprivate func updateItems(_ list: [PhotoModel]) {
        guard !list.isEmpty else {
            state.photoList.removeAll()
            offlinePhotosList.removeAll()
            return
        }
        
        state.photoList.append(contentsOf: list)
        offlinePhotosList.append(contentsOf: list)
        debugPrint(state.photoList.map({$0.isAdModel}))
        debugPrint(Preferences.shared.offlinePhotosList.map({$0.isAdModel}))
    }
}
