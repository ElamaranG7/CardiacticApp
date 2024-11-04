//
//  AppointmentsListModel.swift
//  CardiacticApp
//
//  Created by SAIL on 25/10/24.
//


import Foundation

// MARK: - AppointmentsListModel
struct AppointmentsListModel: Codable {
    let status: Bool?
    let message: String?
    let data: [AppointmentsListData]?
}

// MARK: - Datum
struct AppointmentsListData: Codable {
    let sNo: Int?
    let patientID, name, phoneNumber, time: String?
    let date, profilePic: String?

    enum CodingKeys: String, CodingKey {
        case sNo = "s.no"
        case patientID = "patient_id"
        case name
        case phoneNumber = "phone_number"
        case time, date
        case profilePic = "profile_pic"
    }
}
