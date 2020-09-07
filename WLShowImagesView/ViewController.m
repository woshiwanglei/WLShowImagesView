//
//  ViewController.m
//  WLShowImagesView
//
//  Created by lsfb on 2020/9/7.
//  Copyright © 2020 lsfb. All rights reserved.
//

#import "ViewController.h"
#import "WLImagesView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *imagesView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imagesViewHeight;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak __typeof__(self) weakSelf = self;
    NSArray *array = @[@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3104100194,3032259432&fm=26&gp=0.jpg",@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3104100194,3032259432&fm=26&gp=0.jpg",@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3104100194,3032259432&fm=26&gp=0.jpg",@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3104100194,3032259432&fm=26&gp=0.jpg",@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3104100194,3032259432&fm=26&gp=0.jpg",@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3104100194,3032259432&fm=26&gp=0.jpg",@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3104100194,3032259432&fm=26&gp=0.jpg",@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3104100194,3032259432&fm=26&gp=0.jpg",@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3104100194,3032259432&fm=26&gp=0.jpg",@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3104100194,3032259432&fm=26&gp=0.jpg",@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3104100194,3032259432&fm=26&gp=0.jpg",@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3104100194,3032259432&fm=26&gp=0.jpg"];
    WLImagesView *imagesView = [[WLImagesView alloc] initWithImages:array viewWidth:([UIScreen mainScreen].bounds.size.width - 32) itemWidth:100 successWithHeight:^(CGFloat height) {
        weakSelf.imagesViewHeight.constant = height;
    }];
    [_imagesView addSubview:imagesView];
}


@end
