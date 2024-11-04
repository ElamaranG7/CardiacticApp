//
//  PatientListModel.swift
//  CardiacticApp
//
//  Created by SAIL on 24/10/24.
//

import Foundation

// MARK: - PatientListModel
struct PatientListModel: Codable {
    let status: Bool?
    let message: String?
    let data: [PatientListData]?
}

// MARK: - Datum
struct PatientListData: Codable {
    let sNo: Int?
    let patientID, name, profilePic, conditionStatus: String?
    let stage: String?

    enum CodingKeys: String, CodingKey {
        case sNo = "s.no"
        case patientID = "patient_id"
        case name
        case profilePic = "profile_pic"
        case conditionStatus = "condition_status"
        case stage
    }
}
