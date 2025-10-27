import Testing

@testable import CounterPicker

@Suite
struct FractionsTests {
    @Test("Extracts fractional digits with padding")
    func fractionsWithPadding() {
        let value = 123.4
        let result = value.fractions(3)
        #expect(result == [4, 0, 0])
    }

    @Test("Extracts fractional digits without padding")
    func fractionsNoPadding() {
        let value = 123.456
        let result = value.fractions(3)
        #expect(result == [4, 5, 6])
    }

    @Test("Truncates excess fractional digits")
    func fractionsTruncation() {
        let value = 123.456789
        let result = value.fractions(2)
        #expect(result == [4, 5])
    }

    @Test("Handles zero fractional part - returns all zeros")
    func fractionsZeroFraction() {
        let value = 123.0
        let result = value.fractions(3)
        #expect(result == [0, 0, 0])
    }

    @Test("Handles integer with no decimal - returns all zeros")
    func fractionsIntegerNoDecimal() {
        let value = Double(456)
        let result = value.fractions(3)
        #expect(result == [0, 0, 0])
    }

    @Test("Handles no fractional part - respects fraction count")
    func fractionsNoFractionalCount() {
        let value = 789.0
        let result = value.fractions(1)
        #expect(result == [0])
    }

    @Test("Handles negative numbers - uses absolute value")
    func fractionsNegative() {
        let value = -123.456
        let result = value.fractions(3)
        #expect(result == [4, 5, 6])
    }

    @Test("Handles very small fractional values")
    func fractionsSmallValue() {
        let value = 1.001
        let result = value.fractions(3)
        #expect(result == [0, 0, 1])
    }

    @Test("Handles count of 1")
    func fractionsCountOne() {
        let value = 123.456
        let result = value.fractions(1)
        #expect(result == [4])
    }

    @Test("Handles high precision")
    func fractionsHighPrecision() {
        let value = 0.123456789
        let result = value.fractions(3)
        #expect(result == [1, 2, 3])
    }

    @Test("Handles rounding before extraction")
    func fractionsRounding() {
        let value = 1.23456
        let result = value.fractions(3)
        #expect(result == [2, 3, 5])  // Rounded to 1.235
    }

    @Test("Handles pure decimal less than 1")
    func fractionsPureDecimal() {
        let value = 0.987
        let result = value.fractions(3)
        #expect(result == [9, 8, 7])
    }
}
