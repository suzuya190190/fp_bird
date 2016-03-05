//
//  buttonClass.h
//  fp__
//
//  Created by tomyAmi on 2014/08/24.
//  Copyright (c) 2014年 tomyAmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHIButtonClass : UIButton

-(UIButton*)touchUpInside:(CGRect)frame withDelegate:(id)delegate withSelector:(SEL)selector imagheStr:(NSString*)imageStr;

-(UIButton*)laserButton:(id)delegate selector:(SEL)selector frame:(CGRect)frame;
+(UIButton*)oneMoreButton:(CGRect)frame;
+(UIButton*)endGameButton:(CGRect)frame;
+(UIButton*)backSeanButton:(CGRect)frame;
+(UIButton*)startGameButton:(CGRect)frame;
+(UIButton*)scoreTaleButton:(CGRect)frame;
+(UIButton*)recordUpButton:(CGRect)frame;
@end

