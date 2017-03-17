//
//  LcmpIGLDropDownItem.m
//  matkit
//
//  Created by Sem0043 on 09/03/2017.
//  Copyright © 2017 MOBISEM. All rights reserved.
//

#import "LcmpIGLDropDownItem.h"

@interface LcmpIGLDropDownItem()

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UILabel * lblTitle;
@property (nonatomic, strong) UIColor * primaryColor;

@end

@implementation LcmpIGLDropDownItem


- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title color:(UIColor *)primaryColor{
    self = [super initWithFrame:frame];
    if (self) {
        _title = title;
        _primaryColor = primaryColor;
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit{
    [self initView];
}

- (void)initView{

    self.lblTitle = [[UILabel alloc] initWithFrame:CGRectZero];
    self.lblTitle.attributedText = [self attrStr];
    self.lblTitle.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.lblTitle];
    
    [self addLabelConstraints];
    self.backgroundColor = [UIColor clearColor];
    self.alpha = 1.0;
    
}

- (NSAttributedString *)attrStr{
    

    NSMutableParagraphStyle * style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.alignment = NSTextAlignmentCenter;
    NSDictionary * attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:18.0],
                                  NSForegroundColorAttributeName:[UIColor darkGrayColor],
                                  NSParagraphStyleAttributeName:style};
    
    NSAttributedString * str = [[NSAttributedString alloc] initWithString:_title attributes:attributes];
    
    return str;
}

- (CGRect)fittingLabelFrame{
    
    NSAttributedString * attrStr = [self attrStr];
    CGRect frame = [attrStr boundingRectWithSize:self.frame.size options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin context:NULL];
    
    return frame;
}


- (void)addLabelConstraints{
    
    CGRect fittingFrame = [self fittingLabelFrame];
    CGFloat margin = 8.0;

    
    self.lblTitle.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint * trailing = [NSLayoutConstraint constraintWithItem:self
                                                                 attribute:NSLayoutAttributeTrailing
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.lblTitle
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1.0
                                                                  constant:0.0];
    
    NSLayoutConstraint * center = [NSLayoutConstraint constraintWithItem:self.lblTitle
                                                               attribute:NSLayoutAttributeCenterY
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self
                                                               attribute:NSLayoutAttributeCenterY
                                                              multiplier:1.0
                                                                constant:0];
    
    
    NSLayoutConstraint * width = [NSLayoutConstraint constraintWithItem:self.lblTitle
                                                              attribute:NSLayoutAttributeWidth
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:nil
                                                              attribute:NSLayoutAttributeNotAnAttribute
                                                             multiplier:1.0
                                                               constant:fittingFrame.size.width+margin];
    
    NSLayoutConstraint * height = [NSLayoutConstraint constraintWithItem:self.lblTitle
                                                              attribute:NSLayoutAttributeHeight
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:nil
                                                              attribute:NSLayoutAttributeNotAnAttribute
                                                             multiplier:1.0
                                                               constant:fittingFrame.size.height+margin];
    

    
    [self addConstraints:@[trailing,center,width,height]];
    self.lblTitle.layer.masksToBounds = YES;
    self.lblTitle.layer.cornerRadius = 4.0;
    
    
    
}




@end
