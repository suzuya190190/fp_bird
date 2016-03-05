//
//  ScoreLabel.m
//  fpBird
//
//  Created by tomyAmi on 2015/02/01.
//  Copyright (c) 2015年 tomyAmi. All rights reserved.
//

#import "ScoreLabel.h"
#import "UIColor+Hex.h"
@implementation ScoreLabel

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 10;
        self.backgroundColor = [UIColor colorWithHex:@"#007AFF" alpha:0.8];
        self.textColor = [UIColor whiteColor];
    }
    return self;
}

-(instancetype)initWithScoreLabel:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor clearColor];
        self.textColor = [UIColor colorWithHex:@"#E0F8D8" alpha:1];
        self.font = [UIFont systemFontOfSize:30];
    }
    return self;
}


@end
