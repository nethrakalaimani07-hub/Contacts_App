//
//  FavouriteButton.swift
//  App_01
//

import SwiftUI

struct FavouriteButton: View {
    let isFavourite: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: isFavourite ? "star.fill" : "star")
                .font(.title3)
                .padding(.horizontal, 6)
                .foregroundStyle(
                    isFavourite
                    ? Color.appPrimary
                    : Color.appSecondaryText.opacity(0.5)
                )
        }
        .sensoryFeedback(
                    .success,
                    trigger: isFavourite
        )
        .buttonStyle(.borderless)
    }
}
