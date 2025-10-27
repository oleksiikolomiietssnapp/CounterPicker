import Testing

@testable import CounterPicker

@Suite
struct RoundedTo3DigitsTests {
    @Test("Rounds to 3 decimal places")
    func roundedBasic() {
        let value = 1.23456
        let result = value.roundedTo3Digits
        #expect(result == 1.235)
    }

    @Test("Rounds up correctly")
    func roundedUp() {
        let value = 1.2345
        let result = value.roundedTo3Digits
        #expect(result == 1.235)
    }

    @Test("Rounds down correctly")
    func roundedDown() {
        let value = 1.2344
        let result = value.roundedTo3Digits
        #expect(result == 1.234)
    }

    @Test("Handles zero")
    func roundedZero() {
        let value = 0.0
        let result = value.roundedTo3Digits
        #expect(result == 0.0)
    }

    @Test("Handles negative numbers")
    func roundedNegative() {
        let value = -1.23456
        let result = value.roundedTo3Digits
        #expect(result == -1.235)
    }

    @Test("Handles numbers with fewer than 3 decimal places")
    func roundedFewerDecimals() {
        let value = 1.23
        let result = value.roundedTo3Digits
        #expect(result == 1.23)
    }

    @Test("Handles whole numbers")
    func roundedWholeNumber() {
        let value = 5.0
        let result = value.roundedTo3Digits
        #expect(result == 5.0)
    }

    @Test("Handles very small fractional values")
    func roundedVerySmall() {
        let value = 0.0001
        let result = value.roundedTo3Digits
        #expect(result == 0.0)
    }

    @Test("Handles large numbers")
    func roundedLargeNumber() {
        let value = 12345.6789
        let result = value.roundedTo3Digits
        #expect(result == 12345.679)
    }
}
