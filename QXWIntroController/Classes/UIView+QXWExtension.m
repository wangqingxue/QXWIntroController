//
//  UIView+QXWExtension.m
//  Expecta
//
//  Created by 王庆学 on 2018/2/7.
//

#import "UIView+QXWExtension.h"

@implementation UIView (QXWExtension)

- (void)setQx_x:(CGFloat)qx_x{
    CGRect frame = self.frame;
    frame.origin.x = qx_x;
    self.frame = frame;
}

- (CGFloat)qx_x{
    return self.frame.origin.x;
}

- (void)setQx_y:(CGFloat)qx_y{
    CGRect frame = self.frame;
    frame.origin.y = qx_y;
    self.frame = frame;
}

- (CGFloat)qx_y{
    return self.frame.origin.y;
}

- (void)setQx_w:(CGFloat)qx_w{
    CGRect frame = self.frame;
    frame.size.width = qx_w;
    self.frame = frame;
}

- (CGFloat)qx_w{
    return self.frame.size.width;
}

- (void)setQx_h:(CGFloat)qx_h{
    CGRect frame = self.frame;
    frame.size.height = qx_h;
    self.frame = frame;
}

- (CGFloat)qx_h{
    return self.frame.size.height;
}

- (void)setQx_origin:(CGPoint)qx_origin{
    CGRect frame = self.frame;
    frame.origin = qx_origin;
    self.frame = frame;
}

- (CGPoint)qx_origin{
    return self.frame.origin;
}

- (void)setQx_size:(CGSize)qx_size{
    CGRect frame = self.frame;
    frame.size = qx_size;
    self.frame = frame;
}

- (CGSize)qx_size{
    return self.frame.size;
}

@end
