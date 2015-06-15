//
//  Checkout.m
//  Supermarket
//
//  Created by Prateek Khandelwal on 6/12/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Checkout.h"

@interface Checkout()

@property (nonatomic) NSMutableDictionary *items;
@property (nonatomic) CheckoutRules *checkoutRules;

@end

@implementation Checkout

- (instancetype)initWithCheckoutRules:(CheckoutRules *)checkoutRules {
  self = [super init];
  if (self) {
    _checkoutRules = checkoutRules;
    _items = [[NSMutableDictionary alloc] init];
  }
  return self;
}

- (void)scanSingleItem:(NSString *)item {
  NSNumber *previousCountOfItem = self.items[item];
  if (previousCountOfItem == nil) {
    self.items[item] = @1.00;
  } else {
    self.items[item] = @([previousCountOfItem doubleValue] + 1.00);
  }
}

- (void)scanAllItems:(NSString *)items {
  for (NSUInteger index = 0; index < items.length; index++) {
    [self scanSingleItem:[items substringWithRange:(NSRange){index, 1}]];
  }
}

- (void)removeAllItems {
  [self.items removeAllObjects];
}

- (double)totalCost {
  __block NSDecimalNumber *totalCost = [[NSDecimalNumber alloc] initWithDouble:0.00];
  [self.items enumerateKeysAndObjectsUsingBlock:(^(NSString *key, id obj, BOOL *stop) {
    totalCost = [totalCost decimalNumberByAdding:[self.checkoutRules getPriceOfItem:key
                                                                        forQuantity:[self.items[key] doubleValue]]];
  })];
  return [totalCost doubleValue];
}

@end
