//
//  SHIGameOverImage.m
//  fpBird
//
//  Created by tomyAmi on 2015/02/07.
//  Copyright (c) 2015年 tomyAmi. All rights reserved.
//

#import "SHIGameOverImage.h"

@implementation SHIGameOverImage

-(instancetype)initWithImage:(NSString *)imageString frame:(CGRect)frame{
    UIImage* image =[UIImage imageNamed:imageString];
    self = [super initWithImage:image];
    if(self){
        self.frame = frame;
    }
    return self;
}

@end
