//
//  User.swift
//  LoadingImagesExercises
//
//  Created by C4Q on 11/28/17.
//  Copyright © 2017 raptrous solutions. All rights reserved.
//

import Foundation

struct UserInfo: Codable {
    let results: [User]
}
struct User: Codable {
    let name: Names
    let dob: String
    let phone: String
    let cell: String
    let picture: PictureLinks?
    let location: Location
}
struct Names: Codable {
    let first: String
    let last: String
}
struct PictureLinks: Codable {
    let large: String
    let thumbnail: String
}
struct Location: Codable {
    let street: String
    let city: String
    let state: String
    let postcode: Int
}

