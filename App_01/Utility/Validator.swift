//
//  String+Validation.swift
//  App_01
//
//  Created by Nethra Kalaimani on 28/10/26.
//

import Foundation

extension String {

    var isValidName: Bool {
        !trimmingCharacters(in: .whitespaces).isEmpty
    }

    var isValidPhoneNumber: Bool {
        let trimmed = trimmingCharacters(in: .whitespaces)
        return trimmed.count == 10 && trimmed.allSatisfy { $0.isNumber }
    }

    var isValidCountryCode: Bool {
        let trimmed = trimmingCharacters(in: .whitespaces)
        guard trimmed.hasPrefix("+") else { return false }

        let digits = trimmed.dropFirst()
        return !digits.isEmpty && digits.count <= 3 && digits.allSatisfy { $0.isNumber }
    }

    // "+91 8182182812"  ->  ("+91", "8182182812")
    func splitPhoneCountryCode() -> (code: String, number: String) {
        let parts = trimmingCharacters(in: .whitespaces).components(separatedBy: " ")

        if parts.count == 2, parts[0].hasPrefix("+") {
            return (parts[0], parts[1])
        }

        return ("+91", parts[0])
    }

    var isValidEmail: Bool {
        let trimmed = trimmingCharacters(in: .whitespaces)
        if(trimmed.isEmpty) {
            return true
        }
        
        if trimmed.contains("@") &&
               trimmed.contains(".") &&
               !trimmed.hasPrefix("@") &&
               !trimmed.hasSuffix("@") &&
               !trimmed.hasPrefix(".") &&
               !trimmed.hasSuffix(".") {
                return true
            }

            return false
    }
}
