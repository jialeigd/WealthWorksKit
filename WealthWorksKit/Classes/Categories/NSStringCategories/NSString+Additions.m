//
//  NSString+Additions.m
//  Pods
//
//  Created by guoyalun on 9/26/16.
//
//

#import "NSString+Additions.h"
#import <CommonCrypto/CommonDigest.h>


@implementation NSString (Additions)

- (NSString *)md5 {
    if(self == nil || [self length] == 0) {
        return nil;
    }
    
    const char *value = [self UTF8String];
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (unsigned int)strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    return outputString;
}

@end
