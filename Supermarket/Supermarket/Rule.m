//
//  Rule.m
//  Supermarket
//
//  Created by Prateek Khandelwal on 6/13/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rule.h"

@interface Rule()

@property (readwrite) double quantity;
@property (readwrite) double price;

@end

@implementation Rule

- (instancetype)initWithQuantity:(double)quantity price:(double)price {
  self = [super init];
  if (self) {
    _quantity = quantity;
    _price = price;
  }
  return self;
}

@end