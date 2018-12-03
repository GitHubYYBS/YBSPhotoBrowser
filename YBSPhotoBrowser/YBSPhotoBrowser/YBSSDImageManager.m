//
//  YBSSDImageManager.m
//  Wsloan_50
//
//  Created by 严兵胜 on 2018/4/14.
//  Copyright © 2018年 温商贷. All rights reserved.
//

#import "YBSSDImageManager.h"


#if __has_include(<SDWebImage/SDWebImageManager.h>)
#import <SDWebImage/UIImageView+WebCache.h>
//#import <SDWebImage/UIView+WebCache.h>
#import <SDWebImage/SDWebImageManager.h>
#else
#import "UIImageView+WebCache.h"
#import "UIView+WebCache.h"
#import "SDWebImageManager.h"
#endif

#import <SDWebImage/SDWebImageDownloader.h>
#import <SDWebImage/SDWebImageManager.h>

@implementation YBSSDImageManager

- (void)setImageForImageView:(UIImageView *)imageView
                     withURL:(NSURL *)imageURL
                 placeholder:(UIImage *)placeholder
                    progress:(YBSImageManagerProgressBlock)progress
                  completion:(YBSImageManagerCompletionBlock)completion
{
    [imageView sd_setImageWithURL:imageURL placeholderImage:placeholder options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        if (progress) progress(receivedSize, expectedSize);
    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
         if (completion) completion(image, imageURL, !error, error);
    }];

}

- (void)cancelImageRequestForImageView:(UIImageView *)imageView {
    [imageView sd_cancelCurrentAnimationImagesLoad];
}

- (UIImage *)imageFromMemoryForURL:(NSURL *)url {
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    NSString *key = [manager cacheKeyForURL:url];
    return [manager.imageCache imageFromMemoryCacheForKey:key];
}

@end
