//
//  ItemInfo.m
//  Supermarket
//
//  Created by Prateek Khandelwal on 6/13/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemInfo.h"
#import "Rule.h"

@implementation ItemInfo

- (instancetype)init {
  self = [super init];
  if (self) {
    _price = 0;
    _rule = [[Rule alloc] initWithQuantity:1 price:_price];
  }
  return self;
}

- (instancetype)initWithPrice:(NSUInteger)price rule:(Rule *)rule {
  self = [super init];
  if (self) {
    _price = price;
    _rule = rule;
  }
  return self;
}

@end