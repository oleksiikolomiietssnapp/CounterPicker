import Testing

@testable import CounterPicker

@Suite
struct DoubleExtensionsIntegrationTests {
    @Test("Roundtrip: value → digits + fractions → reconstruct")
    func roundtripValue() {
        let original = 123.456
        let wholeDigits = original.digits(5)
        let fractionalDigits = original.fractions(3)

        let wholeString = wholeDigits.map { "\($0)" }.joined()
        let fractionString = fractionalDigits.map { "\($0)" }.joined()
        let reconstructed = Double("\(wholeString).\(fractionString)") ?? 0

        #expect(reconstructed == 123.456)
    }

    @Test("Roundtrip: with rounding")
    func roundtripWithRounding() {
        let original = 22.22222
        let rounded = original.roundedTo3Digits
        let wholeDigits = rounded.digits(5)
        let fractionalDigits = rounded.fractions(3)

        let wholeString = wholeDigits.map { "\($0)" }.joined()
        let fractionString = fractionalDigits.map { "\($0)" }.joined()
        let reconstructed = Double("\(wholeString).\(fractionString)") ?? 0

        #expect(reconstructed == 22.222)
    }

    @Test("Edge case: very large number")
    func edgeCaseLargeNumber() {
        let value = 999999.999999
        let rounded = value.roundedTo3Digits
        let wholeDigits = rounded.digits(5)
        let fractionalDigits = rounded.fractions(3)

        #expect(wholeDigits.count == 5)
        #expect(fractionalDigits.count == 3)
    }

    @Test("Edge case: very small positive number")
    func edgeCaseSmallPositive() {
        let value = 0.0001
        let rounded = value.roundedTo3Digits
        let wholeDigits = rounded.digits(5)
        let fractionalDigits = rounded.fractions(3)

        #expect(wholeDigits == [0, 0, 0, 0, 0])
        #expect(fractionalDigits == [0, 0, 0])
    }
}
