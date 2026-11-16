//
//  ContactTagViewModel.swift
//  App_01
//

import Foundation
import Observation

@Observable
class ContactTagViewModel {

    static let friendTag = ContactTag("Friend")
    static let workTag = ContactTag("Work")
    static let homeTag = ContactTag("Home")
    static let otherTag = ContactTag("Other")
    static let mobileTag = ContactTag("Mobile")
    static let familyTag = ContactTag("Family")

    private var _tags: Set<ContactTag> = [
        ContactTagViewModel.friendTag,
        ContactTagViewModel.workTag,
        ContactTagViewModel.homeTag,
        ContactTagViewModel.otherTag,
        ContactTagViewModel.mobileTag,
        ContactTagViewModel.familyTag
    ]

    // All tags, sorted alphabetically for picker display.
    var tags: [ContactTag] {
        _tags.sorted { first, second in
            return first.tagName < second.tagName
        }
    }

    func addTag(name: String) -> ContactTag {
        let trimmedName = name.trimmingCharacters(in: .whitespaces)

        if let existingTag = _tags.first(where: { $0.tagName.caseInsensitiveCompare(trimmedName) == .orderedSame }) {
            return existingTag
        }

        let newTag = ContactTag(trimmedName)
        _tags.insert(newTag)
        return newTag
    }

    func renameTag(id: UUID, to newName: String) {
        let trimmedName = newName.trimmingCharacters(in: .whitespaces)
        guard !trimmedName.isEmpty,
              let existingTag = _tags.first(where: { $0.id == id })
                else { return }

        _tags.remove(existingTag)
        _tags.insert(ContactTag(id: id, trimmedName))
    }

    func deleteTag(id: UUID) {
        guard let existingTag = _tags.first(where: { $0.id == id })
                else { return }

        _tags.remove(existingTag)
    }

    func getTagById(withID id: UUID?) -> ContactTag? {
        guard let id else { return nil }
        return tags.first { $0.id == id }
    }
}
