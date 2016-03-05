//
//  blueEyeController.h
//  fpBird
//
//  Created by tomyKeisuke on 2015/07/29.
//  Copyright (c) 2015年 tomyAmi. All rights reserved.
//


#import "BaseDBController.h"
#import "BEAMBEAN.h"

@interface blueEyeController : BaseDBController

-(void)createDB;

-(void)insertDB:(BEAMBEAN*)dbC;

-(BOOL)selectBool;

@end
