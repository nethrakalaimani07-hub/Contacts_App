//
//  FormErrorText.swift
//  App_01
//
//  Created by Nethra Kalaimani on 28/10/26.
//

import SwiftUI

struct FormErrorText: View {
    let message: String?

    var body: some View {
        if let message {
            Text(message)
                .font(.caption)
                .foregroundColor(.red)
        }
    }
}
