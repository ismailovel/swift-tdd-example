//
//  SignupErrors.swift
//  PhotoApp
//
//  Created by Ismailov on 28.10.2025.
//

import Foundation

enum SignupError: LocalizedError, Equatable {
    
    case invalidResponseModel
    case invalidRequestURLString
    case failedRequest(description: String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponseModel, .invalidRequestURLString:
            return ""
        }
    }
}
