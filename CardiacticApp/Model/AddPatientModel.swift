//
//  AddPatientModel.swift
//  CardiacticApp
//
//  Created by SAIL on 04/11/24.
//


import Foundation

// MARK: - AddPatientModel
struct AddPatientModel: Codable {
    let status: Bool
    let message, patientID: String

    enum CodingKeys: String, CodingKey {
        case status, message
        case patientID = "patient_id"
    }
}