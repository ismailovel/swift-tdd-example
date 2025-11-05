//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by Ismailov on 28.10.2025.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
