//
//  colorHex.h
//  fpBird
//
//  Created by tomyAmi on 2015/02/07.
//  Copyright (c) 2015年 tomyAmi. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 16進数指定でUIColorを生成する。
 */
@interface UIColor (Hex)

/**
 16進数で指定されたRGBでインスタンスを生成する
 
 @param     colorCode  RGB
 @return    UIColorインスタンス
 */
+ (UIColor *)colorWithHex:(NSString *)colorCode;

/**
 16進数で指定されたRGBとAlpha値でインスタンスを生成する
 
 @param     colorCode   RGB
 @param     alpha       Alpha値
 @return    UIColorインスタンス
 */
+ (UIColor *)colorWithHex:(NSString *)colorCode alpha:(CGFloat)alpha;

@end