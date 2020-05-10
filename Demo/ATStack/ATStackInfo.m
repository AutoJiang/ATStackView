//
//  ATStackInfo.m
//  Demo
//
//  Created by jiang aoteng on 2019/11/6.
//  Copyright © 2019 jiang aoteng. All rights reserved.
//

#import "ATStackInfo.h"
@implementation ATStackInfo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.height = 0;
        self.width = 0;
        self.isFill = false;
        self.space = 0;
        self.hidden = false;
        self.flex = 0;
        self.alignment = ATStackAlignmentAuto;
    }
    return self;
}

@end
