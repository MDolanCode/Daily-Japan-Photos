//
//  JapanPhotoModel.swift
//  Daily Japan Photos
//
//  Created by Matt Dolan External macOS on 2021-09-05.
//

import Foundation

// MARK: - JapanPhotoModel
struct JapanPhotoModel: Decodable {
    let total, totalHits: Int
    let hits: [Hit]
}

// MARK: - Hit
struct Hit: Decodable {
    let largeImageURL: String

    enum CodingKeys: String, CodingKey {
        case largeImageURL
    }
}
