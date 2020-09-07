//
//  WLImagesView.h
//  WLShowImagesView
//
//  Created by lsfb on 2020/9/7.
//  Copyright © 2020 lsfb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLImagesView : UIView

- (instancetype)initWithImages:(NSArray *)images viewWidth:(CGFloat)viewWidth itemWidth:(CGFloat)itemWidth successWithHeight:(void(^)(CGFloat))height;

@end

NS_ASSUME_NONNULL_END
