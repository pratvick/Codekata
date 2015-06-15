//
//  CheckoutRules.h
//  Supermarket
//
//  Created by Prateek Khandelwal on 6/13/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

#import "Rule.h"

@interface CheckoutRules : NSObject

- (void)addItem:(NSString *)item withPrice:(double)price rule:(Rule *)rule;

- (void)addItem:(NSString *)item withPrice:(double)price;

- (NSDecimalNumber *)getPriceOfItem:(NSString *)item forQuantity:(double)quantity;

@end
