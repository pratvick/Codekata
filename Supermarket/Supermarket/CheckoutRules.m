//
//  CheckoutRules.m
//  Supermarket
//
//  Created by Prateek Khandelwal on 6/13/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckoutRules.h"
#import "ItemInfo.h"
#import "Rule.h"

@interface CheckoutRules()

@property (nonatomic) NSMutableDictionary *checkoutRules;

@end

@implementation CheckoutRules

- (instancetype)init {
  self = [super init];
  if (self) {
    _checkoutRules = [[NSMutableDictionary alloc] init];
  }
  return self;
}

- (void)addItem:(NSString *)item withPrice:(double)price rule:(Rule *)rule {
  assert(item != nil);
  assert(rule != nil);
  ItemInfo *itemInfo = [[ItemInfo alloc] initWithPrice:price rule:rule];
  self.checkoutRules[item] = itemInfo;
}

- (void)addItem:(NSString *)item withPrice:(double)price {
  assert(item);
  Rule *rule = [[Rule alloc] initWithQuantity:1.00 price:price];
  [self addItem:item withPrice:price rule:rule];
}

- (NSDecimalNumber *)getPriceOfItem:(NSString *)item forQuantity:(double)quantity {
  assert(self.checkoutRules[item] != nil);
  ItemInfo *itemInfo = self.checkoutRules[item];

  NSDecimalNumber *priceInDecimalNumber = (NSDecimalNumber *)[NSDecimalNumber numberWithDouble:itemInfo.price];
  NSDecimalNumber *quantityInDecimalNumber = (NSDecimalNumber *)[NSDecimalNumber numberWithDouble:quantity];
  NSDecimalNumber *rulePriceInDecimalNumber = (NSDecimalNumber *)[NSDecimalNumber numberWithDouble:itemInfo.rule.price];
  NSDecimalNumber *ruleQuantityInDecimalNumber = (NSDecimalNumber *)[NSDecimalNumber numberWithDouble:itemInfo.rule.quantity];
  NSDecimalNumber *ruleAppliedQuantityTimes = [quantityInDecimalNumber decimalNumberByDividingBy:ruleQuantityInDecimalNumber];
  NSDecimalNumber *ruleQuantity = [[[NSDecimalNumber alloc] initWithInt:ruleAppliedQuantityTimes.intValue] decimalNumberByMultiplyingBy:ruleQuantityInDecimalNumber];
  NSDecimalNumber *remainingQuantity = [quantityInDecimalNumber decimalNumberBySubtracting:ruleQuantity];
  NSDecimalNumber *rulePriceForItems = [rulePriceInDecimalNumber decimalNumberByMultiplyingBy:[[NSDecimalNumber alloc] initWithInt:ruleAppliedQuantityTimes.intValue]];
  return [[priceInDecimalNumber decimalNumberByMultiplyingBy:remainingQuantity] decimalNumberByAdding:rulePriceForItems];
}

@end
