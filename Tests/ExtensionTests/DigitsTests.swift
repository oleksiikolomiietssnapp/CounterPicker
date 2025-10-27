import Testing

@testable import CounterPicker

@Suite
struct DigitsTests {
    @Test("Extracts digits with padding")
    func digitsWithPadding() {
        let value = 123.0
        let result = value.digits(5)
        #expect(result == [0, 0, 1, 2, 3])
    }

    @Test("Extracts digits without padding needed")
    func digitsNoPadding() {
        let value = 12345.0
        let result = value.digits(5)
        #expect(result == [1, 2, 3, 4, 5])
    }

    @Test("Handles overflow - takes last digits")
    func digitsOverflow() {
        let value = 123456.0
        let result = value.digits(3)
        #expect(result == [4, 5, 6])
    }

    @Test("Handles zero")
    func digitsZero() {
        let value = 0.0
        let result = value.digits(5)
        #expect(result == [0, 0, 0, 0, 0])
    }

    @Test("Handles negative numbers - uses absolute value")
    func digitsNegative() {
        let value = -123.0
        let result = value.digits(5)
        #expect(result == [0, 0, 1, 2, 3])
    }

    @Test("Handles single digit")
    func digitsSingleDigit() {
        let value = 5.0
        let result = value.digits(5)
        #expect(result == [0, 0, 0, 0, 5])
    }

    @Test("Handles count of 1")
    func digitsCountOne() {
        let value = 123.0
        let result = value.digits(1)
        #expect(result == [3])
    }

    @Test("Handles large numbers")
    func digitsLargeNumber() {
        let value = 9876543.0
        let result = value.digits(5)
        #expect(result == [7, 6, 5, 4, 3])
    }

    @Test("Handles fractional part - ignores decimals")
    func digitsFractional() {
        let value = 123.999
        let result = value.digits(5)
        #expect(result == [0, 0, 1, 2, 3])
    }
}

