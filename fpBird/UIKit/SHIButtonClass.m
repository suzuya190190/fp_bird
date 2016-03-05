//
//  buttonClass.m
//  fp__
//
//  Created by tomyAmi on 2014/08/24.
//  Copyright (c) 2014年 tomyAmi. All rights reserved.
//

#import "SHIButtonClass.h"
#import "UIColor+Hex.h"

@implementation SHIButtonClass

-(UIButton*)touchUpInside:(CGRect)frame withDelegate:(id)delegate withSelector:(SEL)selector imagheStr:(NSString *)imageStr{
    
    UIImage *image=[UIImage imageNamed:imageStr];
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:delegate action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
    
}

-(UIButton*)laserButton:(id)delegate selector:(SEL)selector frame:(CGRect)frame{
    
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.clipsToBounds = YES;
    button.layer.cornerRadius= 10.0;
    button.frame = frame;
    [button setTitle:@"B" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:25];
    [button addTarget:delegate action:selector forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor colorWithHex:@"#FF3B30" alpha:0.8];
    return button;
}

+(UIButton*)oneMoreButton:(CGRect)frame
{
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.clipsToBounds = YES;
    button.layer.cornerRadius= 10.0;
    button.frame = frame;
    [button setTitle:@"One More" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:25];
    button.backgroundColor = [UIColor colorWithHex:@"#FF3B30" alpha:0.8];
    return button;
    
}


+(UIButton*)endGameButton:(CGRect)frame{
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.clipsToBounds = YES;
    button.layer.cornerRadius= 10.0;
    button.frame = frame;
    [button setTitle:@"End Game" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:25];
    button.backgroundColor = [UIColor colorWithHex:@"#1D77EF" alpha:0.8];
    return button;
    
}

+(UIButton*)startGameButton:(CGRect)frame{
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.clipsToBounds = YES;
    button.layer.cornerRadius= 10.0;
    button.layer.borderWidth  = 5.0;
    button.layer.borderColor = [UIColor colorWithHex:@"#0BD318" alpha:0.7].CGColor;
    button.frame = frame;
    [button setTitle:@"start_Game" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:25];
    button.backgroundColor = [UIColor colorWithHex:@"#1D77EF" alpha:0.8];
    return button;
    
}

+(UIButton*)scoreTaleButton:(CGRect)frame{
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.clipsToBounds = YES;
    button.layer.cornerRadius= 10.0;
    button.frame = frame;
    [button setTitle:@"score_check" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:25];
    button.backgroundColor = [UIColor colorWithHex:@"#1D77EF" alpha:0.8];
    return button;
}

+(UIButton*)recordUpButton:(CGRect)frame{
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.clipsToBounds = YES;
    button.layer.cornerRadius= 10.0;
    button.frame = frame;
    [button setTitle:@"record_up_button" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:25];
    button.backgroundColor = [UIColor colorWithHex:@"#1D77EF" alpha:0.8];
    return button;
    
}


+(UIButton*)backSeanButton:(CGRect)frame{
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.clipsToBounds = YES;
    button.layer.cornerRadius= 10.0;
    button.frame = frame;
    [button setTitle:@"＜" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:25];
    button.backgroundColor = [UIColor colorWithHex:@"#1D77EF" alpha:0.8];
    return button;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
