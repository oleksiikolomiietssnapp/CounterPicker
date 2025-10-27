import Foundation
import SwiftUI

/// Defines the visual and logical categorization of digits in a counter.
enum DigitSection {
    /// Whole digits (main counter display)
    case whole
    /// Fractional digits (decimal part, displayed in red)
    case fractions

    /// The color for this section's digits
    var color: Color {
        switch self {
        case .whole:
            return .primary
        case .fractions:
            return .red
        }
    }

    /// The font weight for this section's digits
    var fontWeight: Font.Weight {
        switch self {
        case .whole:
            return .bold
        case .fractions:
            return .semibold
        }
    }
}
