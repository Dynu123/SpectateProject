//
//  Endpoint.swift
//  Spectate_Dyana
//
//  Created by Dyana Varghese on 27/02/22.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var baseUrl: String { get }
    var path: String { get }
    var parameters: [URLQueryItem] { get }
    var method: String { get }
}
