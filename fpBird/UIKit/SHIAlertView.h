//
//  SHIAlertView.h
//  fpBird
//
//  Created by tomyKeisuke on 2015/07/29.
//  Copyright (c) 2015年 tomyAmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHIAlertView : UIAlertView

+(SHIAlertView*)ins;

-(void)showtitle:(NSString*)title msg:(NSString*)msg delete:(id)delegate;

@end
