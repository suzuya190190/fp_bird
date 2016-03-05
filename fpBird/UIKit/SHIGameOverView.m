//
//  SHIGameOverView.m
//  fpBird
//
//  Created by tomyAmi on 2015/02/07.
//  Copyright (c) 2015年 tomyAmi. All rights reserved.
//

#import "SHIGameOverView.h"
#import "UIColor+Hex.h"
#import "SHIGameOverImage.h"
#import "SHIButtonClass.h"

@implementation SHIGameOverView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.controller = nil;
        self.selector = nil;
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 10.0;
        [self gradationColor];
        [self gameOverImage];
        [self scoreLabel];
        [self oneMoreButton];
        [self endGameButton];
    }
    return self;
}

-(void)gradationColor{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    
    // レイヤーサイズをビューのサイズをそろえる
    gradient.frame = self.bounds;
    
    // 開始色と終了色を設定
    gradient.colors = @[
                        // 開始色
                        (id)[UIColor colorWithHex:@"#FF5E3A" alpha:0.8].CGColor,
                        // 終了色
                        (id)[UIColor colorWithHex:@"#FF2A68" alpha:0.9].CGColor
                        ];
    // レイヤーを追加
    [self.layer insertSublayer:gradient atIndex:0];
}


-(void)gameOverImage{
    SHIGameOverImage* gameOver = [[SHIGameOverImage alloc]initWithImage:@"GAMEOVER.png" frame:CGRectMake(self.frame.size.width/4, 20, self.frame.size.width/2, self.frame.size.width/7)];
    [self addSubview:gameOver];
}

-(void)scoreLabel{
    self.score = [[ScoreLabel alloc]initWithScoreLabel:CGRectMake(self.frame.size.width/4, self.frame.size.height/3, self.frame.size.width/1.5, self.frame.size.height/10)];
    [self addSubview:self.score];
}
-(void)oneMoreButton{
    //buttonClass* button = [[buttonClass alloc]init];
    self.onemore = [SHIButtonClass oneMoreButton:CGRectMake(self.frame.size.width/4, self.frame.size.height/2, self.frame.size.width/2, self.frame.size.height/7)];
    [self addSubview:self.onemore];
}

-(void)endGameButton{
    //buttonClass* button = [[buttonClass alloc]init];
    self.endGame = [SHIButtonClass endGameButton:CGRectMake(self.frame.size.width/4, self.frame.size.height/2+80, self.frame.size.width/2, self.frame.size.height/7)];
    [self addSubview:self.endGame];
}

@end
