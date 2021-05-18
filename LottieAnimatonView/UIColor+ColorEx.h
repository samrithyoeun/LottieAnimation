//
//  UIColor+ColorEx.h
//  LottieAnimatonView
//
//  Created by Samrith Yoeun on 17/5/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ColorEx)
/**
 16進数カラーコードから変換

 @param hex 16進数カラーコード(例:0xFFFFFF)
 @param alpha アルファ値
 @return UIColorインスタンス
 */
+ (instancetype)colorWithHex:(NSUInteger)hex alpha:(CGFloat)alpha;
/**
 16進数カラーコード文字列から変換

 @param hexString 16進数カラーコード文字列(例:#FFFFFF)
 @param alpha アルファ値
 @return インスタンス
 */
+ (instancetype)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
