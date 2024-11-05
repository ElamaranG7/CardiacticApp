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
    case dPatientListUrl = "patient_list.php"
    case dAppointmentListUrl = "myappointments_doc.php"
    case dProfileUrl = "doctor_profile_view.php"
    case dAddPatientUrl = "addpatient.php"
    
}
