//
//  LYDispatchProxy.h
//  LYDispatchProxy
//
//  Created by Liya on 2018/7/14.
//  Copyright © 2018年 Liya. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LYDispatchProxy;

extern LYDispatchProxy *ly_dispatchProxy(id firstObj, ...);

@interface LYDispatchProxy : NSProxy

/**
 消息分发器

 @param targets 消息的目标对象
 ⚠️：targets.lastObject 返回值有效，其它的忽略
 ⚠️：循环引用的地方，在可能引起循环应用的地方，请使用 LYWeakObject 处理 : ly_weakObject(xxx)
 @return 消息分发器
 */
- (instancetype)initWith:(NSArray *)targets;
@end
