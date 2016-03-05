//
//  ViewController.m
//  fp_
//
//  Created by tomyAmi on 2014/08/23.
//  Copyright (c) 2014年 tomyAmi. All rights reserved.
//

#import "GameScene.h"
#import "laserBeam.h"
#import "SHIButtonClass.h"
#import "ScoreLabel.h"
#import "SHINowTimeDate.h"
#import "scoreDBController.h"
#import "blueEyeController.h"

#define HPBAR 300

NSInteger randomEnemyNumber;
NSInteger randomEnemyPosition;
NSInteger tunnelTopPosition;
NSInteger tunnelBotomPosition;
NSInteger beamPosition_x;
NSInteger beamPosition_y;
NSInteger bottomHP;
NSInteger topHP;

BOOL throughCharactor;
BOOL iPadOrIphone;
BOOL isOneMore;
CGRect beamViewButtonRect;
CGRect scoreLabelRect;
CGFloat fontFloat;
@interface GameScene ()
{
    NSTimer *timer;
    NSTimer *tunel;
    NSTimer *beamTimer;
    
}
@property(nonatomic)NSInteger bottomPosition;
@property(nonatomic)NSInteger topPositon;
@property(nonatomic)NSInteger topXpostion;
@property(nonatomic)NSInteger countPoint;
@property(nonatomic)laserBeam* laserBeam;
@property(nonatomic)CGRect enemyPosi;
@property(nonatomic)ScoreLabel* score;
@property(nonatomic)BOOL gameOverFlag;

@property(nonatomic)UIImageView* deathImage;

@end

@implementation GameScene

- (void)viewWillAppear:(BOOL)animated {
    isOneMore = NO;
     _gameOverFlag = NO;
    [super viewWillAppear:animated];
    throughCharactor = NO;
    [self backButton];
    [self initialize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)backButton{
    UIButton* but=[SHIButtonClass backSeanButton:CGRectMake(self.view.frame.size.width-80, 20, 50, 50)];
    [but addTarget:self action:@selector(endGame:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
}

-(void)beamButton{
    SHIButtonClass* button = [[SHIButtonClass alloc]init];
    
    UIButton* button_ = [button laserButton:self selector:@selector(beamLaser) frame:beamViewButtonRect];
    
    [self.view addSubview:button_];
}

-(void)initHP{
    [self deviceSize];
    self.countPoint=0;
    bottomHP=HPBAR;
    topHP=HPBAR;
}

/*
 * デバイス別の情報取得
 *　
 *
 */
-(void)deviceSize{
    
    //self.bottomTunnel.hidden = YES;
    
    
    if([UIDevice currentDevice].userInterfaceIdiom==UIUserInterfaceIdiomPad){
        iPadOrIphone = YES;
        self.topPositon  = 378;
        self.bottomPosition = 1125;
        self.topXpostion = 780;
        beamViewButtonRect = CGRectMake(12, self.view.frame.size.height-100, 150, 150);
        scoreLabelRect = CGRectMake(10, 10, 300, 100);
        fontFloat = 25;
        
    }else if([self.deviceName isEqualToString:@"dev_6"]){
        iPadOrIphone = NO;
        self.topPositon  = 270;
        self.bottomPosition = 780;
        self.topXpostion = 400;
        beamViewButtonRect = CGRectMake(12, self.view.frame.size.height-100, 60, 60);
        scoreLabelRect = CGRectMake(10, 10, 200, 50);
        fontFloat = 19;
    }else {
        iPadOrIphone = NO;
        self.topPositon  = 128;
        self.bottomPosition = 525;
        self.topXpostion = 340;
        beamViewButtonRect = CGRectMake(12, self.view.frame.size.height-100, 60, 60);
        scoreLabelRect = CGRectMake(10, 10, 200, 50);
        fontFloat = 19;

    }
}

-(void)initialize{
    [self initHP];
    [self scoreLabel];
    [self gameOverViewAddView];
    [self beamLaserView];
    [self beamButton];
}
/**
 *  青い光線
 */
-(void)beamLaserView{
    self.laserBeam = [[laserBeam alloc]initWithCenter:self.characotor.frame];
    self.laserBeam.hidden = YES;
    [self.view addSubview:self.laserBeam];
}

-(void)scoreLabel{
    self.score = [[ScoreLabel alloc]initWithFrame:CGRectMake(10, 10, 200, 50)];
    self.score.text = @" Score";
    self.score.font = [UIFont systemFontOfSize:fontFloat];
    [self.view addSubview:self.score];
}

-(void)startGametime{
    self.characotor.hidden = NO;
    self.deathImage.hidden = YES;
    _gameOverFlag = NO;
    [self timerStop];
    //キャラクター　player
    timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(move_Act) userInfo:nil repeats:YES];
    // 障害物
    tunel = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(tunnel_Move) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop]addTimer:tunel forMode:NSDefaultRunLoopMode];
    //トンネル生成
    [self tunnelPosi];
    //敵生成
    if(isOneMore==YES){
        isOneMore = NO;
       // [self enemy_s];
    }
}

/**
 *  開始ボタン押下時
 *  ($^$).oO push! start Button!
 *  @param sender
 */
- (IBAction)startAct:(id)sender {
    self.startButton.hidden = YES;
    [self startGametime];
}

/**
 *  キャラクター
 *  キャラクター動き
 */
-(void)move_Act{
    self.characotor.center = CGPointMake(self.characotor.center.x, self.characotor.center.y+6);
}
/**
 *  画面タップ時
 *  押下でキャラクターを上下に動かす。
 *
 *  @param touches
 *  @param event
 */

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if(self.gameOverFlag==NO){
        self.characotor.center = CGPointMake(self.characotor.center.x, self.characotor.center.y-35);
    }
}

/**
 *  障害物生成
 */
-(void)tunnelPosi{
    NSInteger randomSeed=0;
    randomSeed = iPadOrIphone ? 450 : 350;
    throughCharactor=NO;
    tunnelTopPosition=arc4random() % 390;
    tunnelTopPosition = tunnelTopPosition -self.topPositon;
    tunnelBotomPosition = tunnelTopPosition +self.bottomPosition;
    self.tunnelTop.center = CGPointMake(self.topXpostion, tunnelTopPosition);
    self.bottomTunnel.center = CGPointMake(self.topXpostion, tunnelBotomPosition);
}


/**************************
 * SCARY ENEMY
 *
 *
 */

-(BOOL)randomEnemy{
    
    randomEnemyNumber = arc4random() % 2;
    
    if(randomEnemyNumber==1){
        return 1;
    }else{
        return 0;
    }
}

-(void)enemy_s{
    randomEnemyPosition=0;
    
    randomEnemyPosition = arc4random() % 5;
    
    randomEnemyPosition = self.view.frame.size.height/randomEnemyPosition-80;
    
    self.enemy_Label.center = CGPointMake(self.topXpostion+270, randomEnemyPosition);
    if(isOneMore==YES){
        isOneMore = NO;
        self.enemy_Label.hidden = YES;
    }
}


/**
 * 障害物
 * 衝突判定
 */
-(void)tunnel_Move{
    
    /**
     *  テスト用
     *
     *  @param %_% <#%_% description#>
     *
     *  @return <#return value description#>
     */
    
    self.enemyPosi = self.enemy_Label.frame;
    
    self.enemy_Label.center = CGPointMake(self.enemy_Label.center.x-10, self.enemy_Label.center.y);
    
    
    
    //。？（）(%_%).oO 上障害物の動き
    self.tunnelTop.center = CGPointMake(self.tunnelTop.center.x-6, self.tunnelTop.center.y);
    
    //(%_%).oO 下の障害物の動き
    self.bottomTunnel.center = CGPointMake(self.bottomTunnel.center.x-6, self.bottomTunnel.center.y);
    
    if(self.tunnelTop.center.x < -28){[self tunnelPosi];}
    
    if(self.enemy_Label.center.x < -28){[self enemy_s];}
    
    if(self.tunnelTop.center.x < self.view.frame.size.width/1.7){}
    
    if(_gameOverFlag==NO){
        //count point (#_#).oO
        if((self.tunnelTop.center.x + self.tunnelTop.frame.size.width) < self.characotor.center.x){
            [self through];
        }
        /**
         *  上部障害物にぶつかったときの判定
         */
        if(CGRectIntersectsRect(self.characotor.frame, self.tunnelTop.frame)){
            [self gameOver];
        }
        
        /**
         *  下部障害物にぶつかったときの判定
         */
        if(CGRectIntersectsRect(self.characotor.frame, self.bottomTunnel.frame)){
            [self gameOver];
        }
        
        /**
         *  下画面から外れたとき
         */
        if(self.characotor.center.y < 0){
            [self gameOver];
        }
        
        /**
         *  上記画面から外れたとき
         */
        if(self.characotor.center.y  > self.view.frame.size.height){
            [self gameOver];
        }
        
        if(CGRectIntersectsRect(self.characotor.frame, self.enemy_Label.frame))
        {}
        if(CGRectIntersectsRect(self.characotor.frame, self.enemy_Label.frame)){
            [self gameOver];
        }
    }
    
}

-(void)through{
    if(throughCharactor==NO){
        throughCharactor=YES;
        self.countPoint++;
        self.score.text = [NSString stringWithFormat:@" Score   %d",self.countPoint];
    }
}

/**
 *  画面上のボタン押下時の処理
 *
 *  @param sender
 */
- (void)beamLaser {
    if(self.gameOverFlag==NO){
        self.laserBeam.hidden = NO;
        
        beamPosition_x = self.characotor.center.x;
        beamPosition_y = self.characotor.center.y;
        if([self superBeam]){
            self.laserBeam.frame = CGRectMake(beamPosition_x, beamPosition_y, self.laserBeam.frame.size.width*2, self.laserBeam.frame.size.height);
        }
        
        beamTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(beam_Attack) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop]addTimer:beamTimer forMode:NSDefaultRunLoopMode];
    }
    
    //[self beam_Attack];
}


-(BOOL)superBeam{
    blueEyeController* blue = [blueEyeController new];
    return [blue selectBool];
}

/**
 *  ビーム光線(#_#)----->>>  >>  >> . >
 */
-(void)beam_Attack{
    
    beamPosition_x += 3;
    
    self.laserBeam.center =  CGPointMake(beamPosition_x, beamPosition_y);
    [self getEnemyNumber];
}

/**
 *  beaming   ---->>>  (@_@).oO ouch1!!!!!
 */
-(void)getEnemyNumber{
    
    self.enemyPosi=self.enemy_Label.frame;
    
    if(CGRectIntersectsRect(self.laserBeam.frame, self.enemy_Label.frame)){
        [self deathEnemy];
        [self countBeanHit:1];
        
    }
    if(CGRectIntersectsRect(self.laserBeam.frame, self.bottomTunnel.frame)){
        bottomHP--;
        if(bottomHP==0){
            [self bottomDead];
            [self countBeanHit:5];
            bottomHP=HPBAR;
        }
        
    }
    
    if(CGRectIntersectsRect(self.laserBeam.frame, self.tunnelTop.frame)){
        topHP--;
        if(topHP==0){
            [self topDead];
            topHP=HPBAR;
            [self countBeanHit:5];
        }
    }
    
}

-(NSInteger)hitRect:(CGRect)rect enemyHit:(CGRect)enemy{
    NSInteger hit = 0;
    if(CGRectIntersectsRect(rect, enemy)){
        hit = 1;
    }
    return hit;
}

-(void)topDead{
    [animationClass deadAnimate];
    self.tunnelTop.center = CGPointMake(self.tunnelTop.center.x, 600);
    [UIView commitAnimations];
    
}

-(void)bottomDead{
    [animationClass deadAnimate];
    self.bottomTunnel.center = CGPointMake(self.bottomTunnel.center.x, 600);
    [UIView commitAnimations];
    
}


-(void)deathEnemy{
    
    [animationClass deadAnimate];
    self.enemy_Label.center = CGPointMake(self.characotor.center.x, 600);
    [UIView commitAnimations];
    
}

-(void)countBeanHit:(NSInteger)count{
    self.countPoint+=count;
    self.score.text = [NSString stringWithFormat:@" Score   %d",self.countPoint];
}

-(void)bombImage{
    //self.deathImage.hidden = NO;
    self.characotor.image = [UIImage imageNamed:@"1.png"];
    NSMutableArray* mutableArray =[NSMutableArray array];
    NSArray* imageAnimatyionArray = @[@"2.png",@"3.png",@"4.png",@"5.png",@"6.png",@"7.png",@"8.png",@"9.png",@"10.png",@"11.png",@"12.png",@"13.png",@"14.png"];
    for(NSString* imageStr in imageAnimatyionArray){
        [mutableArray addObject:[UIImage imageNamed:imageStr]];
    }
    self.characotor.animationImages = mutableArray;
    self.characotor.animationDuration = 0.3f;
    self.characotor.animationRepeatCount = 2;
    [self.characotor startAnimating];
    [self performSelector:@selector(fadeOut) withObject:nil afterDelay:1];
}

-(void)fadeOut{
    self.characotor.hidden = YES;
}

/****************************************
 *  GAME OVER |
 *            |
 *  GAME OVER |
 ****************************************/
-(void)gameOver{
    [self bombImage];
    insertDBController(self.countPoint);
    
    self.gameOverView.score.text = [NSString stringWithFormat:@" Score:%d",self.countPoint];
    
    [self see_View];
}

void insertDBController(int score_){
    SHINowTimeDate* time_now = [SHINowTimeDate new];
    scoreDBController* scoreCont = [scoreDBController new];
    //NSLog(@"time-->>>>   %@",[time_now nowData]);
    scoreDB* scores = [scoreDB new];
    scores.dayAndNight = [time_now nowData];
    scores.score = [NSNumber numberWithInt:score_];
    [scoreCont insertDB:scores];
}

-(void)gameOverViewAddView{
    self.gameOverView = [[SHIGameOverView alloc]initWithFrame:[self ipadOrIphoneWindowDown]];
    [self.gameOverView.onemore addTarget:self action:@selector(oneMore:) forControlEvents:UIControlEventTouchUpInside];
    [self.gameOverView.endGame addTarget:self action:@selector(endGame:) forControlEvents:UIControlEventTouchUpInside];
    self.gameOverView.score.text = self.score.text;
    [self.view addSubview:self.gameOverView];
}
/**
 *
 */
-(void)see_View{
    _gameOverFlag = YES;
    [animationClass view_Move];
    self.gameOverView.frame = [self ipadOrIphoneWindowUp];
    [UIView commitAnimations];
}

-(void)good_Bye_View{
    _gameOverFlag = NO;
    [animationClass view_Move];
    self.gameOverView.frame = [self ipadOrIphoneWindowDown];
    [UIView commitAnimations];
    
}

-(CGRect)ipadOrIphoneWindowUp{
    CGRect rect;
    if([UIDevice currentDevice].userInterfaceIdiom==UIUserInterfaceIdiomPad){
        rect = CGRectMake(self.view.frame.size.width/6, self.view.frame.size.height/5, 500, 500);
    }else{
        rect = CGRectMake(self.view.frame.size.width/24, self.view.frame.size.height/5, 300, 300);
    }
    return rect;
}

-(CGRect)ipadOrIphoneWindowDown{
    CGRect rect;
    if([UIDevice currentDevice].userInterfaceIdiom==UIUserInterfaceIdiomPad){
        rect = CGRectMake(self.view.frame.size.width/6, self.view.frame.size.height/5-1000, 500, 500);
    }else{
        rect = CGRectMake(self.view.frame.size.width/24, self.view.frame.size.height/5-1000, 300, 300);
    }
    return rect;
}

-(void)timerStop{
    [timer invalidate];
    [tunel invalidate];
    timer = nil;
    tunel = nil;
}

- (IBAction)oneMore:(id)sender {
    isOneMore = YES;
    [self initHP];
    self.score.text = @" Score";
    self.characotor.image = [UIImage imageNamed:@"easyMap.png"];
    [self good_Bye_View];
    _gameOverFlag = NO;
    throughCharactor = NO;
    self.characotor.center = self.view.center;
    [self startGametime];
}

- (IBAction)endGame:(id)sender {
    _gameOverFlag = NO;
    [animationClass animateFade:self.navigationController.view.layer];
    [self.navigationController popViewControllerAnimated:YES];
}


@end
