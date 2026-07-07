import SwiftUI

/// Bespoke palette for Billcalendar: rose red, calendar-organized.
enum Theme {
    static let accent = Color(hex: "#E85D75")
    static let background = Color(hex: "#1B0E13")
    static let foreground = Color(hex: "#FFEFF3")
    static let card = background.opacity(0.6)
    static let titleFont = Font.system(.title2, design: .rounded).weight(.bold)
    static let bodyFont = Font.system(.body, design: .rounded)
    static let captionFont = Font.system(.caption, design: .rounded)
}

extension Color {
    init(hex: String) {
        let s = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: s).scanHexInt64(&int)
        let r = Double((int >> 16) & 0xFF) / 255.0
        let g = Double((int >> 8) & 0xFF) / 255.0
        let b = Double(int & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
