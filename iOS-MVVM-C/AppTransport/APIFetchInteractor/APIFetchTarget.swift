//
//  APIFetchTarget.swift
//  iOS-MVVM-C
//
//  Created by dhruvik.rao on 01/07/2021.
//

import Foundation

public enum APIFetchTarget {
    /// /posts
    case getPosts
}

extension APIFetchTarget: APIFetchTargetType {
    public var path: String {
        switch self {
        case .getPosts:
            return "/posts"
        }
    }
    
    public var method: Core.Method {
        switch self {
        case .getPosts:
            return .get
        }
    }
    
    public var parameters: [String : Any]? {
        switch self {
        case .getPosts:
            return nil
        }
    }
    
    public var body: Data? {
        return nil
    }
    
    public var headers: [String : String]? {
        return nil
    }
    
    public var cachePolicy: URLRequest.CachePolicy {
        return .reloadIgnoringLocalAndRemoteCacheData
    }
}

