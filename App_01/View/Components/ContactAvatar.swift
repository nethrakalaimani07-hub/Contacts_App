//
//  ContactAvatar.swift
//  App_01
//
//  Created by Nethra Kalaimani on 30/10/26.
//

import SwiftUI

struct ContactAvatar: View {
    let imageData: Data?
    let initials: String
    var size: CGFloat = 40

    var body: some View {
        Group {
            if let imageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
            } else {
                ZStack {
                    Circle().fill(Color.appPrimary)
                    
                    Text(initials)
                        .font(.system(size: size * 0.38, weight: .semibold))
                        .foregroundColor(Color.customAvatarText)
                }
            }
        }
        .frame(width: size, height: size)
        .clipShape(Circle())
    }
}

#Preview {
    ContactAvatar(imageData: nil, initials: "N", size: 90)
}
