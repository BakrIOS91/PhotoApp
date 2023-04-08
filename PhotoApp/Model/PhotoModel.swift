//
//  PhotoModel.swift
//  PhotoApp
//
//  Created by Bakr mohamed on 07/04/2023.
//

import Foundation
import SwiftUI

struct PhotoModel: Codable {
    var id: UUID = UUID()
    var author: String?
    var width, height: Int?
    var url, downloadURL: String?
    var isAdModel: Bool = false

    enum CodingKeys: String, CodingKey {
        case  author, width, height, url
        case downloadURL = "download_url"
    }
    
    static let fake: Self = .init(
        author: "Alejandro Escamilla",
        width: 5000,
        height: 3333,
        url: "https://unsplash.com/photos/yC-Yzbqy7PY",
        downloadURL: "https://picsum.photos/id/0/5000/3333"
    )
    
    static let adModel: Self = .init(
        downloadURL: "",
        isAdModel: true
    )
}
