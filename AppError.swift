//
//  AppError.swift
//  LoadingImagesExercises
//
//  Created by C4Q on 11/28/17.
//  Copyright © 2017 raptrous solutions. All rights reserved.
//

import Foundation

enum AppError: Error {
    case unauthenticated
    case invalidJSONResponse
    case couldNotParseJSON(rawError: Error)
    case noInternetConnection
    case badURL
    case badStatusCode
    case noDataReceived
    case notAnImage
    case other(rawError: Error)
}
