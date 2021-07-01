//
//  TargetType+APIFetchTargetType.swift
//  iOS-MVVM-C
//
//  Created by dhruvik.rao on 01/07/2021.
//

import Foundation

public let APIhostName = "jsonplaceholder.typicode.com"

public protocol APIFetchTargetType: TargetType { }

extension APIFetchTargetType {
    var hostname: String {
        return APIhostName
    }

    public var baseURL: URL {
        return URL(string: "https://\(self.hostname)")!
    }
    
    public func fetchContent(completion: @escaping (Result<Data, Error>) -> Void) {
        fetchData(with: completion)
    }
}

