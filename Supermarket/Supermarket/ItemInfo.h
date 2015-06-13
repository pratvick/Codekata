//
//  ItemInfo.h
//  Supermarket
//
//  Created by Prateek Khandelwal on 6/13/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

#import "Rule.h"

@interface ItemInfo : NSObject

@property (nonatomic) NSUInteger price;
@property (nonatomic) Rule *rule;

- (instancetype)init;

- (instancetype)initWithPrice:(NSUInteger)price rule:(Rule *)rule;

@end
