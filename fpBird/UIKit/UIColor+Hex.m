//
//  colorHex.m
//  fpBird
//
//  Created by tomyAmi on 2015/02/07.
//  Copyright (c) 2015年 tomyAmi. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor *)colorWithHex:(NSString *)colorCode
{
    return [UIColor colorWithHex:colorCode alpha:1.0];
}

+ (UIColor *)colorWithHex:(NSString *)colorCode alpha:(CGFloat)alpha
{
    if ([[colorCode substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"#"]) {
        colorCode = [colorCode substringWithRange:NSMakeRange(1, colorCode.length - 1)];
    }
    
    if ([colorCode length] == 3) {
        NSMutableString *_colorCode = [[NSMutableString alloc] init];
        
        for (NSInteger i = 0; i < colorCode.length; i++) {
            [_colorCode appendString:[colorCode substringWithRange:NSMakeRange(i, 1)]];
            [_colorCode appendString:[colorCode substringWithRange:NSMakeRange(i, 1)]];
        }
        
        colorCode = [_colorCode copy];
    }
    
    NSString *hexCodeStr;
    const char *hexCode;
    char *endptr;
    CGFloat redValue=0.0, greenValue=0.0, blueValue = 0.0;
    
    for (NSInteger i = 0; i < 3; i++) {
        hexCodeStr = [NSString stringWithFormat:@"+0x%@", [colorCode substringWithRange:NSMakeRange(i * 2, 2)]];
        hexCode    = [hexCodeStr cStringUsingEncoding:NSASCIIStringEncoding];
        
        switch (i) {
            case 0:
                redValue   = strtol(hexCode, &endptr, 16);
                break;
                
            case 1:
                greenValue = strtol(hexCode, &endptr, 16);
                break;
                
            case 2:
                blueValue  = strtol(hexCode, &endptr, 16);
                
            default:
                break;
        }
    }
    
    return [UIColor colorWithRed:redValue / 255.0 green:greenValue / 255.0 blue:blueValue / 255.0 alpha:alpha];
}

@end