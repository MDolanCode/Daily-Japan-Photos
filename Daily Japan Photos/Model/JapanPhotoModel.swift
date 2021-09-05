//
//  JapanPhotoModel.swift
//  Daily Japan Photos
//
//  Created by Matt Dolan External macOS on 2021-09-05.
//

import Foundation

struct JapanPhotoModel: Decodable {
    let hits: [Hit]
}

struct Hit: Decodable {
    let pageURL: String
}
