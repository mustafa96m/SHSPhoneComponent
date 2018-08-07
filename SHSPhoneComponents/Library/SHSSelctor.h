//
//  SHSSelctor.h
//  SHSPhoneComponent
//
//  Created by Mustafa Ahmed on 8/7/18.
//  Copyright © 2018 SHS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHSSelctor : NSObject

@property (nonatomic) SEL selector;
-(instancetype)initWithSelector:(SEL)selector;
@end
