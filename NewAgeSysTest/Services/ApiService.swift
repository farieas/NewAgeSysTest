//
//  ApiService.swift
//  NewAgeSysTest
//
//  Created by WC-64 on 09/11/22.
//  Copyright © 2022 Farhan. All rights reserved.
//

import Foundation
import Alamofire

typealias Response<T:Codable> = (Result<T, AFError>)
typealias MyParam = [String:Any]

class ApiSerivce {
    
    static let shared = ApiSerivce()
    
    /// Method Perform Request responsible for the api calls, Task which takes a Generic type and is an async task
    /// - Parameter resourse: Resource conforms to URLRequestConvertible
    /// - Returns: Returns the result of Type given in Resource
    func performReques<T>(resourse:Resource<T>) async throws -> Response<T> {
        return try await withCheckedThrowingContinuation({ continuation in
            AF.request(resourse).responseDecodable { (response: DataResponse<T, AFError>) in
                debugPrint("======== Response ===========")
                debugPrint(response)
                debugPrint("======== End ===========")
                switch response.result {
                case .success(let result):
                    continuation.resume(returning: .success(result))
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        })
    }
    
    
}
