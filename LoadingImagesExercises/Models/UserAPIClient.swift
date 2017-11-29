//
//  UserAPIClient.swift
//  LoadingImagesExercises
//
//  Created by C4Q on 11/28/17.
//  Copyright © 2017 raptrous solutions. All rights reserved.
//

import Foundation

struct UserAPIClient {
    private init() {}
    static let manager = UserAPIClient()
    func getUsers(from urlStr: String, completiongHandler: @escaping ([User]) -> Void, errorHandler: @escaping (AppError) -> Void) {
        guard let url = URL(string: urlStr) else {
            errorHandler(.badURL)
            return
        }
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let userInfo = try JSONDecoder().decode(UserInfo.self, from: data)
                let users = userInfo.results
                completiongHandler(users)
            } catch {
                errorHandler(.couldNotParseJSON(rawError: error))
            }
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: completion, errorHandler: errorHandler)
    }
}
