//
//  HomeImageCollectionViewCell.h
//  SinkiangStaff
//
//  Created by OS on 2019/5/24.
//  Copyright © 2019 Hao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLImageCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (copy, nonatomic) void(^bigImageClickBlock)(void);
@end

NS_ASSUME_NONNULL_END
