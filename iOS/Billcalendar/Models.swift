import Foundation

struct Bill: Identifiable, Codable, Equatable {
    var id: UUID = UUID()
    var createdAt: Date = Date()
    var name: String
    var amount: Double
    var dueDate: Date
    var isPaid: Bool

    init(id: UUID = UUID(), createdAt: Date = Date(), name: String = "", amount: Double = 0, dueDate: Date = Date(), isPaid: Bool = false) {
        self.id = id
        self.createdAt = createdAt
        self.name = name
        self.amount = amount
        self.dueDate = dueDate
        self.isPaid = isPaid
    }
}
