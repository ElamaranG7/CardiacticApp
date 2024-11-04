//
//  ProfileDataModel.swift
//  CardiacticApp
//
//  Created by SAIL on 25/10/24.
//


import Foundation

// MARK: - ProfileDataModel
struct ProfileDataModel: Codable {
    let status: Bool
    let message: String
    let data: ProfileData
}

// MARK: - DataClass
struct ProfileData: Codable {
    let doctorID, name: String
    let age: Int
    let gender, phoneNumber, password, address: String
    let profileDoc: String

    enum CodingKeys: String, CodingKey {
        case doctorID = "doctor_id"
        case name, age, gender
        case phoneNumber = "phone_number"
        case password, address
        case profileDoc = "profile_doc"
    }
}
