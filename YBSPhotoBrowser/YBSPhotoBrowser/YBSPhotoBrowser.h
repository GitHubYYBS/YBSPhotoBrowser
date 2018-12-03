//
//  YBSPhotoBrowser.h
//  Wsloan_50
//
//  Created by 严兵胜 on 2018/4/14.
//  Copyright © 2018年 温商贷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YBSPhotoItem.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, YBSPhotoBrowserInteractiveDismissalStyle) { // 拖拽 消失类型
    YBSPhotoBrowserInteractiveDismissalStyleRotation, // 旋转
    YBSPhotoBrowserInteractiveDismissalStyleScale, // 尺寸缩放 全范围的拖拽
    YBSPhotoBrowserInteractiveDismissalStyleSlide, // 只能上下拖拽
    YBSPhotoBrowserInteractiveDismissalStyleNone // 什么都没有 拖拽没效果
};

typedef NS_ENUM(NSUInteger, YBSPhotoBrowserBackgroundStyle) { // 背景效果
    YBSPhotoBrowserBackgroundStyleBlurPhoto, // 当前图片模型
    YBSPhotoBrowserBackgroundStyleBlur, // 半透明 (有点磨砂的感觉)
    YBSPhotoBrowserBackgroundStyleBlack // 纯黑色
};

typedef NS_ENUM(NSUInteger, YBSPhotoBrowserPageIndicatorStyle) { // 浏览张数显示效果
    YBSPhotoBrowserPageIndicatorStyleDot, // 点点效果
    YBSPhotoBrowserPageIndicatorStyleText // 数字效果 如 4/20
};

typedef NS_ENUM(NSUInteger, YBSPhotoBrowserImageLoadingStyle) { //  加载大图时  菊花的展示形式
    YBSPhotoBrowserImageLoadingStyleIndeterminate, // 清晰的
    YBSPhotoBrowserImageLoadingStyleDeterminate // 模糊的
};

@protocol YBSPhotoBrowserDelegate, YBSImageManager;
@interface YBSPhotoBrowser : UIViewController

@property (nonatomic, assign) YBSPhotoBrowserInteractiveDismissalStyle dismissalStyle;
@property (nonatomic, assign) YBSPhotoBrowserBackgroundStyle backgroundStyle;
@property (nonatomic, assign) YBSPhotoBrowserPageIndicatorStyle pageindicatorStyle;
@property (nonatomic, assign) YBSPhotoBrowserImageLoadingStyle loadingStyle;
/// 出现及 消失时 是否有动画
@property (nonatomic, assign) BOOL bounces;

@property (nonatomic, weak) id<YBSPhotoBrowserDelegate> delegate;

/**
 展示-内部会调用(initWithPhotoItems: selectedIndex:)
 
 @param photoItems 图片模型
 @param selectedIndex 当前选中第几个
 @return 严兵胜
 */
+ (instancetype)browserWithPhotoItems:(NSArray<YBSPhotoItem *> *)photoItems selectedIndex:(NSUInteger)selectedIndex;

/**
 展示API
 
 @param photoItems 图片模型
 @param selectedIndex 当前选中第几张
 @return 严兵胜
 */
- (instancetype)initWithPhotoItems:(NSArray<YBSPhotoItem *> *)photoItems selectedIndex:(NSUInteger)selectedIndex;

/// 配置结束后 此方法必须调用
- (void)showFromViewController:(UIViewController *)vc;

@end




@protocol YBSPhotoBrowserDelegate <NSObject>

- (void)ybs_photoBrowser:(YBSPhotoBrowser *)browser didSelectItem:(YBSPhotoItem *)item atIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END

