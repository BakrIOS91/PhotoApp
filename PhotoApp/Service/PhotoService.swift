//
//  PhotoService.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 07/04/2023.
//

import Foundation
struct PhotoServices {
    
    static var shared = PhotoServices()
    
    func getPhotosList(_ pageIndex: Int) async -> Result<[PhotoModel]?, NetworkError> {
        await APIFetcher.shared.fetch(request: GetPhotos(pageIndex: pageIndex))
    }
}
