//
//  SHIGameOverView.h
//  fpBird
//
//  Created by tomyAmi on 2015/02/07.
//  Copyright (c) 2015年 tomyAmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScoreLabel.h"

@interface SHIGameOverView : UIView

@property(nonatomic)ScoreLabel* score;
@property(nonatomic)UIButton* onemore;

@property(nonatomic)UIButton* endGame;

@property(nonatomic)id controller;
@property(nonatomic,assign)SEL selector;


@end
