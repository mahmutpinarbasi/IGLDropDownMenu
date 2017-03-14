//
//  LcmpIGLDropDownMenu.m
//  matkit
//
//  Created by Sem0043 on 10/03/2017.
//  Copyright © 2017 MOBISEM. All rights reserved.
//

#import "LcmpIGLDropDownMenu.h"



CGFloat const LcmpIpadIGLMenuButtonHeight = 56.0;
CGFloat const LcmpIpadIGLMenuButtonWidth = 56.0;
CGFloat const LcmpIpadIGLMenuButtonMargin = 8.0;

@interface LcmpIGLDropDownMenu()

@property (nonatomic, strong) UIView * customBackgroundView;

@end

@implementation LcmpIGLDropDownMenu

- (instancetype)initWithDelegate:(id<IGLDropDownMenuDelegate>)delegate{
    
    self = [super initWithMenuButtonCustomView:self.customBackgroundView itemSize:self.itemSize];
    
    if (self) {
        [self resetParams];
        self.delegate = delegate;
        self.direction = IGLDropDownMenuDirectionUp;
        self.type = IGLDropDownMenuTypeNormal;
        self.gutterY = 2;
        self.alphaOnFold = 0.0;
        self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
        [self commonInit];
    }
    
    return self;
    
    
}


#pragma mark - Private
- (UIView *)customBackgroundView{
    
    if (_customBackgroundView == nil) {
        _customBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LcmpIpadIGLMenuButtonWidth, LcmpIpadIGLMenuButtonHeight)];
        _customBackgroundView.layer.cornerRadius = LcmpIpadIGLMenuButtonHeight/2;
        _customBackgroundView.backgroundColor = [UIColor whiteColor];
        _customBackgroundView.layer.shadowOpacity = 5.0;
        _customBackgroundView.layer.shadowOffset = CGSizeZero;
    }
    
    return _customBackgroundView;
}

- (CGSize)itemSize{
    return CGSizeMake(240.0-LcmpIpadIGLMenuButtonWidth, 56.0);
}

- (void)commonInit{
    
    CGRect itemFrame = CGRectMake(0, 0, self.itemSize.width, self.itemSize.height);
    NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
    UIColor * color = [UIColor redColor];
    
    
    LcmpIGLDropDownItem * contentView = [[LcmpIGLDropDownItem alloc] initWithFrame:itemFrame title:NSLocalizedString(@"Favoriler", @"") color:color];
    IGLDropDownItem *item = [[IGLDropDownItem alloc] initWithCustomView:contentView forMenu:@"Favourite"];
    [dropdownItems addObject:item];
    
    LcmpIGLDropDownItem * contentView2 = [[LcmpIGLDropDownItem alloc] initWithFrame:itemFrame title:NSLocalizedString(@"Son Görüntülenler", @"") color:color];
    IGLDropDownItem *item_2 = [[IGLDropDownItem alloc] initWithCustomView:contentView2 forMenu:@"LastView"];
    [dropdownItems addObject:item_2];
    
    
    if ([@"Product" isEqualToString:@"Product"]) {
        LcmpIGLDropDownItem * contentView = [[LcmpIGLDropDownItem alloc] initWithFrame:itemFrame title:@"Product" color:color];
        IGLDropDownItem * menuItem = [[IGLDropDownItem alloc] initWithCustomView:contentView forMenu:@"Product"];
        [dropdownItems addObject:menuItem];
    }else if ([@"Company" isEqualToString:@"Company"]) {
        LcmpIGLDropDownItem * contentView = [[LcmpIGLDropDownItem alloc] initWithFrame:itemFrame title:@"Company" color:color];
        IGLDropDownItem * menuItem = [[IGLDropDownItem alloc] initWithCustomView:contentView forMenu:@"Company"];
        [dropdownItems addObject:menuItem];
    }else if ([@"Contact" isEqualToString:@"Contact"]){
        LcmpIGLDropDownItem * contentView = [[LcmpIGLDropDownItem alloc] initWithFrame:itemFrame title:@"Contact" color:color];
        IGLDropDownItem * menuItem = [[IGLDropDownItem alloc] initWithCustomView:contentView forMenu:@"Contact"];
        [dropdownItems addObject:menuItem];
    }
    
    LcmpIGLDropDownItem * contentView5 = [[LcmpIGLDropDownItem alloc] initWithFrame:itemFrame title:NSLocalizedString(@"Paylaş", @"") color:color];
    IGLDropDownItem *share = [[IGLDropDownItem alloc] initWithCustomView:contentView5 forMenu:@"Paylaş"];
    [dropdownItems addObject:share];
    
    
    
    self.dropDownItems = dropdownItems;
    self.itemSize = itemFrame.size;
}

@end
