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
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0.7;
    }];
}

- (void)hide{
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0.0;
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
