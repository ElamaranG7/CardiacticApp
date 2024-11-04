//
//  ProfileViewModel.swift
//  CardiacticApp
//
//  Created by SAIL on 25/10/24.
//


import UIKit

class ProfileViewModel {
    
    func profileApiCall(userInfo:[String: String],completion: @escaping (ProfileDataModel?) -> Void) {
        
        APIHandler().apiRequest(type: ProfileDataModel.self, apiUrl: APIList().url(for: .dProfileUrl), method: .post, formData: userInfo) { result in
            switch result {
            case .success(let data):
                completion(data)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                completion(nil)
                }
        }
    }
}
