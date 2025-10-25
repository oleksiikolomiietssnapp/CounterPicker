# CounterPicker

A custom SwiftUI component that replicates the behavior of mechanical counters, featuring separate displays for main digits and fractional parts.

## Overview

A scrollable wheel picker that mimics mechanical counter displays. Features separate main digits and a red fractional digit with a decimal separator, all displayed with a scroll-wheel interaction where each digit column shows the previous, current, and next values.

## Configuration

### Main Digits
- **Default:** 5 digits (0-99,999)
- **Rationale:** 5-digit configurations are the industry standard for most mechanical counters and provide a practical balance between precision and display size

### Fractional Digits (Red)
- **Default:** 1 digit (0-9)
- **Maximum:** 3 digits (0-999)
- **Rationale:** Default is set to 1 digit to keep the display compact and avoid excessive width. Since fractional digits are rarely needed, 1 digit is sufficient for most use cases. Can be adjusted up to 3 digits when higher precision is required

## Design

<img width="956" height="499" alt="Screenshot 2025-10-25 at 11 18 44 AM" src="https://github.com/user-attachments/assets/0a6685cc-34e4-4470-9247-5392b8ae317f" />

Each digit column displays three rows (previous, current, next) creating a scroll-wheel effect. The main digits appear in dark text, the fractional digit in red, with a decimal separator between them. Colors adapt to light/dark mode automatically.
