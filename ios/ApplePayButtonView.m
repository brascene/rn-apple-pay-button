//
//  ApplePayButtonView.m
//  RnApplePayButton
//
//  Created by Dino Pelic on 1/28/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "ApplePayButtonView.h"

NSString * const DEFAULT_BUTTON_TYPE = @"plain";
NSString * const DEFAULT_BUTTON_STYLE = @"black";

@implementation ApplePayButtonView

@synthesize buttonType = _buttonType;
@synthesize buttonStyle = _buttonStyle;
@synthesize button = _button;
@synthesize cornerRadius = _cornerRadius;

- (instancetype) init {
  self = [super init];
  
  CGFloat valueAsFloat = 4;
  CGFloat *pointerToFloat = &valueAsFloat;
  [self setButtonType:DEFAULT_BUTTON_TYPE andStyle:DEFAULT_BUTTON_STYLE andRadius:(CGFloat *)pointerToFloat];
  
  return self;
}

- (void)setButtonType:(NSString *) value {
  if (_buttonType != value) {
    [self setButtonType:value andStyle:_buttonStyle andRadius:_cornerRadius];
  }
  
  _buttonType = value;
}

- (void)setButtonStyle:(NSString *) value {
  if (_buttonStyle != value) {
    [self setButtonType:_buttonType andStyle:value andRadius:_cornerRadius];
  }
  
  _buttonStyle = value;
}

- (void)setCornerRadius: (CGFloat *) value {
    if (_cornerRadius != value) {
      [self setButtonType:_buttonType andStyle:_buttonStyle andRadius:value];
    }
    
    _cornerRadius = value;
}

- (void)setButtonType:(NSString *) buttonType andStyle:(NSString *) buttonStyle andRadius:(CGFloat *) cornerRadius {
  for (UIView *view in self.subviews) {
    [view removeFromSuperview];
  }

  PKPaymentButtonType type;
  PKPaymentButtonStyle style;
  
  if ([buttonType isEqualToString: @"buy"]) {
    type = PKPaymentButtonTypeBuy;
  } else if ([buttonType isEqualToString: @"setUp"]) {
    type = PKPaymentButtonTypeSetUp;
  } else if ([buttonType isEqualToString: @"inStore"]) {
    type = PKPaymentButtonTypeInStore;
  } else if ([buttonType isEqualToString: @"donate"]) {
    type = PKPaymentButtonTypeDonate;
  } else if ([buttonType isEqualToString: @"checkout"]) {
    type = PKPaymentButtonTypeCheckout;
  } else if ([buttonType isEqualToString: @"book"]) {
    type = PKPaymentButtonTypeBook;
  } else if ([buttonType isEqualToString: @"subscribe"]) {
    type = PKPaymentButtonTypeSubscribe;
  } else {
    type = PKPaymentButtonTypePlain;
  }

  if ([buttonStyle isEqualToString: @"white"]) {
    style = PKPaymentButtonStyleWhite;
  } else if ([buttonStyle isEqualToString: @"whiteOutline"]) {
    style = PKPaymentButtonStyleWhiteOutline;
  } else {
    style = PKPaymentButtonStyleBlack;
  }

  _button = [[PKPaymentButton alloc] initWithPaymentButtonType:type paymentButtonStyle:style];
  [_button addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];
  if (@available(iOS 12.0, *)) {
    if (cornerRadius != NULL) {
      CGFloat cornerRadiusAsFloat = *cornerRadius;
      [_button setCornerRadius:cornerRadiusAsFloat];
    }
  } else {
    // Fallback on earlier versions
  }

  [self addSubview:_button];
}

- (void)touchUpInside:(PKPaymentButton *)button {
  if (self.onPress) {
    self.onPress(nil);
  }
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  _button.frame = self.bounds;
}

@end
