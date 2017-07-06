//
//  IGLOverlayView.h
//  IGLDropDownMenuDemo
//
//  Created by Sem0043 on 14/03/2017.
//  Copyright © 2017 Galvin Li. All rights reserved.
//

#import <UIKit/UIKit.h>


@class IGLDropDownMenu;
@interface IGLOverlayView : UIView

- (id)initWithCustomView:(UIView *)view menu:(IGLDropDownMenu *)menu;
- (id)initWithFrame:(CGRect)frame menu:(IGLDropDownMenu *)menu;


- (void)show;
- (void)hide;


@end
