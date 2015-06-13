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

- (void)testCostingAtOnce {
  [self setupCheckoutRules];

  [self.checkout scanAllItems:@""];
  XCTAssertEqual(0, [self.checkout totalCost]);
  [self.checkout clearAllItems];
  [self.checkout scanAllItems:@"A"];
  XCTAssertEqual(50, [self.checkout totalCost]);
  [self.checkout clearAllItems];
  [self.checkout scanAllItems:@"AB"];
  XCTAssertEqual(80, [self.checkout totalCost]);
  [self.checkout clearAllItems];
  [self.checkout scanAllItems:@"CDBA"];
  XCTAssertEqual(115, [self.checkout totalCost]);
  [self.checkout clearAllItems];

  [self.checkout scanAllItems:@"AA"];
  XCTAssertEqual(100, [self.checkout totalCost]);
  [self.checkout clearAllItems];
  [self.checkout scanAllItems:@"AAA"];
  XCTAssertEqual(130, [self.checkout totalCost]);
  [self.checkout clearAllItems];
  [self.checkout scanAllItems:@"AAAA"];
  XCTAssertEqual(180, [self.checkout totalCost]);
  [self.checkout clearAllItems];
  [self.checkout scanAllItems:@"AAAAA"];
  XCTAssertEqual(230, [self.checkout totalCost]);
  [self.checkout clearAllItems];
  [self.checkout scanAllItems:@"AAAAAA"];
  XCTAssertEqual(260, [self.checkout totalCost]);
  [self.checkout clearAllItems];

  [self.checkout scanAllItems:@"AAAB"];
  XCTAssertEqual(160, [self.checkout totalCost]);
  [self.checkout clearAllItems];
  [self.checkout scanAllItems:@"AAABB"];
  XCTAssertEqual(175, [self.checkout totalCost]);
  [self.checkout clearAllItems];
  [self.checkout scanAllItems:@"AAABBD"];
  XCTAssertEqual(190, [self.checkout totalCost]);
  [self.checkout clearAllItems];
  [self.checkout scanAllItems:@"DABABA"];
  XCTAssertEqual(190, [self.checkout totalCost]);
  [self.checkout clearAllItems];
}

@end
