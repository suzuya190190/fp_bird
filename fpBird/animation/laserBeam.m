//
//  laserBeam.m
//  fpBird
//
//  Created by tomyAmi on 2015/02/01.
//  Copyright (c) 2015年 tomyAmi. All rights reserved.
//

#import "laserBeam.h"

@implementation laserBeam

-(instancetype)initWithCenter:(CGRect)position{
    self = [super init];
    if(self){
        [self initalize:position];
    }
    return self;
}

-(void)initalize:(CGRect)beamPosi{
    self.image = [UIImage imageNamed:@"blue.png"];
    self.frame = CGRectMake(beamPosi.origin.x,beamPosi.origin.y, 50, 1.5);
}

@end
