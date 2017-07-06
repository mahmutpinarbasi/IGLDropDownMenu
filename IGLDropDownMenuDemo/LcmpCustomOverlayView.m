//
//  LcmpCustomOverlayView.m
//  IGLDropDownMenuDemo
//
//  Created by Sem0043 on 06/07/2017.
//  Copyright © 2017 Galvin Li. All rights reserved.
//

#import "LcmpCustomOverlayView.h"

@interface LcmpCustomOverlayView()

@property (nonatomic, strong) CAGradientLayer * gradientLayer;

@end

@implementation LcmpCustomOverlayView


- (instancetype)init{
    
    CGRect devFrame = [UIScreen mainScreen].bounds;
    self = [super initWithFrame:devFrame];
    if (self) {
        [self commonInit];
    }
    
    return self;
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.gradientLayer.frame = self.bounds;
}


- (void)commonInit{
    [self addGradientView];
}


#pragma mark - Properties
#pragma mark - Properties
- (CAGradientLayer *)gradientLayer{
    
    if (_gradientLayer == nil) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.frame = self.bounds;
        _gradientLayer.colors = @[(id)[[UIColor blackColor] colorWithAlphaComponent:0.1].CGColor, (id)[[UIColor blackColor] colorWithAlphaComponent:0.2].CGColor,(id)[[UIColor blackColor] colorWithAlphaComponent:0.3].CGColor,(id)[[UIColor blackColor] colorWithAlphaComponent:0.4].CGColor,
                                  (id)[[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor,(id)[[UIColor blackColor] colorWithAlphaComponent:0.6].CGColor,(id)[[UIColor blackColor] colorWithAlphaComponent:0.6].CGColor];
        _gradientLayer.startPoint = CGPointMake(1,0.5);
        _gradientLayer.endPoint = CGPointMake(0,0.5);
    }
    
    return _gradientLayer;
}


- (void)addGradientView{
    
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.backgroundColor = [UIColor clearColor];
    UIView * view = [[UIView alloc] initWithFrame:self.bounds];
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [view.layer insertSublayer:self.gradientLayer atIndex:0];
    [self insertSubview:view atIndex:0];
    
}


@end
