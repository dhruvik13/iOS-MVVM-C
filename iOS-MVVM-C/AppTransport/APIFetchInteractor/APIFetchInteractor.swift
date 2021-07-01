//
//  APIFetchInteractor.swift
//  iOS-MVVM-C
//
//  Created by dhruvik.rao on 01/07/2021.
//

import Foundation

class APIFetchInteractor {
    func fetchPosts(completion: @escaping (Result<Posts?, Error>) -> Void) {
        APIFetchTarget.getPosts.fetchContent { result in
            switch result {
            case .success(let jsonData):
                let decodedResponse = try? JSONDecoder().decode(Posts.self, from: jsonData)
                completion(.success(decodedResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

