//
//  SHIRectMake.m
//  fpBird
//
//  Created by tomyKeisuke on 2015/03/02.
//  Copyright (c) 2015年 tomyAmi. All rights reserved.
//

#import "SHIRectMake.h"

@implementation SHIRectMake


+(CGRect)fullScreenRect:(UIView*)view{
    return CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
}

+(CGRect)fullScreenAndDownRect:(UIView*)view{
    return CGRectMake(0, 100, view.frame.size.width, view.frame.size.height-100);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
