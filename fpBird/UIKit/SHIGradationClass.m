//
//  SHIGradationClass.m
//  fpBird
//
//  Created by tomyKeisuke on 2015/03/02.
//  Copyright (c) 2015年 tomyAmi. All rights reserved.
//

#import "SHIGradationClass.h"
#import "UIColor+Hex.h"

@implementation SHIGradationClass


+(void)gradationColor:(CALayer*)layer mine:(UIView*)mineObj :(NSArray*)colorAry{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    
    // レイヤーサイズをビューのサイズをそろえる
    gradient.frame = mineObj.bounds;
    
    // 開始色と終了色を設定
    gradient.colors = @[
                        // 開始色
                        (id)[UIColor colorWithHex:[NSString stringWithFormat:@"%@",colorAry[0]] alpha:0.8].CGColor,
                        // 終了色
                        (id)[UIColor colorWithHex:[NSString stringWithFormat:@"%@",colorAry[1]] alpha:0.9].CGColor
                        ];
    // レイヤーを追加
    [layer insertSublayer:gradient atIndex:0];
}

@end
