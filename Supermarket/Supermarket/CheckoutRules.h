//
//  CheckoutRules.h
//  Supermarket
//
//  Created by Prateek Khandelwal on 6/13/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

#import "Rule.h"

@interface CheckoutRules : NSObject

- (instancetype)init;

- (void)addItem:(NSString *)item withPrice:(NSUInteger)price rule:(Rule *)rule;

- (void)addItem:(NSString *)item withPrice:(NSUInteger)price;

- (NSUInteger)getPriceOfItem:(NSString *)item forQuantity:(NSUInteger)quantity;

@end
