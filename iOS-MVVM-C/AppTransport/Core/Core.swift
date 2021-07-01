//
//  Core.swift
//  iOS-MVVM-C
//
//  Created by dhruvik.rao on 30/06/2021.
//

import Foundation

public class Core {
    public enum Method: Equatable {
        case get
        case post
        case put
        case delete

        var httpMethod: String {
            switch self {
            case .get: return "GET"
            case .post: return "POST"
            case .put: return "PUT"
            case .delete: return "DELETE"
            }
        }
    }
}
