//
//  PostsResponse.swift
//  iOS-MVVM-C
//
//  Created by dhruvik.rao on 01/07/2021.
//

import Foundation

typealias Posts = [PostsResponse]

// MARK: - PostsResponse
struct PostsResponse: Decodable {
    let userId, id: Int
    let title, body: String
}

