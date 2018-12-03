# YBSPhotoBrowser
图片浏览器 可拖动缩小 捏合缩放 背景虚化/磨砂/全黑等各种效果 

### ````先看效果````
- ![Alt text](https://github.com/GitHubYYBS/YBSPhotoBrowser/blob/master/%E6%95%88%E6%9E%9C%E5%9B%BE.gif?raw=true)

###````各种效果配置````

````
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

````

#### 特别注意->该方法在配置结束之后 一定要调用
````
/// 配置结束后 此方法必须调用
- (void)showFromViewController:(UIViewController *)vc;
````

#### ````使用````
````
// 模型转换 ->为了内部方便处理数据
 NSMutableArray *items = @[].mutableCopy;
    for (int i = 0; i < self.imageArray.count; i++) {
        YBSPhotoItem *item = [YBSPhotoItem itemWithSourceView:self.imageArray[i] imageUrl:nil];
        [items addObject:item];
    }
    
    
    YBSPhotoBrowser *browser = [YBSPhotoBrowser browserWithPhotoItems:items selectedIndex:tap.view.tag];
    browser.delegate = self;
    browser.dismissalStyle = YBSPhotoBrowserInteractiveDismissalStyleScale;
    browser.backgroundStyle = YBSPhotoBrowserBackgroundStyleBlurPhoto;
    browser.loadingStyle = YBSPhotoBrowserImageLoadingStyleIndeterminate;
    browser.pageindicatorStyle = YBSPhotoBrowserPageIndicatorStyleText;
    browser.bounces = NO;
    [browser showFromViewController:self]; // 配置结束之后 该方法一定要调用 
````
