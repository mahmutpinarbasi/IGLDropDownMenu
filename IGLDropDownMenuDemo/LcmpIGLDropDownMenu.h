//
//  LcmpIGLDropDownMenu.h
//  matkit
//
//  Created by Sem0043 on 10/03/2017.
//  Copyright © 2017 MOBISEM. All rights reserved.
//

#import "IGLDropDownMenu.h"
#import "LcmpIGLDropDownItem.h"

extern CGFloat const LcmpIpadIGLMenuButtonHeight;
extern CGFloat const LcmpIpadIGLMenuButtonWidth;
extern CGFloat const LcmpIpadIGLMenuButtonMargin;
@interface LcmpIGLDropDownMenu : IGLDropDownMenu


- (instancetype)initWithDelegate:(id<IGLDropDownMenuDelegate>)delegate;

@end
