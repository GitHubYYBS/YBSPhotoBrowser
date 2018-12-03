//
//  YBSSDImageManager.h
//  Wsloan_50
//
//  Created by 严兵胜 on 2018/4/14.
//  Copyright © 2018年 温商贷. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^YBSImageManagerProgressBlock)(NSInteger receivedSize, NSInteger expectedSize);

typedef void (^YBSImageManagerCompletionBlock)(UIImage * _Nullable image, NSURL * _Nullable url, BOOL success, NSError * _Nullable error);



@interface YBSSDImageManager : NSObject

- (void)setImageForImageView:(nullable UIImageView *)imageView
                     withURL:(nullable NSURL *)imageURL
                 placeholder:(nullable UIImage *)placeholder
                    progress:(nullable YBSImageManagerProgressBlock)progress
                  completion:(nullable YBSImageManagerCompletionBlock)completion;

- (void)cancelImageRequestForImageView:(nullable UIImageView *)imageView;



- (UIImage *_Nullable)imageFromMemoryForURL:(nullable NSURL *)url;



@end

