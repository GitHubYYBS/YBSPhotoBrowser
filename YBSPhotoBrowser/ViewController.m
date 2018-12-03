//
//  ViewController.m
//  YBSPhotoBrowser
//
//  Created by 严兵胜 on 2018/11/30.
//  Copyright © 2018 严兵胜. All rights reserved.
//

#import "ViewController.h"

#import "UIImageView+WebCache.h"
#import "YBSPhotoBrowser.h"

@interface ViewController ()<YBSPhotoBrowserDelegate>

/// <# 请输入注释 #>
@property (nonatomic, strong) NSMutableArray *imageArray;
/// <# 请输入注释 #>
@property (nonatomic, strong) NSArray *url;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageArray = [NSMutableArray array];
    NSArray *url = @[
                     @"http://pic1.win4000.com/pic/b/e9/bbf0140b6e.jpg",
                     @"http://pic1.win4000.com/pic/4/d3/c1bec6017a.jpg",
                     @"http://pic1.win4000.com/pic/4/d3/3660d040d9.jpg",
                     @"http://pic1.win4000.com/pic/a/8d/4a2dd39014.jpg"
                     ];
    self.url = url;
    static CGFloat const leftAndRightDistance = 35;
    static CGFloat const distance = 10;
    CGFloat image_w = (self.view.bounds.size.width - 2 * leftAndRightDistance - (url.count - 1) * distance) / url.count;
    for (int i = 0; i < url.count; ++i) {
        UIImageView *iamgeView = [[UIImageView alloc] initWithFrame:CGRectMake(i  * (image_w + distance) + leftAndRightDistance, 100, image_w, image_w)];
        [iamgeView sd_setImageWithURL:[NSURL URLWithString:url[i]]];
        iamgeView.tag = i;
        [self.view addSubview:iamgeView];
        
        [self.imageArray addObject:iamgeView];
        iamgeView.userInteractionEnabled = true;
        [iamgeView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)]];
    }
}

- (void)tap:(UITapGestureRecognizer *)tap{
    
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
    [browser showFromViewController:self];
}

#pragma mark - YBSPhotoBrowserDelegate
- (void)ybs_photoBrowser:(YBSPhotoBrowser *)browser didSelectItem:(YBSPhotoItem *)item atIndex:(NSUInteger)index{
    
    NSLog(@"%lu",(unsigned long)index);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
