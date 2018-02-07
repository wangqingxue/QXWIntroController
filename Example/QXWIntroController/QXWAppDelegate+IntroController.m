//
//  QXWAppDelegate+IntroController.m
//  QXWIntroController_Example
//
//  Created by 王庆学 on 2018/2/7.
//  Copyright © 2018年 173636717@qq.com. All rights reserved.
//

#import "QXWAppDelegate+IntroController.h"
#import "QXWViewController.h"

@implementation QXWAppDelegate (IntroController)

- (void)setIntroController{
    QXWIntroController *introController = [[QXWIntroController alloc]init];
//    introController.introDataSource = self;
    introController.imageNameArray = @[@"5",@"4",@"3",@"2",@"1"];
    self.window.rootViewController = introController;
    __weak typeof(self) weakSelf = self;
    introController.comfirmBlock = ^{
        __strong typeof(self) strongSelf = weakSelf;
        QXWViewController *viewController = [[QXWViewController alloc]init];
        strongSelf.window.rootViewController = viewController;
    };
}

- (UIView *)introController:(UIViewController *)controller imageForItemWithIndex:(NSInteger)index{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, qxwWidth, qxwHeight)];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, qxwWidth, qxwHeight)];
    NSString *imageName = [NSString stringWithFormat:@"%ld",index + 1];
    imageView.image = [UIImage imageNamed:imageName];
    [view addSubview:imageView];
    return view;
}

- (NSInteger)getIntroControllerNumber{
    return 5;
}

@end
