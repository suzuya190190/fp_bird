//
//  SHIAlertView.m
//  fpBird
//
//  Created by tomyKeisuke on 2015/07/29.
//  Copyright (c) 2015年 tomyAmi. All rights reserved.
//

#import "SHIAlertView.h"

@implementation SHIAlertView

static SHIAlertView* instance;

+(SHIAlertView*)ins{
    if(instance==nil){
        instance = [[SHIAlertView alloc]init];
    }
    return instance;
}

-(instancetype)init{
    self = [super init];
    if(self){
        
    }
    return self;
}

-(void)showtitle:(NSString*)title msg:(NSString*)msg delete:(id)delegate {
    self.title = title;
    self.message = msg;
    self.delegate = delegate;
    [self addButtonWithTitle:@"OK"];
    [self show];
    instance = nil;
}

@end
