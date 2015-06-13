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
  if (self.items[item] == nil) {
    self.items[item] = [NSNumber numberWithInteger:1];
  } else {
    NSNumber *previousCount = self.items[item];
    self.items[item] = [NSNumber numberWithInteger:([previousCount integerValue] + 1)];
  }
}

- (void)scanAllItems:(NSString *)item {
  for (NSUInteger index = 0; index < item.length; index++) {
    NSRange range = {index, 1};
    [self scanSingleItem:[item substringWithRange:range]];
  }
}

- (void)removeAllItems {
  [self.items removeAllObjects];
}

- (NSUInteger)totalCost {
  __block NSUInteger totalCost = 0;
  [self.items enumerateKeysAndObjectsUsingBlock:(^(id key, id obj, BOOL *stop) {
    totalCost += [self.checkoutRules getPriceOfItem:key
                                        forQuantity:(NSUInteger)[self.items[key] integerValue]];
  })];
  return totalCost;
}

@end
