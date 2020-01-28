//
//  ApplePayButtonView.m
//  RnApplePayButton
//
//  Created by Dino Pelic on 1/28/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import <PassKit/PassKit.h>
#import "ApplePayButtonManager.h"
#import "ApplePayButtonView.h"

@implementation ApplePayButtonManager

RCT_EXPORT_MODULE(APButton)

RCT_EXPORT_VIEW_PROPERTY(onPress, RCTBubblingEventBlock)

RCT_CUSTOM_VIEW_PROPERTY(buttonType, NSString, ApplePayButtonView)
{
  if (json) {
    [view setButtonType:[RCTConvert NSString:json]];
  }
}

RCT_CUSTOM_VIEW_PROPERTY(buttonStyle, NSString, ApplePayButtonView)
{
  if (json) {
    [view setButtonStyle:[RCTConvert NSString:json]];
  }
}

- (UIView *) view
{
  return [ApplePayButtonView new];
}

@end

