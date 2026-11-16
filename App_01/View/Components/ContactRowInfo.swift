//
//  ContactRowInfo.swift
//  App_01
//


import SwiftUI

struct ContactRowInfo: View {
    let name: String
    let phone: String
    let initials: String
    let profileImageData: Data?

    var showAvatar: Bool = true
    var showPhoneText: Bool = true

    var body: some View {
        HStack {
            if showAvatar {
                ContactAvatar(imageData: profileImageData, initials: initials, size: 40)
            }
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                    .foregroundStyle(Color.appText)

                if showPhoneText {
                    Text(phone)
                        .font(.subheadline)
                        .foregroundColor(Color.appSecondaryText)
                }
            }
        }
    }
}
