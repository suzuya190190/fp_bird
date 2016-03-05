//
//  ViewController.h
//  fp_
//
//  Created by tomyAmi on 2014/08/23.
//  Copyright (c) 2014年 tomyAmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "animationClass.h"
#import "SHIGameOverView.h"

typedef NS_ENUM(NSInteger, SHIHitType){
    SHIEnemyHit =0,
    SHITunnelHit,
    SHIHitTopTunnel,
};

@interface GameScene : UIViewController

@property(nonatomic)SHIGameOverView* gameOverView;

@property (weak, nonatomic) IBOutlet UIImageView *characotor;

@property (weak, nonatomic) IBOutlet UIButton *startButton;

- (IBAction)startAct:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *tunnelTop;
@property (weak, nonatomic) IBOutlet UIImageView *bottomTunnel;

@property(nonatomic,strong)NSString* deviceName;

//エネミーさん
@property (strong, nonatomic) IBOutlet UIImageView *enemy_Label;
@end

