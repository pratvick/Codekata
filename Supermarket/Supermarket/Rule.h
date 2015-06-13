//
//  Rule.h
//  Supermarket
//
//  Created by Prateek Khandelwal on 6/13/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

@interface Rule : NSObject

@property (readonly) NSUInteger quantity;
@property (readonly) NSUInteger price;

- (instancetype)initWithQuantity:(NSUInteger)quantity price:(NSUInteger)price;

@end
