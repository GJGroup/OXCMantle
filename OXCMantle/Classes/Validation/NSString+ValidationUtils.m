//
//  NSString+NSString_ValidationUtils.m
//  OXCMantle
//
//  Created by 张旭东 on 15/8/6.
//  Copyright (c) 2015年 张旭东. All rights reserved.
//

#import "NSString+ValidationUtils.h"

@implementation NSString (ValidationUtils)
+ (NSString *)capitalizeFirstCharacter:(NSString *)string {
    NSString *firstCharacter = [[string substringToIndex:1] capitalizedString];
    NSString *cappedString = [string stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:firstCharacter];
    return cappedString;
}

+ (NSString *)stripNonNumericCharacters:(NSString *)string {
    NSMutableString *res = [[NSMutableString alloc] init];
    
    for(uint i = 0; i < [string length]; i++) {
        char next = (char) [string characterAtIndex:(NSUInteger) i];
        
        if((next >= '0' && next <= '9') || next == '.') {
            [res appendFormat:@"%c", next];
        }
    }
    
    return res;
    
}

+ (NSString *)leftPadString:(NSString *)string length:(NSUInteger)length padCharacter:(NSString *)padCharacter {
    NSUInteger padding = length - [string length];
    if (padding > 0){
        NSString *pad = [[NSString string] stringByPaddingToLength:padding withString:padCharacter startingAtIndex:0];
        return [pad stringByAppendingString:string];
    }
    return string;
}

@end
