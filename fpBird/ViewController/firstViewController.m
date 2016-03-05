//
//  firstViewController.m
//  fp_
//
//  Created by tomyAmi on 2014/08/23.
//  Copyright (c) 2014年 tomyAmi. All rights reserved.
//

#import "firstViewController.h"
#import "SHIButtonClass.h"
#import "SHIScoreTable.h"
#import "animationClass.h"
#import "GameScene.h"
#import "UIDevice-Hardware.h"
#import "SHIRecordUpTableViewController.h"


NSString* deviceName;

@implementation firstViewController

- (void)viewDidLoad {
    self.navigationController.navigationBarHidden = YES;
    [super viewDidLoad];
    
    deviceName = @"initialize_code";
    
    [self setUIKit];
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//画面のUIパーツ
-(void)setUIKit{
    [self backGroundImage];
    [self getScoreButton];
    [self getStartButton];
    //[self recordUpget];

}

-(void)backGroundImage{
    self.backGround_View = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"AIr.png"]];
    self.backGround_View.frame = self.view.bounds;
    [self.view addSubview:self.backGround_View];
}

-(void)getTable{
    SHIScoreTable* score = [[SHIScoreTable alloc]init];
    [animationClass animateObj:score.view.layer];
    [self.navigationController pushViewController:score animated:YES];
}

-(void)getRecordUp{
    SHIRecordUpTableViewController* recordUp = [SHIRecordUpTableViewController new];
    [animationClass animateObj:recordUp.view.layer];
    [self.navigationController pushViewController:recordUp animated:YES];
}

-(void)getStartButton{
    UIButton* but = [SHIButtonClass startGameButton:CGRectMake(self.view.frame.size.width/4, self.view.frame.size.height/1.4, self.view.frame.size.width/2, self.view.frame.size.height/10)];
    [but addTarget:self action:@selector(startView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
}

-(void)getScoreButton{
    UIButton* but = [SHIButtonClass scoreTaleButton:CGRectMake(self.view.frame.size.width/4, self.view.frame.size.height/1.9, self.view.frame.size.width/2, self.view.frame.size.height/10)];
    [but addTarget:self action:@selector(getTable) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
}

-(void)recordUpget{
    UIButton* but = [SHIButtonClass recordUpButton:CGRectMake(self.view.frame.size.width/4, self.view.frame.size.height/2.4, self.view.frame.size.width/2, self.view.frame.size.height/10)];
    [but addTarget:self action:@selector(getRecordUp) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];

}

-(void)startView{
    GameScene* game;
    if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
        //設定した[Storyboard ID]の値をキーにしてインスタンス生成
         game = [storyboard instantiateViewControllerWithIdentifier:@"ipadView"];
        [animationClass animateFade:self.navigationController.view.layer];
        [self.navigationController pushViewController:game animated:YES];

    }else if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone){
        if(/*[[UIDevice currentDevice].platformString isEqualToString:IPHONE_6_NAMESTRING]*/deviceName){
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            //設定した[Storyboard ID]の値をキーにしてインスタンス生成
            game = [GameScene new];
            
            game = [storyboard instantiateViewControllerWithIdentifier:@"iphone6View"];

            game.deviceName = @"dev_6";
        }else{
            /*UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            //設定した[Storyboard ID]の値をキーにしてインスタンス生成
            game = [storyboard instantiateViewControllerWithIdentifier:@"iphoneView"];*/
        }
        [animationClass animateFade:self.navigationController.view.layer];
        [self.navigationController pushViewController:game animated:YES];

    }
}
// 画像を回転させる
- (void)clickRotate {
    
    self.test.transform = CGAffineTransformInvert(self.test.transform);
    
    // 画面に表示されている画像をimageプロパティで取得する
//    UIImage *img = self.test.image;
//    // グラフィック機能で編集するためのオブジェクトを取得する
//    CGImageRef imgRef = [img CGImage];
//    
//    // コンテキストの編集を開始する
//    UIGraphicsBeginImageContext(CGSizeMake(img.size.height, img.size.width));
//    // グラフィック編集用のコンテキストを作成
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    // 回転処理を行う
//    // 画像の移動（スケーリングや回転で画像位置が動くのであらかじめ補正する）
//    CGContextTranslateCTM(context, img.size.height, img.size.width);
//    // 画像の拡大・縮小。マイナスを指定する反転。
//    CGContextScaleCTM(context, 1.0, -1.0);
//    // 画像の回転
//    CGFloat angle = M_PI_2;
//    CGContextRotateCTM(context, angle);
//    // 回転させて画像をRAM上に描画（画面上ではない）
//    CGContextDrawImage(context,
//                       CGRectMake(0, 0, img.size.width, img.size.height), imgRef);
//    
//    // 現在描画しているUIImageオブジェクトを取得
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    // コンテキストの編集を終了する
//    UIGraphicsEndImageContext();
    
    // 回転させた加増をimageプロパティに設定
    //self.test.image = image;
}
@end