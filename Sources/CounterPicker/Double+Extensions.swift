import Foundation

extension Double {
    /// Rounds the number to up to 3 fractional digits (e.g., 1.23456 → 1.235)
    var roundedTo3Digits: Double {
        let multiplier = pow(10.0, 3.0)
        return (self * multiplier).rounded() / multiplier
    }
    
    /// Only the integer digits (before the decimal point)
    var digits: [Int] {
        let integerPart = Int(abs(self)) // truncates decimals
        return String(integerPart).compactMap { $0.wholeNumberValue }
    }

    /// Only the fractional digits (after the decimal point)
    var fractions: [Int] {
        let components = String(abs(self.roundedTo3Digits)).split(separator: ".")
        guard components.count == 2 else { return [] }
        return components[1]
            .compactMap { $0.wholeNumberValue }
    }
}
