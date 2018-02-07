//
//  QXWViewController.m
//  QXWIntroController
//
//  Created by 173636717@qq.com on 02/07/2018.
//  Copyright (c) 2018 173636717@qq.com. All rights reserved.
//

#import "QXWViewController.h"

@interface QXWViewController ()

@end

@implementation QXWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *labelTitle = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 300, 100)];
    labelTitle.text = @"我是导航栏控制器";
    [self.view addSubview:labelTitle];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
