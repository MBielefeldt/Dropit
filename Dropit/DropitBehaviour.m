//
//  DropitBehaviour.m
//  Dropit
//
//  Created by Mads Bielefeldt on 18/05/14.
//  Copyright (c) 2014 Mads Bielefeldt. All rights reserved.
//

#import "DropitBehaviour.h"

@interface DropitBehaviour ()
@property (strong, nonatomic) UIGravityBehavior *gravity;
@property (strong, nonatomic) UICollisionBehavior *collider;
@property (strong, nonatomic) UIDynamicItemBehavior *animationOptions;
@end

@implementation DropitBehaviour

- (id)init
{
    self = [super init];
    
    if (self)
    {
        [self addChildBehavior:self.gravity];
        [self addChildBehavior:self.collider];
        [self addChildBehavior:self.animationOptions];
    }
    
    return self;
}

- (UIGravityBehavior *)gravity
{
    if (!_gravity)
    {
        _gravity = [[UIGravityBehavior alloc] init];
        _gravity.magnitude = 1.0;
    }
    return _gravity;
}

- (UICollisionBehavior *)collider
{
    if (!_collider)
    {
        _collider = [[UICollisionBehavior alloc] init];
        _collider.translatesReferenceBoundsIntoBoundary = YES;
        _collider.collisionMode = UICollisionBehaviorModeEverything;
    }
    return _collider;
}

- (UIDynamicItemBehavior *)animationOptions
{
    if (!_animationOptions)
    {
        _animationOptions = [[UIDynamicItemBehavior alloc] init];
        _animationOptions.allowsRotation = NO;
    }
    return _animationOptions;
}

- (void)addItem:(id <UIDynamicItem>)item
{
    [self.gravity addItem:item];
    [self.collider addItem:item];
    [self.animationOptions addItem:item];
}

- (void)removeItem:(id <UIDynamicItem>)item
{
    [self.gravity removeItem:item];
    [self.collider removeItem:item];
    [self.animationOptions removeItem:item];
}

@end
