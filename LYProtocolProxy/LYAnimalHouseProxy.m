//
//  LYAnimalHouseProxy.m
//  LYDispatchProxy
//
//  Created by Liya on 2018/7/14.
//  Copyright © 2018年 Liya. All rights reserved.
//

#import "LYAnimalHouseProxy.h"

@implementation LYAnimalHouseProxy
+ (LYAnimalHouseProxy *)animalHouseProxy {
    LYAnimalHouseProxy *proxy = [[LYAnimalHouseProxy alloc] initWith:@[[LYAnimal new], [LYPerson new]]];
    return proxy;
}
@end
