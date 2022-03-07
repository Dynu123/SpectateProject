//
//  ServiceError.swift
//  Spectate_Dyana
//
//  Created by Dyana Varghese on 28/02/22.
//

import Foundation

enum ServiceError: Error {
    case serverError(error: Error? = nil, message: String = "")
}

extension ServiceError: LocalizedError {

    var errorDescription: String? {
        switch self {
        case .serverError(let error, let message):
            return error?.localizedDescription ?? message
        }
    }
}
