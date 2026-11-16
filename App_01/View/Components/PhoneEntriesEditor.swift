//
//  PhoneEntriesEditor.swift
//  App_01
//
//  one or more phone numbers for a contact. Each
//  number has its own country code and its own tag.
//

import SwiftUI

struct PhoneEntriesEditor: View {
    @Binding var entries: [PhoneEntryInput]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach($entries) { $entry in
                VStack(alignment: .leading, spacing: 10) {
                    HStack(alignment: .bottom, spacing: 8) {
                        PhoneNumberField(
                            label: "Phone",
                            placeholder: "e.g. 9876543210",
                            countryCode: $entry.countryCode,
                            phoneNumber: $entry.number,
                            countryCodeErrorMessage: entry.countryCodeError,
                            errorMessage: entry.numberError
                        )
                        .onChange(of: entry.countryCode) {
                            entry.countryCodeError = entry.countryCode.isValidCountryCode
                                ? nil
                                : "Enter a valid country code, e.g. +91."
                        }
                        .onChange(of: entry.number) {
                            entry.numberError = entry.number.isEmpty || entry.number.isValidPhoneNumber
                                ? nil
                                : "Enter a valid phone number (exactly 10 digits)."
                        }

                        if entries.count > 1 {
                            Button {
                                withAnimation {
                                    entries.removeAll { $0.id == entry.id }
                                }
                            } label: {
                                Image(systemName: "minus")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundStyle(.white)
                                    .frame(width: 34, height: 34)
                                    .background(.red, in: Circle())
                            }
                            .buttonStyle(.plain)
                            .offset(y: -10)
                        }
                    }

                    PhoneTagField(tagID: $entry.tagID)
                }
            }

            Button {
                withAnimation {
                    entries.append(PhoneEntryInput())
                }
            } label: {
                Label("Add another phone", systemImage: "plus.circle.fill")
                    .foregroundStyle(Color.appPrimary)
            }
        }
    }
}
