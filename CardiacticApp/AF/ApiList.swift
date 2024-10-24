//
//  ApiList.swift
//  CardiacticApp
//
//  Created by SAIL on 05/09/24.
//

import Foundation

struct APIList {
    
    static let baseURL = "http://localhost/cardiac/"

    func url(for endpoint: Endpoint) -> String {
        return "\(APIList.baseURL)\(endpoint.rawValue)"
    }
}

enum Endpoint: String {
    
    case dLoginUrl = "login_doc.php"
    
}
