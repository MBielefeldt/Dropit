//
//  DropitViewController.m
//  Dropit
//
//  Created by Mads Bielefeldt on 18/05/14.
//  Copyright (c) 2014 Mads Bielefeldt. All rights reserved.
//

#import "DropitViewController.h"
#import "DropitBehaviour.h"

@interface DropitViewController ()
@property (weak, nonatomic) IBOutlet UIView *gameView;
@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (strong, nonatomic) DropitBehaviour *dropitBehaviour;
@end

@implementation DropitViewController

static const CGSize DROP_SIZE = { 40, 40 };

- (UIDynamicAnimator *)animator
{
    if (!_animator)
    {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.gameView];
    }
    return _animator;
}

- (DropitBehaviour *)dropitBehaviour
{
    if (!_dropitBehaviour)
    {
        _dropitBehaviour = [[DropitBehaviour alloc] init];
        [self.animator addBehavior:_dropitBehaviour];
    }
    return _dropitBehaviour;
}

- (IBAction)tap:(UITapGestureRecognizer *)sender
{
    [self drop];
}

- (UIColor *)randomColor
{
    switch (arc4random() % 5) {
        case 0: return [UIColor greenColor];
        case 1: return [UIColor blueColor];
        case 2: return [UIColor orangeColor];
        case 3: return [UIColor redColor];
        case 4: return [UIColor purpleColor];
    }
    
    return [UIColor blackColor];
}

- (void)drop
{
    CGRect frame;
    frame.origin = CGPointZero;
    frame.size = DROP_SIZE;
    int x = (arc4random() % (int)self.gameView.bounds.size.width) / DROP_SIZE.width;
    frame.origin.x = x * DROP_SIZE.width;
    
    UIView *dropView = [[UIView alloc] initWithFrame:frame];
    dropView.backgroundColor = [self randomColor];
    [self.gameView addSubview:dropView];
    
    [self.dropitBehaviour addItem:dropView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

@end
