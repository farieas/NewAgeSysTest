//
//  APODLisitingViewModel.swift
//  NewAgeSysTest
//
//  Created by WC-64 on 09/11/22.
//  Copyright © 2022 Farhan. All rights reserved.
//

import Foundation

class APODLisitingViewModel : BaseViewModel {
    
   
    var apodListData : [APOD]?
    
    var numberOfApods : Int {
        self.apodListData?.count ?? 0
    }
    
    override init() {
        super.init()
        self.fetchData()
    }
    
    func fetchData() {
        // apodList is an async task, this context doesn't support concurrency.
        Task.init {
            apodListData = await apodList()
            updateView()
        }
    }
    
    // MARK: - Fetch APOD list from remote
    private func apodList() async -> [APOD] {
        let requestParam : MyParam = ["api_key":"DEMO_KEY","count":"10"]
        let resource = Resource<[APOD]>(route: .apodList,parameters: requestParam)
        do {
            let result = try await apiService.performReques(resourse: resource)
            switch result {
            case .success(let response):
                return response
            case .failure(let error ):
                print("Oops !! Request failure ::::",error.localizedDescription)
            }
        } catch (let err) {
            print("Oh no !! Somethong went wrong err ::::",err.localizedDescription)
        }
        return []
    }
    
    
    func itemAt(at index:Int) -> APOD? {
        self.apodListData?[index]
    }
    
    
    
}
