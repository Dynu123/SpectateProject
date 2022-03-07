//
//  AppError.swift
//  Spectate_Dyana
//
//  Created by Dyana Varghese on 27/02/22.
//

import Foundation

class AppError: ObservableObject {
    static let shared = AppError()
    private init() {}
    
    @Published var message: String? = "Something went wrong"
}
