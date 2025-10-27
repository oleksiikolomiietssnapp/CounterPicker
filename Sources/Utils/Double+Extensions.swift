import Foundation

extension Double {
    var roundedTo3Digits: Double {
        let multiplier = pow(10.0, 3.0)
        return (self * multiplier).rounded() / multiplier
    }

    func digits(_ digitsCount: Int) -> [Int] {
        let integerPart = Int(abs(self))
        var integerString = String(integerPart)

        let padding = digitsCount - integerString.count
        if padding > 0 {
            integerString = String(repeating: "0", count: padding) + integerString
        } else if padding < 0 {
            integerString = String(integerString.suffix(digitsCount))
        }

        return integerString.compactMap { $0.wholeNumberValue }
    }

    func fractions(_ fractionCount: Int) -> [Int] {
        let components = String(abs(self.roundedTo3Digits)).split(separator: ".")
        guard components.count == 2 else {
            return Array(repeating: 0, count: fractionCount)
        }

        let fractions = components[1]
            .prefix(fractionCount)
            .compactMap { $0.wholeNumberValue }

        let paddingNeeded = fractionCount - fractions.count
        return fractions + Array(repeating: 0, count: paddingNeeded)
    }
}
