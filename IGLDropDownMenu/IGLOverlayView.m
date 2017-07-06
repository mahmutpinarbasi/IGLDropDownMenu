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
@property (nonatomic, strong) UIView * customView;

@end

@implementation IGLOverlayView


- (id)initWithCustomView:(UIView *)view menu:(IGLDropDownMenu *)menu{
    self = [super initWithFrame:view.bounds];
    if (self) {
        _menu = menu;
        _customView = view;
        
        [self commonInit];
    }
    
    return self;

}

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
                            self.alpha = 1.0;
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
    
    self.clipsToBounds = YES;
    if (self.customView) {
        [self addSubview:self.customView];
        self.customView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.backgroundColor = [UIColor clearColor];
    }else{
        self.backgroundColor = [UIColor blackColor];
    }
    
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
