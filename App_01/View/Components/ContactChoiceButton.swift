//
//  ContactChoiceButton.swift
//  App_01
//
//  Created by Nethra Kalaimani on 05/11/26.
//


import SwiftUI

struct ContactChoiceButton<T: View>: View {
    let options: [String]
    let onPick: (String) -> Void
    @ViewBuilder let label: () -> T

    var body: some View {
        if options.count > 1 {
            Menu {
                ForEach(options, id: \.self) { option in
                    Button(option) {
                        onPick(option)
                    }
                }
            } label: {
                label()
            }
            .menuStyle(.borderlessButton)
        } else {
            Button {
                if let onlyOption = options.first {
                    onPick(onlyOption)
                }
            } label: {
                label()
            }
            .buttonStyle(.borderless)
        }
    }
}
