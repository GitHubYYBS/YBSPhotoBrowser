//
//  YBSPhotoView.h
//  Wsloan_50
//
//  Created by 严兵胜 on 2018/4/14.
//  Copyright © 2018年 温商贷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YBSProgressLayer.h"

NS_ASSUME_NONNULL_BEGIN

extern const CGFloat kKSPhotoViewPadding;

@protocol YBSImageManager;
@class YBSPhotoItem, YYAnimatedImageView;

@interface YBSPhotoView : UIScrollView

@property (nonatomic, strong, readonly) UIImageView *imageView;
@property (nonatomic, strong, readonly) YBSProgressLayer *progressLayer;
@property (nonatomic, strong, readonly) YBSPhotoItem *item;

- (instancetype)initWithFrame:(CGRect)frame imageManager:(id<YBSImageManager>)imageManager;
- (void)setItem:(YBSPhotoItem *)item determinate:(BOOL)determinate;
- (void)resizeImageView;
- (void)cancelCurrentImageLoad;

@end

NS_ASSUME_NONNULL_END
