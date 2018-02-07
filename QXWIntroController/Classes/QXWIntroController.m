//
//  QXWIntroController.m
//  ADPageView
//
//  Created by 王庆学 on 2018/2/6.
//  Copyright © 2018年 王庆学. All rights reserved.
//

#import "QXWIntroController.h"
#import "UIView+QXWExtension.h"


@interface QXWIntroController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIPageControl *basePageControl;

@property (nonatomic, strong) UIScrollView *baseScrollView;

@property (nonatomic, assign) NSInteger imageCount;
//最后一个显示的页面
@property (nonatomic, strong) UIView *lastShowView;
//最后一个页面点击的按钮
@property (nonatomic, strong) UIButton *subMitBtn;

@end

@implementation QXWIntroController

- (instancetype)init{
    if (self = [super init]){
        _isShowSubmitBtn = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
}

- (void)initUI{
    [self.view addSubview:self.baseScrollView];
    [self.view addSubview:self.basePageControl];
    [self testDelegateException];
    [self setPageView];
    [self setLastView];
}

//简单的加载View
- (void)setPageView{
    self.imageCount = self.imageNameArray.count? :  [self.introDataSource getIntroControllerNumber];
    self.baseScrollView.contentSize = CGSizeMake(qxwWidth * self.imageCount + 1, 0);
    self.basePageControl.numberOfPages = self.imageCount;
    if ([self.imageNameArray count]){
        self.imageCount = self.imageNameArray.count;
        for (NSInteger i = 0; i < self.imageNameArray.count; i++){
            UIImageView *imageView = [[UIImageView alloc]init];
            imageView.userInteractionEnabled = YES;
            imageView.image = [UIImage imageNamed:self.imageNameArray[i]];
            imageView.frame = CGRectMake(qxwWidth * i, 0, qxwWidth, qxwHeight);
            [self.baseScrollView addSubview:imageView];
            if (i == self.imageCount - 1) self.lastShowView = imageView;
        }
        return;
    }
    for (NSInteger i = 0; i < self.imageCount; i++){
        UIView *baseView = [self.introDataSource introController:self imageForItemWithIndex:i];
        baseView.frame = CGRectMake(qxwWidth * i, 0, qxwWidth, qxwHeight);
        [self.baseScrollView addSubview:baseView];
        if (i == self.imageCount - 1) self.lastShowView = baseView;
    }
}

- (void)setLastView{
    if ([self.introDataSource respondsToSelector:@selector(getSubMitBtn)]){
        self.subMitBtn = [self.introDataSource getSubMitBtn];
    }else{
        self.subMitBtn = [[UIButton alloc]init];
        self.subMitBtn.qx_size = CGSizeMake(150, 40);
        CGPoint viewCenter = self.view.center;
        viewCenter.y = viewCenter.y + 200;
        self.subMitBtn.center = viewCenter;
        [self.subMitBtn setTitle:@"立即体验" forState:UIControlStateNormal];
        self.subMitBtn.backgroundColor = [UIColor colorWithRed:0.4 green:0.6 blue:0.2 alpha:0.5];
        self.subMitBtn.layer.cornerRadius = 10;
        self.subMitBtn.clipsToBounds = YES;
        [self.subMitBtn addTarget:self action:@selector(comfirmAction) forControlEvents:UIControlEventTouchUpInside];
        self.subMitBtn.hidden = !_isShowSubmitBtn;
        [self.lastShowView addSubview:self.subMitBtn];
    }
}

- (void)testDelegateException{
    if (![self.introDataSource respondsToSelector:@selector(getIntroControllerNumber)] && !self.imageNameArray.count){
        NSException *excp = [NSException exceptionWithName:@"NSInvalidArgumentException" reason:@"没有实现getImageWithCount方法" userInfo:nil];
        [excp raise];
    }
    if (![self.introDataSource respondsToSelector:@selector(introController:imageForItemWithIndex:)] && !self.imageNameArray.count){
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
