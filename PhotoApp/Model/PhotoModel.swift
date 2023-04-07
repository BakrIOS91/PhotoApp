//
//  PhotoModel.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 07/04/2023.
//

import Foundation
struct PhotoModel: Codable {
    var id, author: String?
    var width, height: Int?
    var url, downloadURL: String?

    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
    
    static let fake: Self = .init(
        id: "0",
        author: "Alejandro Escamilla",
        width: 5000,
        height: 3333,
        url: "https://unsplash.com/photos/yC-Yzbqy7PY",
        downloadURL: "https://picsum.photos/id/0/5000/3333"
    )
}
