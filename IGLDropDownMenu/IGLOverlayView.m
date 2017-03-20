//
//  IGLOverlayView.m
//  IGLDropDownMenuDemo
//
//  Created by Sem0043 on 14/03/2017.
//  Copyright © 2017 Galvin Li. All rights reserved.
//

#import "IGLOverlayView.h"
#import "IGLDropDownMenu.h"

@interface IGLOverlayView()

@property (nonatomic, weak) IGLDropDownMenu * menu;

@end

@implementation IGLOverlayView


- (id)initWithFrame:(CGRect)frame menu:(IGLDropDownMenu *)menu{
    
    self = [super initWithFrame:frame];
    if (self) {
        _menu = menu;
        [self commonInit];
    }
    
    return self;
    
}



#pragma mark - Public
- (void)show{
    self.userInteractionEnabled = NO;
    self.menu.userInteractionEnabled = NO;
    self.menu.menuButton.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.2
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                            self.alpha = 0.7;
                     } completion:^(BOOL finished) {
                         self.userInteractionEnabled = YES;
                         self.menu.userInteractionEnabled = YES;
                         self.menu.menuButton.userInteractionEnabled = YES;
                     }];
}

- (void)hide{
    
    self.userInteractionEnabled = NO;
    self.menu.userInteractionEnabled = NO;
    self.menu.menuButton.userInteractionEnabled = NO;
    
    [UIView animateWithDuration:0.2
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.alpha = 0.0;
                     } completion:^(BOOL finished) {
                         self.userInteractionEnabled = YES;
                         self.menu.userInteractionEnabled = YES;
                         self.menu.menuButton.userInteractionEnabled = YES;
                     }];
    
    
}

#pragma mark - Private
- (void)commonInit{
    
    self.backgroundColor = [UIColor blackColor];
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.alpha = 0;
    
    
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]
                                           initWithTarget:self
                                           action:@selector(tapGestureRecognized)];

    [self addGestureRecognizer:tapGesture];
}

#pragma mark - Action
- (void)tapGestureRecognized{
    [self.menu toggleView];
    [self hide];
}

@end
