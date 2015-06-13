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

@property (nonatomic) NSMutableDictionary *rules;

@end

@implementation CheckoutRules

- (instancetype)init {
  self = [super init];
  if (self) {
    _rules = [[NSMutableDictionary alloc] init];
  }
  return self;
}

- (void)addItem:(NSString *)item withPrice:(NSUInteger)price rule:(Rule *)rule {
  ItemInfo *itemInfo = [[ItemInfo alloc] initWithPrice:price rule:rule];
  [self.rules setObject:itemInfo forKey:item];
}

- (void)addItem:(NSString *)item withPrice:(NSUInteger)price {
  Rule *rule = [[Rule alloc] initWithQuantity:1 price:price];
  [self addItem:item withPrice:price rule:rule];
}

- (NSUInteger)getPriceOfItem:(NSString *)item forQuantity:(NSUInteger)quantity {
  assert(self.rules[item] != nil);
  ItemInfo *itemInfo = self.rules[item];
  return ((itemInfo.price * (quantity % itemInfo.rule.quantity)) +
          (itemInfo.rule.price * (quantity / itemInfo.rule.quantity)));
}

@end
