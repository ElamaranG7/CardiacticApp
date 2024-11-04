//
//  LoginViewModel.swift
//  CardiacticApp
//
//  Created by SAIL on 05/09/24.
//

import Foundation
import UIKit

class LoginViewModel {
    
        
    func loginApiCall(userInfo:[String: String],completion: @escaping (LoginModel?) -> Void) {
        
        APIHandler().apiRequest(type: LoginModel.self, apiUrl: APIList().url(for: .dLoginUrl), method: .post, formData: userInfo) { result in
            switch result {
            case .success(let data):
                
                completion(data)
                
            case .failure(let error):
                print(error)
                completion (nil)
                
            }
        }
    }
    
    
}
