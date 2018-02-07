//
//  QXWIntroController.h
//  ADPageView
//
//  Created by 王庆学 on 2018/2/6.
//  Copyright © 2018年 王庆学. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXWIntroDefine.h"

@protocol introControllerDataSourceDelegate <NSObject>


/**
 通过代理返回introController翻页的每一个View

 @param controller introController
 @param index view的index
 @return 对应的index要返回的View
 */
- (UIView *)introController:(UIViewController *)controller imageForItemWithIndex:(NSInteger)index;

/**
 通过代理获取总共有几个页面

 @return scrollView页面的总数
 */
- (NSInteger)getIntroControllerNumber;

@end

@interface QXWIntroController : UIViewController

//必须要遵守的代理方法
@property (nonatomic, assign)id<introControllerDataSourceDelegate>introDataSource;
//浏览完成最后一个页面隐藏本页面的回掉
@property (nonatomic, copy) void(^comfirmBlock)(void);
//取消操作的回调
@property (nonatomic, copy) void(^cancelBlock)(void);

@end
