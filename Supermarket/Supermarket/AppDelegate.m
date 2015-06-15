//
//  AppDelegate.m
//  Supermarket
//
//  Created by Prateek Khandelwal on 6/12/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

#import "AppDelegate.h"
#import "CheckoutRules.h"
#import "Checkout.h"
#import "Rule.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  CheckoutRules *checkoutRules = [[CheckoutRules alloc] init];
  [checkoutRules addItem:@"A" withPrice:10.56 rule:[[Rule alloc] initWithQuantity:3.50 price:20.25]];
  [checkoutRules addItem:@"B" withPrice:30.55 rule:[[Rule alloc] initWithQuantity:1.50 price:45.00]];
  [checkoutRules addItem:@"C" withPrice:20.00];
  [checkoutRules addItem:@"D" withPrice:15.00];

  Checkout *checkout = [[Checkout alloc] initWithCheckoutRules:checkoutRules];
  [checkout scanAllItems:@"AAAAAAAAAABCBBD"];
  NSLog(@"%lf", [checkout totalCost]);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
  // Insert code here to tear down your application
}

@end
