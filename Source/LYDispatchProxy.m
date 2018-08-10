//
//  LYDispatchProxy.m
//  LYDispatchProxy
//
//  Created by Liya on 2018/7/14.
//  Copyright © 2018年 Liya. All rights reserved.
//

#import "LYDispatchProxy.h"

LYDispatchProxy *ly_dispatchProxy(id firstObj, ...) {
    NSMutableArray *targets = [NSMutableArray array];
    id obj;
    va_list arg_list;
    va_start(arg_list, firstObj);
    if (firstObj) {
        [targets addObject:firstObj];
        while ((obj = va_arg(arg_list, id))) {
            [targets addObject:obj];
        }
    }
    
    va_end(arg_list);
    if (targets.count == 0) {
        return nil;
    }
    return [[LYDispatchProxy alloc] initWith:targets];
}

@interface LYDispatchProxy()
@property (nonatomic, strong) NSArray *targets;
@end

@implementation LYDispatchProxy

- (instancetype)initWith:(NSArray *)targets {
    self.targets = targets;
    return self;
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    for (id obj in self.targets) {
        if ([obj respondsToSelector:aSelector]) {
            return YES;
        }
    }
    return NO;
}

/**
 Normal forwarding 的第一步，也是消息转发的最后一次机会
 消息获得函数的参数和返回值类型，即返回一个函数签名

 @param sel selector 方法选择子
 @return NSMethodSignature 函数签名
         返回nil，Runtime 则会发出 -doesNotRecognizeSelector: 消息，程序 crash
         返回了NSMethodSignature，Runtime 就会创建一个 NSInvocation 对象并发送 -forwardInvocation: 消息给目标对象
 */
- (nullable NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    for (id obj in self.targets) {
        if ([obj respondsToSelector:sel]) {
            return [obj methodSignatureForSelector:sel];
        }
    }
    return [super methodSignatureForSelector:sel];
}


/**
可以在 -forwardInvocation: 里修改传进来的 NSInvocation 对象，然后发送 -invokeWithTarget: 消息给它，传进去一新的目标执行

 @param invocation 对一个消息的描述，包括 selector 以及参数等信息
 */
- (void)forwardInvocation:(NSInvocation *)invocation {
    BOOL invoked = NO;
    for (id obj in self.targets) {
        if ([obj respondsToSelector:invocation.selector]) {
            [invocation invokeWithTarget:obj];
            invoked = YES;
        }
    }
    if (!invoked) {
        [super forwardInvocation:invocation];
    }
}

@end
