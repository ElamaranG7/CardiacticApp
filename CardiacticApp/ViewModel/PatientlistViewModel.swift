//
//  PatientlistViewModel.swift
//  CardiacticApp
//
//  Created by SAIL on 24/10/24.
//


import UIKit

class PatientlistViewModel {
    
    func patientListApiCall(completion: @escaping ([PatientListData]?,Bool, String) -> Void) {
        
        APIHandler().apiRequest(type: PatientListModel.self, apiUrl: APIList().url(for: .dPatientListUrl), method: .post, formData: [:]) { result in
            switch result {
            case .success(let data):
                    let patientStatus = data.status ?? false
                    completion(data.data, patientStatus, data.message ?? "")
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(nil, false, "Server Error")
            }
        }
    }
}
