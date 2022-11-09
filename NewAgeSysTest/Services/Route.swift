//
//  Route.swift
//  NewAgeSysTest
//
//  Created by WC-64 on 09/11/22.
//  Copyright © 2022 Farhan. All rights reserved.
//

import Foundation


protocol RouteProtocol {
    var url : String { get }
}


/// Declare endpoints used by API's in your api calls
enum Route : String , RouteProtocol {
    
    // ADD Required API's here
    case apodList = "planetary/apod"
    
    
    var url : String {
        return ApiConstants.baseURL+self.rawValue
    }
    
   
}
