//
//  TargetType.swift
//  iOS-MVVM-C
//
//  Created by dhruvik.rao on 30/06/2021.
//

import Foundation

public protocol TargetType {

    /// The target's base `URL`.
    var baseURL: URL { get }

    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get }

    /// The HTTP method used in the request.
    var method: Core.Method { get }
    
    /// overridable if you really want to (i.e. for BodyFormat.jsonData)
    var body: Data? { get }
    
    var headers: [String: String]? { get }
        
    var cachePolicy: URLRequest.CachePolicy { get }
}

extension TargetType {
    
    public func fetchData(with completion: @escaping (Result<Data, Error>) -> Void) {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        let task = session.dataTask(with: URLRequest(url: url())) { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                guard let data = data else {
                    completion(.failure(error ?? CustomError.customError))
                    return
                }
                completion(.success(data))
            } else {
                completion(.failure(error ?? CustomError.notSuccessResponse))
            }
        }
        task.resume()
    }
    
    public func url() -> URL {
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)
        components?.path = path
        guard let url = components?.url else {
            return baseURL
        }
        return url
    }
}


public enum CustomError: Error {
    case customError
    case notSuccessResponse
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .customError:
            return NSLocalizedString("Customized Error.", comment: "Custom error")
        case .notSuccessResponse:
            return NSLocalizedString("Status code not 200.", comment: "custom error")
        }
    }
}
