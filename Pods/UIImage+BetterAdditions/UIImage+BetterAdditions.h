//
// The MIT License (MIT)
//
// Copyright (c) 2013 Joan Martin (vilanovi@gmail.com)
//               2014 Suyeol Jeon (http://xoul.kr)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

#import <UIKit/UIKit.h>

typedef struct __UICornerInset
{
    CGFloat topLeft;
    CGFloat topRight;
    CGFloat bottomLeft;
    CGFloat bottomRight;
} UICornerInset;

UIKIT_EXTERN const UICornerInset UICornerInsetZero;

UIKIT_STATIC_INLINE UICornerInset UICornerInsetMake(CGFloat topLeft, CGFloat topRight, CGFloat bottomLeft, CGFloat bottomRight)
{
    UICornerInset cornerInset = {topLeft, topRight, bottomLeft, bottomRight};
    return cornerInset;
}

UIKIT_STATIC_INLINE UICornerInset UICornerInsetMakeWithRadius(CGFloat radius)
{
    UICornerInset cornerInset = {radius, radius, radius, radius};
    return cornerInset;
}

UIKIT_STATIC_INLINE BOOL UICornerInsetEqualToCornerInset(UICornerInset cornerInset1, UICornerInset cornerInset2)
{
    return
    cornerInset1.topLeft == cornerInset2.topLeft &&
    cornerInset1.topRight == cornerInset2.topRight &&
    cornerInset1.bottomLeft == cornerInset2.bottomLeft &&
    cornerInset1.bottomRight == cornerInset2.bottomRight;
}

FOUNDATION_EXTERN NSString* NSStringFromUICornerInset(UICornerInset cornerInset);

typedef enum __UIImageTintedStyle
{
    UIImageTintedStyleKeepingAlpha      = 1,
    UIImageTintedStyleOverAlpha         = 2
} UIImageTintedStyle;

typedef enum __UIImageGradientDirection
{
    UIImageGradientDirectionVertical    = 1,
    UIImageGradientDirectionHorizontal  = 2,
} UIImageGradientDirection;

@interface UIImage (Additions)

/*
 * Create images from colors
 */
+ (UIImage*)imageWithColor:(UIColor*)color;
+ (UIImage*)imageWithColor:(UIColor*)color size:(CGSize)size;
+ (UIImage*)imageWithColor:(UIColor*)color borderAttributes:(NSDictionary*)borderAttributes size:(CGSize)size;
+ (UIImage*)imageWithColor:(UIColor*)color borderAttributes:(NSDictionary*)borderAttributes size:(CGSize)size cornerRadius:(CGFloat)cornerRadius;
+ (UIImage*)imageWithColor:(UIColor*)color borderAttributes:(NSDictionary*)borderAttributes size:(CGSize)size cornerInset:(UICornerInset)cornerInset;

/*
 * Create rezisable images from colors
 */
+ (UIImage*)resizableImageWithColor:(UIColor*)color;
+ (UIImage*)resizableImageWithColor:(UIColor*)color cornerRadius:(CGFloat)cornerRadius;
+ (UIImage*)resizableImageWithColor:(UIColor*)color borderAttributes:(NSDictionary*)borderAttributes cornerRadius:(CGFloat)cornerRadius;
+ (UIImage*)resizableImageWithColor:(UIColor*)color borderAttributes:(NSDictionary*)borderAttributes cornerInset:(UICornerInset)cornerInset;

+ (UIImage*)blackColorImage;
+ (UIImage*)darkGrayColorImage;
+ (UIImage*)lightGrayColorImage;
+ (UIImage*)whiteColorImage;
+ (UIImage*)grayColorImage;
+ (UIImage*)redColorImage;
+ (UIImage*)greenColorImage;
+ (UIImage*)blueColorImage;
+ (UIImage*)cyanColorImage;
+ (UIImage*)yellowColorImage;
+ (UIImage*)magentaColorImage;
+ (UIImage*)orangeColorImage;
+ (UIImage*)purpleColorImage;
+ (UIImage*)brownColorImage;
+ (UIImage*)clearColorImage;

/*
 * Tint Images
 */
+ (UIImage*)imageNamed:(NSString *)name tintColor:(UIColor*)color style:(UIImageTintedStyle)tintStyle;
- (UIImage*)tintedImageWithColor:(UIColor*)color style:(UIImageTintedStyle)tintStyle;

/*
 * Rounding corners
 */
- (UIImage*)imageWithRoundedBounds;
- (UIImage*)imageWithCornerRadius:(CGFloat)cornerRadius;
- (UIImage*)imageWithCornerInset:(UICornerInset)cornerInset;
- (BOOL)isValidCornerInset:(UICornerInset)cornerInset;

/*
 * Drawing image on image
 */
- (UIImage*)imageAddingImage:(UIImage*)image;
- (UIImage*)imageAddingImage:(UIImage*)image offset:(CGPoint)offset;

/*
 * Gradient image generation
 */
+ (UIImage*)imageWithGradient:(NSArray*)colors size:(CGSize)size direction:(UIImageGradientDirection)direction;
+ (UIImage*)resizableImageWithGradient:(NSArray*)colors size:(CGSize)size direction:(UIImageGradientDirection)direction;

@end

#pragma mark - Categories

@interface NSValue (UICornerInset)

+ (NSValue*)valueWithUICornerInset:(UICornerInset)cornerInset;
- (UICornerInset)UICornerInsetValue;

@end