//
//  DropitBehaviour.h
//  Dropit
//
//  Created by Mads Bielefeldt on 18/05/14.
//  Copyright (c) 2014 Mads Bielefeldt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropitBehaviour : UIDynamicBehavior

- (void)addItem:(id <UIDynamicItem>)item;
- (void)removeItem:(id <UIDynamicItem>)item;

@end
