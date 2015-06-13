//
//  Checkout.h
//  Supermarket
//
//  Created by Prateek Khandelwal on 6/12/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

#import "CheckoutRules.h"

@interface Checkout : NSObject

- (instancetype)initWithCheckoutRules:(CheckoutRules *)rules;

- (void)scanSingleItem:(NSString *)item;

- (void)scanAllItems:(NSString *)item;

- (void)removeAllItems;

- (NSUInteger)totalCost;

@end
