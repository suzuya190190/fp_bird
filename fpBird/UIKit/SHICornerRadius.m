//
//  SHICornerRadius.m
//  fpBird
//
//  Created by tomyKeisuke on 2015/03/02.
//  Copyright (c) 2015年 tomyAmi. All rights reserved.
//

#import "SHICornerRadius.h"

@implementation SHICornerRadius

+(void)cornerRadiusWithButton:(UIButton*)button radius:(float)radius{
    button.clipsToBounds = YES;
    button.layer.cornerRadius = radius;
}

+(void)cornerRadiusWithLabel:(UILabel*)button radius:(float)radius{
    button.clipsToBounds = YES;
    button.layer.cornerRadius = radius;
}


+(void)cornerRadiusWithView:(UIView*)button radius:(float)radius{
    button.clipsToBounds = YES;
    button.layer.cornerRadius = radius;
}

@end
