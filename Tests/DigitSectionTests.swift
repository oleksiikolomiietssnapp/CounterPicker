import Testing

@testable import CounterPicker

@Suite
struct DigitSectionTests {
    @Test("DigitSection.whole returns correct color")
    func digitSectionWholeColor() {
        let section = DigitSection.whole
        #expect(section.color == .primary)
    }

    @Test("DigitSection.fractions returns red color")
    func digitSectionFractionsColor() {
        let section = DigitSection.fractions
        #expect(section.color == .red)
    }

    @Test("DigitSection.whole returns bold font weight")
    func digitSectionWholeFontWeight() {
        let section = DigitSection.whole
        #expect(section.fontWeight == .bold)
    }

    @Test("DigitSection.fractions returns semibold font weight")
    func digitSectionFractionsFontWeight() {
        let section = DigitSection.fractions
        #expect(section.fontWeight == .semibold)
    }
}
