//
//  AppointmentsListViewModel.swift
//  CardiacticApp
//
//  Created by SAIL on 25/10/24.
//


import UIKit

class AppointmentsListViewModel {
    
    func appointmentsListApiCall(completion: @escaping ([AppointmentsListData]?,Bool,String) -> Void) {
        
        APIHandler().apiRequest(type: AppointmentsListModel.self, apiUrl: APIList().url(for: .dAppointmentListUrl), method: .post, formData: [:]) { result in
            switch result {
            case .success(let data):
                    let status = data.status ?? false
                    completion(data.data, status, data.message ?? "")
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(nil, false, "Server Error")
                }
        }
    }
}
