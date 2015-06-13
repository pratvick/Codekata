//
//  SupermarketTests.m
//  SupermarketTests
//
//  Created by Prateek Khandelwal on 6/12/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "CheckoutRules.h"
#import "Checkout.h"
#import "Rule.h"

@interface SupermarketTests : XCTestCase

@property (nonatomic) CheckoutRules *checkoutRules;
@property (nonatomic) Checkout *checkout;

@end

@implementation SupermarketTests

- (void)setUp {
  self.checkoutRules = [[CheckoutRules alloc] init];
  self.checkout = [[Checkout alloc] initWithCheckoutRules:self.checkoutRules];
}

- (void)tearDown {
  self.checkoutRules = nil;
  self.checkout = nil;
}

- (void)setupCheckoutRules {
  [self.checkoutRules addItem:@"A" withPrice:50 rule:[[Rule alloc] initWithQuantity:3 price:130]];
  [self.checkoutRules addItem:@"B" withPrice:30 rule:[[Rule alloc] initWithQuantity:2 price:45]];
  [self.checkoutRules addItem:@"C" withPrice:20];
  [self.checkoutRules addItem:@"D" withPrice:15];
}

- (void)testIncrementalCosting {
  [self setupCheckoutRules];

  [self.checkout scanSingleItem:@"A"];
  XCTAssertEqual(50, [self.checkout totalCost]);
  [self.checkout scanSingleItem:@"B"];
  XCTAssertEqual(80, [self.checkout totalCost]);
  [self.checkout scanSingleItem:@"A"];
  XCTAssertEqual(130, [self.checkout totalCost]);
  [self.checkout scanSingleItem:@"A"];
  XCTAssertEqual(160, [self.checkout totalCost]);
  [self.checkout scanSingleItem:@"B"];
  XCTAssertEqual(175, [self.checkout totalCost]);
}

- (void)testCostForItems:(NSString *)items equals:(NSUInteger)totalCost {
  [self.checkout scanAllItems:items];
  XCTAssertEqual(totalCost, [self.checkout totalCost]);
  [self.checkout removeAllItems];
}

- (void)testCostingAtOnce {
  [self setupCheckoutRules];

  [self testCostForItems:@"" equals:0];
  [self testCostForItems:@"A" equals:50];
  [self testCostForItems:@"AB" equals:80];
  [self testCostForItems:@"CDBA" equals:115];

  [self testCostForItems:@"AA" equals:100];
  [self testCostForItems:@"AAA" equals:130];
  [self testCostForItems:@"AAAA" equals:180];
  [self testCostForItems:@"AAAAA" equals:230];
  [self testCostForItems:@"AAAAAA" equals:260];

  [self testCostForItems:@"AAAB" equals:160];
  [self testCostForItems:@"AAABB" equals:175];
  [self testCostForItems:@"AAABBD" equals:190];
  [self testCostForItems:@"DABABA" equals:190];
}

@end
