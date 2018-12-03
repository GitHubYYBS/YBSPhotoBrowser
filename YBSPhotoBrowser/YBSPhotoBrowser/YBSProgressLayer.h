//
//  YBSProgressLayer.h
//  Wsloan_50
//
//  Created by 严兵胜 on 2018/4/14.
//  Copyright © 2018年 温商贷. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YBSProgressLayer : CAShapeLayer

- (instancetype)initWithFrame:(CGRect)frame;
- (void)startSpin;
- (void)stopSpin;

@end

NS_ASSUME_NONNULL_END
