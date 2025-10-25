import Observation
import SwiftUI

@Observable
class PickerViewModel {
    var counts: [Int]
    var fractions: [Int]

    // TODO: User have to be able to add additional digit or fraction - UI: rounded rect with dashed border appears when edge number is 9
    private let integerDigitCount = 5

    init(
        reading: Double
    ) {
        self.counts =  Self.paddedInteger(from: reading, count: integerDigitCount)
        self.fractions = reading.fractions
    }

    func updateReading(_ newReading: Double) {
        self.counts = Self.paddedInteger(from: newReading, count: integerDigitCount)
        self.fractions = newReading.fractions
    }

    func recalculateCurrentNumber() -> Double? {
        let integerString = counts.map { "\($0)" }.joined()
        let fractionString = fractions.map { "\($0)" }.joined()
        let fullString = "\(integerString).\(fractionString)"

        if let number = Double(fullString) {
            return number
        }

        return nil
    }

    private static func paddedInteger(from number: Double, count: Int) -> [Int] {
        let integerPart = Int(abs(number))
        var integerString = String(integerPart)

        let padding = count - integerString.count
        if padding > 0 {
            integerString = String(repeating: "0", count: padding) + integerString
        } else if padding < 0 {
            // If the number has more than `count` digits, take the last `count` digits.
            integerString = String(integerString.suffix(count))
        }

        return integerString.compactMap { $0.wholeNumberValue }
    }
}

extension PickerViewModel {
    static let mock: PickerViewModel = PickerViewModel(reading: 245.32)
}
