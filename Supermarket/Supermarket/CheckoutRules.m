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

- (void)addItem:(NSString *)item withPrice:(NSUInteger)price rule:(Rule *)rule {
  assert(item != nil);
  assert(rule != nil);
  ItemInfo *itemInfo = [[ItemInfo alloc] initWithPrice:price rule:rule];
  self.checkoutRules[item] = itemInfo;
}

- (void)addItem:(NSString *)item withPrice:(NSUInteger)price {
  assert(item);
  Rule *rule = [[Rule alloc] initWithQuantity:1 price:price];
  [self addItem:item withPrice:price rule:rule];
}

- (NSUInteger)getPriceOfItem:(NSString *)item forQuantity:(NSUInteger)quantity {
  assert(self.checkoutRules[item] != nil);

  ItemInfo *itemInfo = self.checkoutRules[item];
  Rule *rule = itemInfo.rule;
  return((itemInfo.price * (quantity % rule.quantity)) + (rule.price * (quantity / rule.quantity)));
}

@end
