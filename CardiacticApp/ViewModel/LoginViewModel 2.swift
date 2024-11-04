//
//  LoginViewModel 2.swift
//  CardiacticApp
//
//  Created by SAIL on 30/10/24.
//


import Foundation

class LoginViewModel {
    private let apiHandler = APIHandler()
    
    // Observable properties
    var loginStatus: ((Bool, String?) -> Void)?
    
    func loginApiCall(userInfo: [String: String]) {
        apiHandler.apiRequest(type: LoginModel.self, apiUrl: APIList().url(for: .dLoginUrl), method: .post, formData: userInfo) { result in
            switch result {
            case .success(let data):
                // Pass success status and message back to VC via closure
                self.loginStatus?(data.status, data.message)
            case .failure(let error):
                print("API Error: \(error)")
                // On failure, return a default failure message
                self.loginStatus?(false, "Login failed due to network error.")
            }
        }
    }
}
