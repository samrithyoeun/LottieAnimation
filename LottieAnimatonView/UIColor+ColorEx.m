//
//  UIColor+ColorEx.m
//  LottieAnimatonView
//
//  Created by Samrith Yoeun on 17/5/21.
//

#import "UIColor+ColorEx.h"

@implementation UIColor (ColorEx)
+ (instancetype)colorWithHex:(NSUInteger)hex alpha:(CGFloat)alpha {
    NSUInteger red, green, blue;
    blue = hex & 0xFF;
    green = (hex >> 8) & 0xFF;
    red = (hex >> 16) & 0xFF;
    
    return [UIColor colorWithRed:red / 255.0f
                           green:green / 255.0f
                            blue:blue / 255.0f
                           alpha:alpha];
}

+ (instancetype)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    if ([[hexString substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"#"]) {
        hexString = [hexString substringWithRange:NSMakeRange(1, hexString.length - 1)];
    }
    
    if ([hexString length] == 3) {
        NSMutableString *_hexString = [[NSMutableString alloc] init];
        
        for (NSInteger i = 0; i < hexString.length; i++) {
            [_hexString appendString:[hexString substringWithRange:NSMakeRange(i, 1)]];
            [_hexString appendString:[hexString substringWithRange:NSMakeRange(i, 1)]];
        }
        
        hexString = [_hexString copy];
    }
    
    NSString *hexCodeStr;
    const char *hexCode;
    char *endptr;
    CGFloat red = 0.0, green = 0.0, blue = 0.0;
    
    for (NSInteger i = 0; i < 3; i++) {
        hexCodeStr = [NSString stringWithFormat:@"+0x%@", [hexString substringWithRange:NSMakeRange(i * 2, 2)]];
        hexCode    = [hexCodeStr cStringUsingEncoding:NSASCIIStringEncoding];
        
        switch (i) {
            case 0:
                red   = strtol(hexCode, &endptr, 16);
                break;
                
            case 1:
                green = strtol(hexCode, &endptr, 16);
                break;
                
            case 2:
                blue  = strtol(hexCode, &endptr, 16);
                
            default:
                break;
        }
    }
    
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
}
@end
