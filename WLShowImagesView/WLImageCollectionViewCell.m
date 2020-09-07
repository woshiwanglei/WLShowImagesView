//
//  HomeImageCollectionViewCell.m
//  SinkiangStaff
//
//  Created by OS on 2019/5/24.
//  Copyright © 2019 Hao. All rights reserved.
//

#import "WLImageCollectionViewCell.h"
@interface WLImageCollectionViewCell()

@end
@implementation WLImageCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bigImage)];
    [self.imageView addGestureRecognizer:tap];
    // Initialization code
}

-(void)bigImage{
    if (self.bigImageClickBlock) {
        self.bigImageClickBlock();
    }
}

@end
