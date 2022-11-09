//
//  Resource.swift
//  NewAgeSysTest
//
//  Created by WC-64 on 09/11/22.
//  Copyright © 2022 Farhan. All rights reserved.
//

import Foundation
import Alamofire


/// Resource is reponsible for creating URL Request, is confirmed to URLRequestConvertible protocol
struct Resource<T:Codable> : URLRequestConvertible {
    
    private var route : Route
    private var parameters : Parameters?
    private var method : HTTPMethod
    
    
    /// Creating a Resource object for API call
    /// - Parameters:
    ///   - route: End point of URL, Make sure that you have added endpoints in Route File.
    ///   - method: HTTPMethod Request type for the corresponding endpoint.
    ///   - parameters: Parameters for the api.
    init(route: Route,method: HTTPMethod = HTTPMethod.get,parameters: Parameters? = nil) {
        self.route = route
        self.method = method
        self.parameters = parameters
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try route.url.asURL()
        var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 40)
        urlRequest.method = method
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        if let params = parameters {
            switch method {
            case .post :
                do {
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
                } catch {
                    throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
                }
            case .get :
                if let parameters = self.parameters {
                    urlRequest.url = url.addingQuery(parameters: parameters)
                }
            default:
                break
            }
        }
        return urlRequest
    }
    
    
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}



extension URL {
    func addingQuery(parameters:Parameters) -> URL {
        guard var urlComponents = URLComponents(string: self.absoluteString) else { return self }
        urlComponents.queryItems = parameters.map({URLQueryItem(name: $0, value: "\($1)")})
        return urlComponents.url!
    }
}
