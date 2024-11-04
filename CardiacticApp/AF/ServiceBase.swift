//
//  ServiceBase.swift
//  CardiacticApp
//
//  Created by SAIL on 05/09/24.
//

import Foundation
import Alamofire

class APIHandler {

    func apiRequest<T: Codable>(type: T.Type, apiUrl: String, method: HTTPMethod, formData: [String: Any], onCompletion: @escaping (Result<T, Error>) -> Void) {
        
        print("apiUrl -----> \(apiUrl)")
        print("formData -----> \(formData)")

        AF.request(apiUrl, method: method, parameters: formData, encoding: URLEncoding.default, headers: ["Content-Type": "application/x-www-form-urlencoded"])
            .validate() // Validates the response for success
            .responseDecodable(of: type) { response in
                switch response.result {
                case .success(let decodedData):
                    onCompletion(.success(decodedData))
                    print("ResponseData : \(decodedData)")
                case .failure(let error):
                    onCompletion(.failure(error))
                }
            }
    }

}
