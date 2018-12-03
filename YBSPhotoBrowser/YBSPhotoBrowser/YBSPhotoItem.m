//
//  YBSPhotoItem.m
//  Wsloan_50
//
//  Created by 严兵胜 on 2018/4/14.
//  Copyright © 2018年 温商贷. All rights reserved.
//

#import "YBSPhotoItem.h"

@interface YBSPhotoItem ()

@property (nonatomic, strong, readwrite) UIView *sourceView;
@property (nonatomic, strong, readwrite) UIImage *thumbImage;
@property (nonatomic, strong, readwrite) UIImage *image;
@property (nonatomic, strong, readwrite) NSURL *imageUrl;

@end

@implementation YBSPhotoItem

- (instancetype)initWithSourceView:(UIView *)view
                        thumbImage:(UIImage *)image
                          imageUrl:(NSURL *)url {
    self = [super init];
    if (self) {
        _sourceView = view;
        _thumbImage = image;
        _imageUrl = url;
    }
    return self;
}

- (instancetype)initWithSourceView:(UIImageView *)view
                          imageUrl:(NSURL *)url
{
    return [self initWithSourceView:view
                         thumbImage:view.image
                           imageUrl:url];
}

- (instancetype)initWithSourceView:(UIImageView *)view
                             image:(UIImage *)image {
    self = [super init];
    if (self) {
        _sourceView = view;
        _thumbImage = image;
        _imageUrl = nil;
        _image = image;
    }
    return self;
}

+ (instancetype)itemWithSourceView:(UIView *)view
                        thumbImage:(UIImage *)image
                          imageUrl:(NSURL *)url
{
    return [[YBSPhotoItem alloc] initWithSourceView:view
                                         thumbImage:image
                                           imageUrl:url];
}

+ (instancetype)itemWithSourceView:(UIImageView *)view
                          imageUrl:(NSURL *)url
{
    return [[YBSPhotoItem alloc] initWithSourceView:view
                                           imageUrl:url];
}

+ (instancetype)itemWithSourceView:(UIImageView *)view
                             image:(UIImage *)image
{
    return [[YBSPhotoItem alloc] initWithSourceView:view
                                              image:image];
}

@end

