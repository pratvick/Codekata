//
//  ItemInfo.m
//  Supermarket
//
//  Created by Prateek Khandelwal on 6/13/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemInfo.h"

@implementation ItemInfo

- (instancetype)init {
  self.price = 0;
  self.rule.price = self.price;
  self.rule.quantity = 1;
  return self;
}

- (instancetype)initWithPrice:(NSUInteger)price rule:(Rule *)rule {
  self.price = price;
  self.rule = rule;
  return self;
}

@end