//
//  ExploreViewModel.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 07/04/2023.
//

import SwiftUI


class ExploreViewModel: BaseViewModel<ExploreViewModel.State, ExploreViewModel.Action>, NetworkHelper {
    
    struct State {
        var viewState: ViewState = .loading
        var pageIndex: Int = 0
        var photoList: [PhotoModel] = []
        var shouldPaginate = true
    }
    
    enum Action {
        case fetchPhotos(atPage: PageIndex)
        case photoListResponse(Result<[PhotoModel]?, NetworkError>)
        case getNextPageIfNeeded
        case didSelectPhoto(article: PhotoModel)
    }
    
    init() {
        super.init(state: .init())
    }
    
    override func trigger(_ action: Action) {
        switch action {
        case .fetchPhotos(let atPage):
            guard isConnectedToInternet() else {
                // Should Show Network disclaimer
                // load offline List
                return
            }
            
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
                    state.photoList.removeAll()
                } else {
                    if state.pageIndex == 0 { state.photoList.removeAll() }
                    state.photoList.append(contentsOf: photos.insertingAdPlaceholder(.adModel, afterEveryNthElement: 5))
                    state.photoList.append(.adModel)
                    state.viewState = .loaded
                }
            } else {
                state.viewState = .serverError(description: "")
            }
        case .photoListResponse(.failure(let error)):
            state.viewState = failHandler(error)
        case .getNextPageIfNeeded:
            trigger(.fetchPhotos(atPage: .next))
        case .didSelectPhoto(let article):
            break
        }
    }
}
