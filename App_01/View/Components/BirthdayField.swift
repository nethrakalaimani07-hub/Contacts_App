import SwiftUI

struct BirthdayField: View {
    @Binding var birthday: Date?

    @State private var selectedDate = Date()
    @State private var showingDatePicker = false

    private var birthdayText: String {
        guard let birthday else {
            return "DD / MM / YYYY"
        }

        return birthday.formatted(
            Date.FormatStyle()
                .day(.twoDigits)
                .month(.twoDigits)
                .year()
        )
    }

    var body: some View {
        HStack(spacing: 12) {
            Text("Birthday")
                .font(.body.weight(.semibold))
                .foregroundStyle(Color.appSecondaryText)

            Spacer()

            Button {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                selectedDate = birthday ?? Date()
                showingDatePicker = true
            } label: {
                HStack(spacing: 10) {
                    Text(birthdayText)
                        .font(.body)
                        .foregroundStyle(
                            birthday == nil
                            ? Color.appSecondaryText
                            : Color.appText
                        )
                        .fixedSize()

                    Image(systemName: "calendar")
                        .foregroundStyle(Color.appPrimary)
                }
                .padding(.horizontal, 14)
                .frame(height: 48)
                .fixedSize(horizontal: true, vertical: false)
                .background(
                    Color.appSurface,
                    in: RoundedRectangle(cornerRadius: 12)
                )
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(
                            Color.appSecondaryText.opacity(0.3),
                            lineWidth: 1
                        )
                }
            }
            .buttonStyle(.plain)
        }
        .sheet(isPresented: $showingDatePicker) {
            NavigationStack {
                DatePicker(
                    "Birthday",
                    selection: $selectedDate,
                    in: ...Date(),
                    displayedComponents: .date
                )
//                .presentationDragIndicator(.hidden)
                .datePickerStyle(.graphical)
                .tint(.appPrimary)
                .padding()
                .navigationTitle("Select Birthday")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button(role: .cancel) {
                            showingDatePicker = false
                        }
                    }

                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            birthday = selectedDate
                            showingDatePicker = false
                        }
                    }
                }
            }
            .presentationDetents([.height(490), .large])
        }
    }
}
