//
//  SHICornerRadius.h
//  fpBird
//
//  Created by tomyKeisuke on 2015/03/02.
//  Copyright (c) 2015年 tomyAmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHICornerRadius : UIView

+(void)cornerRadiusWithButton:(UIButton*)button radius:(float)radius;

+(void)cornerRadiusWithLabel:(UILabel*)button radius:(float)radius;

+(void)cornerRadiusWithView:(UIView*)button radius:(float)radius;

@end
