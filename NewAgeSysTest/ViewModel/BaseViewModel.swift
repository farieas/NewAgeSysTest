//
//  BaseViewModel.swift
//  NewAgeSysTest
//
//  Created by WC-64 on 09/11/22.
//  Copyright © 2022 Farhan. All rights reserved.
//

import Foundation

typealias UpdateCallBack = () -> ()

protocol BaseViewModelProtocol {
    var apiService : ApiSerivce { get }
    var updateCallback : UpdateCallBack { get set }
}


class BaseViewModel : BaseViewModelProtocol {
    
    var apiService: ApiSerivce = ApiSerivce.shared
    
    var updateCallback: UpdateCallBack = {}
    
    func updateView() {
        DispatchQueue.main.async { [weak self] in
            self?.updateCallback()
        }
    }
    
    
}
