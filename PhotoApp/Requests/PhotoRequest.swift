//
//  PhotoRequest.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 07/04/2023.
//

import Foundation

struct GetPhotos: BaseRequestProtocol {
    typealias Response = [PhotoModel]
    var pageIndex: Int
    var pageSize: Int = kAppPageSize
    var path: String {"/list"}
    var httpMethod: HTTPMethod { .GET }
    var parameters: Parameters? {
        return [
            "page": pageIndex,
            "limit": pageSize
        ]
    }
    var mockResponse: [PhotoModel] = Array(repeating: PhotoModel.fake, count: 10)
}
