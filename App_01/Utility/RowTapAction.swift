//
//  RowTapAction.swift
//  App_01
//
//  Created by Nethra Kalaimani on 06/11/26.
//

// The user picks one of these for each gesture for the row action

import Foundation

enum RowTapAction: String, CaseIterable {
    case showDetails = "Open Contact Details"
    case copyPhoneNumber = "Copy Phone Number"
    case showPreview = "Show Phone & Email Menu"
    case call = "Call"
}
