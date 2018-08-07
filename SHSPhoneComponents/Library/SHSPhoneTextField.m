//
//  SHSPhoneTextField.m
//  PhoneComponentExample
//
//  Created by Willy on 18.04.13.
//  Copyright (c) 2013 SHS. All rights reserved.
//

#import "SHSPhoneTextField.h"
#import "SHSPhoneNumberFormatter+UserConfig.h"

@implementation SHSPhoneTextField

-(void) logicInitialization
{
    _formatter = [[SHSPhoneNumberFormatter alloc] init];
    _formatter.textField = self;
    
    logicDelegate = [[SHSPhoneLogic alloc] init];
    
    [super setDelegate:logicDelegate];
    self.keyboardType = UIKeyboardTypeNumberPad;
    self.hasPredictiveInput = NO;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self logicInitialization];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self logicInitialization];
    }
    return self;
}

#pragma mark -
#pragma mark Delegates

-(void) setDelegate:(id<UITextFieldDelegate>)delegate
{
    logicDelegate.delegate = delegate;
}

-(id<UITextFieldDelegate>) delegate
{
    return logicDelegate.delegate;
}

#pragma mark -
#pragma mark Additional Text Setter

-(void) setFormattedText:(NSString *)text
{
    [SHSPhoneLogic applyFormat:self forText:text];
}

-(NSString *) phoneNumber
{
    return [self.formatter digitOnlyString:self.text];
}

-(NSString *)phoneNumberWithoutPrefix
{
    return [self.formatter digitOnlyString:[self.text stringByReplacingOccurrencesOfString:self.formatter.prefix withString:@""]];
}

-(void)registerSelector:(SHSSelctor *)selector{
    NSMutableArray *m_selectors = [[NSMutableArray alloc] initWithArray:selectors];
    [m_selectors addObject:selector];
    selectors = [m_selectors copy];
}

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    for (SHSSelctor *selector in selectors) {
        if (selector.selector == action) {
            return YES;
        }
    }
    return NO;
}

@end


