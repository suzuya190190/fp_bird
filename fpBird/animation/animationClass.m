//
//  animationClass.m
//  fp__
//
//  Created by tomyAmi on 2014/08/24.
//  Copyright (c) 2014年 tomyAmi. All rights reserved.
//

#import "animationClass.h"

@implementation animationClass

+(void)beamMove_Boom{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
}

+(void)view_Move{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
}

+(void)seetheView:(CALayer *)lay{
    
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.3];
    [animation setType: kCATransitionMoveIn];
    [animation setSubtype: kCATransitionFromLeft];
    [lay addAnimation:animation forKey:nil];
}

+(void)goodByeView:(CALayer *)lay{
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.3];
    [animation setType: kCATransitionMoveIn];
    [animation setSubtype: kCATransitionFromLeft];
    [lay addAnimation:animation forKey:nil];
}

+(void)deadAnimate{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
}

+(void)animateObj:(CALayer *)cell{
    
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.3];
    [animation setType: kCATransitionMoveIn];
    [animation setSubtype: kCATransitionFromBottom];
    [cell addAnimation:animation forKey:nil];
    
}

+(void)animateFade:(CALayer *)viewController{
    
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.3];
    [animation setType: kCATransitionMoveIn];
    [animation setSubtype: kCATransitionFromBottom];
    [viewController addAnimation:animation forKey:nil];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
