//
//  String+extension.swift
//  Spectate_Dyana
//
//  Created by Dyana Varghese on 26/02/22.
//

import Foundation

extension Date {
    static func convert(string: String, from format1: String = "yyyy-MM-dd", to format2: String = "dd-MM-yyyy") -> String {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = format1
        guard let date = dateFormatter1.date(from: string) else { return ""}
        
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = format2
        let string = dateFormatter2.string(from: date)
        return string
    }
}
