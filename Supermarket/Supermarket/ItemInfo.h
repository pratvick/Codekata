//
//  ItemInfo.h
//  Supermarket
//
//  Created by Prateek Khandelwal on 6/13/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

#import "Rule.h"

@interface ItemInfo : NSObject

@property (readonly) double price;
@property (readonly) Rule *rule;

- (instancetype)initWithPrice:(double)price rule:(Rule *)rule;

@end
