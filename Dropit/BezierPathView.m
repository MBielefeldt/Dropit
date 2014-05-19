//
//  BezierPathView.m
//  Dropit
//
//  Created by Mads Bielefeldt on 19/05/14.
//  Copyright (c) 2014 Mads Bielefeldt. All rights reserved.
//

#import "BezierPathView.h"

@implementation BezierPathView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setPath:(UIBezierPath *)path
{
    _path = path;
    
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self.path stroke];
}

@end
