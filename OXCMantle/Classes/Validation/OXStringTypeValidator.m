//
// OXStringTypeValidator
// Oxen
//
// Created by Matthew on 6/16/14.
// Released under the MIT license
//


#import "OXStringTypeValidator.h"


@implementation OXStringTypeValidator

- (id)init {
    self = [super init];
	
    if (self) {
        self.defaultValidation = ^NSString *(id value, BOOL *isValid, NSError **error){
            if (!value) {
                *isValid = YES;
                return nil;
            } else if ([value respondsToSelector:@selector(stringValue)]){
                *isValid = YES;
                return [value stringValue];
            } else {
                *isValid = NO;
                return nil;
            }
        };
    }

    return self;
}

- (BOOL)validateValue:(id *)value error:(NSError **)error {
    _isValid = [*value isKindOfClass:[NSString class]];
    return [super validateValue:value error:error];
}

@end