//
//  SHSSelctor.m
//  SHSPhoneComponent
//
//  Created by Mustafa Ahmed on 8/7/18.
//  Copyright © 2018 SHS. All rights reserved.
//

#import "SHSSelctor.h"

@implementation SHSSelctor
-(instancetype)initWithSelector:(SEL)selector {
    if (self = [super init]) {
        self.selector = selector;
    }
    return self;
}
@end
