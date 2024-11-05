//
//  AddPatientViewModel.swift
//  CardiacticApp
//
//  Created by SAIL on 04/11/24.
//


import UIKit

class AddPatientViewModel {
    
    func addPatientApiCall (params: [String: Any],complition: @escaping (AddPatientModel?) -> Void) {
        
        APIHandler().apiRequest(type: AddPatientModel.self, apiUrl: APIList().url(for: .dAddPatientUrl), method: .post, formData: params) { result in
            switch result {
                
            case .success(let response):
                
                complition(response)
                
            case .failure(let error):
                
                complition(nil)
            }
            
        }
    }
}
