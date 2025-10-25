# CounterPicker

A custom SwiftUI component that replicates the behavior of mechanical counters, featuring separate displays for main digits and fractional parts.

## Overview

This component mimics traditional mechanical counters commonly found in industrial equipment, meter readers, and measurement devices. It displays values with distinct visual separation between main digits (displayed in white) and fractional digits (displayed in red).

## Configuration

### Main Digits
- **Default:** 5 digits (0-99,999)
- **Rationale:** 5-digit configurations are the industry standard for most mechanical counters and provide a practical balance between precision and display size

### Fractional Digits (Red)
- **Default:** 1 digit (0-9)
- **Maximum:** 3 digits (0-999)
- **Rationale:** Default is set to 1 digit to keep the display compact and avoid excessive width. Since fractional digits are rarely needed, 1 digit is sufficient for most use cases. Can be adjusted up to 3 digits when higher precision is required

## Design

<img width="956" height="499" alt="Screenshot 2025-10-25 at 11 18 44 AM" src="https://github.com/user-attachments/assets/0a6685cc-34e4-4470-9247-5392b8ae317f" />


The counter picker separates visual representation of:
- **Main Digits (White):** Primary measurement values
- **Fractional Digits (Red):** Sub-unit or precision measurements

This design follows real-world mechanical counter conventions where the fractional part is often color-coded for quick visual distinction.
