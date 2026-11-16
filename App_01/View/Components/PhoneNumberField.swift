//
//  PhoneNumberField.swift
//  App_01
//

import SwiftUI

struct PhoneNumberField: View {
    let label: String
    let placeholder: String
    @Binding var countryCode: String
    @Binding var phoneNumber: String
    var countryCodeErrorMessage: String? = nil
    var errorMessage: String? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .font(.subheadline.bold())
                .foregroundStyle(Color.appSecondaryText)

            HStack(alignment: .top, spacing: 8) {
                VStack(alignment: .leading, spacing: 4) {
                    TextField("+91", text: $countryCode)
                        .keyboardType(.phonePad)
                        .multilineTextAlignment(.center)
                        .frame(width: 56)
                        .foregroundStyle(Color.appText)
                        .tint(Color.appPrimary)
                        .padding(12)
                        .background(Color.appSurface)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(
                                    countryCodeErrorMessage == nil
                                        ? Color.appSecondaryText.opacity(0.35)
                                        : Color.red,
                                    lineWidth: 1
                                )
                        }
                }

                VStack(alignment: .leading, spacing: 4) {
                    TextField(placeholder, text: $phoneNumber)
                        .keyboardType(.phonePad)
                        .foregroundStyle(Color.appText)
                        .tint(Color.appPrimary)
                        .padding(12)
                        .background(Color.appSurface)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(
                                    errorMessage == nil
                                        ? Color.appSecondaryText.opacity(0.35)
                                        : Color.red,
                                    lineWidth: 1
                                )
                        }

                }
            }
            FormErrorText(message: countryCodeErrorMessage)
            FormErrorText(message: errorMessage)
        }
    }
}
