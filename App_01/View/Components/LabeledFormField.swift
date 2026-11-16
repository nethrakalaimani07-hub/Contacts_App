//
//  LabeledFormField.swift
//  App_01
//
//  Created by Nethra Kalaimani on 29/10/26.
//


import SwiftUI

struct LabeledFormField: View {
    let label: String
    let placeholder: String
    @Binding var text: String
    var errorMessage: String? = nil
    var keyboardType: UIKeyboardType = .default
    var autoCaptilization: TextInputAutocapitalization = .words

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .font(.subheadline.bold())
                .foregroundStyle(Color.appSecondaryText)

            TextField(placeholder, text: $text)
                .keyboardType(keyboardType)
                .textInputAutocapitalization(autoCaptilization)
                .submitLabel(.done)
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
                
            
            FormErrorText(message: errorMessage)
        }
    }
}

