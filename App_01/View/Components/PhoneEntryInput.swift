//
//  PhoneEntryInput.swift
//  App_01
//

import Foundation

struct PhoneEntryInput: Identifiable {
    let id: UUID
    var countryCode: String
    var number: String
    var tagID: UUID?

    // Shown under the fields while the user is typing.
    var countryCodeError: String?
    var numberError: String?

    init(
        id: UUID = UUID(),
        countryCode: String = "+91",
        number: String = "",
        tagID: UUID? = nil
    ) {
        self.id = id
        self.countryCode = countryCode
        self.number = number
        self.tagID = tagID
    }
}
