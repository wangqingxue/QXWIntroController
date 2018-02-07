//
//  QXWIntroController.m
//  ADPageView
//
//  Created by 王庆学 on 2018/2/6.
//  Copyright © 2018年 王庆学. All rights reserved.
//

#import "QXWIntroController.h"


@interface QXWIntroController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIPageControl *basePageControl;

@property (nonatomic, strong) UIScrollView *baseScrollView;

@property (nonatomic, assign) NSInteger imageCount;

@end

@implementation QXWIntroController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
}

- (void)initUI{
    [self.view addSubview:self.baseScrollView];
    [self.view addSubview:self.basePageControl];
    [self testDelegateException];
    [self setViewNumber];
}

- (void)setViewNumber{
    self.imageCount = [self.introDataSource getIntroControllerNumber];
    self.baseScrollView.contentSize = CGSizeMake(qxwWidth * self.imageCount + 1, 0);
    self.basePageControl.numberOfPages = self.imageCount;
    for (NSInteger i = 0; i < self.imageCount; i++){
        UIView *baseView = [self.introDataSource introController:self imageForItemWithIndex:i];
        baseView.frame = CGRectMake(qxwWidth * i, 0, qxwWidth, qxwHeight);
        [self.baseScrollView addSubview:baseView];
    }
}

- (void)testDelegateException{
    if (![self.introDataSource respondsToSelector:@selector(getIntroControllerNumber)]){
        NSException *excp = [NSException exceptionWithName:@"NSInvalidArgumentException" reason:@"没有实现getImageWithCount方法" userInfo:nil];
        [excp raise];
    }
    if (![self.introDataSource respondsToSelector:@selector(introController:imageForItemWithIndex:)]){
        NSException *excp = [NSException exceptionWithName:@"NSInvalidArgumentException" reason:@"没有实现getImageWithData方法" userInfo:nil];
        [excp raise];
    }
}

- (UIScrollView *)baseScrollView{
    if (!_baseScrollView){
        _baseScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, qxwWidth, qxwHeight)];
        _baseScrollView.pagingEnabled = YES;
        _baseScrollView.delegate = self;
        _baseScrollView.bounces = NO;
    }
    return _baseScrollView;
}

- (UIPageControl *)basePageControl{
    if (!_basePageControl){
        _basePageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, qxwHeight - 50, qxwWidth, 50)];
    }
    return _basePageControl;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x > qxwWidth  * (self.imageCount - 1)){
        [self comfirmAction];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger selectPageControl = scrollView.contentOffset.x / qxwWidth;
    self.basePageControl.currentPage = selectPageControl;
}

- (void)comfirmAction{
    if (self.comfirmBlock) self.comfirmBlock();
}

- (void)dealloc{
    NSLog(@"QXWIntroController已经被销毁了");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
