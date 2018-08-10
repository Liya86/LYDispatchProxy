//
//  LYAnimalHouseProxy.h
//  LYDispatchProxy
//
//  Created by Liya on 2018/7/14.
//  Copyright © 2018年 Liya. All rights reserved.
//

#import "LYDispatchProxy.h"
#import "LYAnimal.h"
#import "LYPerson.h"
@interface LYAnimalHouseProxy : LYDispatchProxy <LYAnimal, LYPerson>
+ (LYAnimalHouseProxy *)animalHouseProxy;
@end
