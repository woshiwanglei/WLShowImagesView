//
//  WLImagesView.m
//  WLShowImagesView
//
//  Created by lsfb on 2020/9/7.
//  Copyright © 2020 lsfb. All rights reserved.
//

#import "WLImagesView.h"
#import "YBImageBrowser.h"
#import "WLImageCollectionViewCell.h"
#import "UIImageView+WebCache.h"

static const CGFloat kMinLineSpacing = 8;
static const CGFloat kMinInteritemSpacing = 8;

@interface WLImagesView()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (nonatomic, strong)NSArray *images;
@property (strong, nonatomic) UICollectionView *collectionView;
@property (assign, nonatomic) CGFloat CellimageWidth;

@end

@implementation WLImagesView
- (instancetype)initWithImages:(NSArray *)images viewWidth:(CGFloat)viewWidth itemWidth:(CGFloat)itemWidth successWithHeight:(void(^)(CGFloat))height{
    if ( self = [super init] ) {
        self.backgroundColor = [UIColor whiteColor];
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = kMinLineSpacing;
        layout.minimumInteritemSpacing = kMinInteritemSpacing;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.backgroundColor = [UIColor whiteColor];
        [self.collectionView registerNib:[UINib nibWithNibName:@"WLImageCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"WLImageCollectionViewCell"];
        [self addSubview:self.collectionView];
        self.collectionView.scrollEnabled = NO;
        
        self.images = images;
        self.CellimageWidth = itemWidth;
        NSInteger oneLineCount = (viewWidth + kMinInteritemSpacing) / (itemWidth + kMinInteritemSpacing);//每行的图片个数
        NSInteger numOfLine = (images.count + oneLineCount - 1) / oneLineCount;//总行数
        CGFloat viewHeight = numOfLine * (itemWidth + kMinLineSpacing) - kMinLineSpacing;//总高度
        self.frame = CGRectMake(0, 0, viewWidth, viewHeight);
        self.collectionView.frame = CGRectMake(0, 0, viewWidth, viewHeight);
        
        if (viewHeight > 0) {
            height(viewHeight);
        }
    }
    return self;
}

#pragma mark - UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WLImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WLImageCollectionViewCell" forIndexPath:indexPath];
    __weak __typeof__(self) weakSelf = self;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:self.images[indexPath.row]]];
    
    cell.bigImageClickBlock = ^{
        NSMutableArray *datas = [NSMutableArray array];
        [weakSelf.images enumerateObjectsUsingBlock:^(NSString *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            YBIBImageData *data = [YBIBImageData new];
            data.imageURL = [NSURL URLWithString:obj];
            data.projectiveView = [self viewAtIndex:idx];
            [datas addObject:data];
            }];
        YBImageBrowser *browser = [YBImageBrowser new];
        browser.dataSourceArray = datas;
        browser.currentPage = indexPath.row;
        // 只有一个保存操作的时候，可以直接右上角显示保存按钮
        browser.defaultToolViewHandler.topView.operationType = YBIBTopViewOperationTypeSave;
        [browser show];
    };
    return cell;
}

- (id)viewAtIndex:(NSInteger)index {
    WLImageCollectionViewCell *cell = (WLImageCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:(index) inSection:0]];
    return cell ? cell.imageView : nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat h = self.CellimageWidth;
    return CGSizeMake(h, h);
}

@end
