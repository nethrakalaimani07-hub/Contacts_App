//
//  AdditionalFieldsList.swift
//  App_01
//
//  Created by Nethra Kalaimani on 29/10/26.
//

import SwiftUI

struct AdditionalFieldsList: View {
    let title: String
    let fieldLabel: String
    let placeholder: String
    @Binding var entries: [String]
    var keyboardType: UIKeyboardType = .default

    var validate: (String) -> String?
 
    @State private var errors: [String?] = []

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(entries.indices, id: \.self) { index in
                HStack(alignment: .bottom, spacing: 8) {
                    LabeledFormField(
                        label: "\(fieldLabel) \(index + 2)",
                        placeholder: placeholder,
                        text: $entries[index],
                        errorMessage: errors.indices.contains(index) ? errors[index] : nil,
                        keyboardType: keyboardType
                    )
                    .onChange(of: entries[index]) {
                        withAnimation {
                            updateError(at: index)
                        }
                    }

                    Button {
                        withAnimation {
                            entries.remove(at: index)
                            if errors.indices.contains(index) {
                                errors.remove(at: index)
                            }
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

            Button {
                withAnimation {
                    entries.append("")
                    errors.append(nil)
                }
            } label: {
                Label(title, systemImage: "plus.circle.fill")
                    .foregroundStyle(Color.appPrimary)
            }
        }
    }

    private func updateError(at index: Int) {
        guard entries.indices.contains(index) else { return }
        while errors.count <= index {
            errors.append(nil)
        }
        errors[index] = validate(entries[index])
    }
}
