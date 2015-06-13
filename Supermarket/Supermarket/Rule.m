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

@property (readwrite) NSUInteger quantity;
@property (readwrite) NSUInteger price;

@end

@implementation Rule

- (instancetype)initWithQuantity:(NSUInteger)quantity price:(NSUInteger)price {
  self = [super init];
  if (self) {
    _quantity = quantity;
    _price = price;
  }
  return self;
}

@end