//
//  Rule.h
//  Supermarket
//
//  Created by Prateek Khandelwal on 6/13/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

@interface Rule : NSObject

@property (readonly) double quantity;
@property (readonly) double price;

- (instancetype)initWithQuantity:(double)quantity price:(double)price;

@end
