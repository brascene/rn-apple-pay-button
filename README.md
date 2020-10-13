# react-native-rn-apple-pay-button

## Getting started

`npm install react-native-rn-apple-pay-button --save`

### Mostly automatic installation

`react-native link react-native-rn-apple-pay-button`

`cd ios/ && pod install`

## Usage

```javascript
import { ApplePayButton } from 'react-native-rn-apple-pay-button';

// Usage
<ApplePayButton
    buttonStyle="black"
    type="donate"
    cornerRadius={8} // Default value is 4.0
    width={200}
    height={45}
    onPress={handleApplePay}
/>
```
## Supported button types
https://developer.apple.com/documentation/passkit/pkpaymentbuttontype
