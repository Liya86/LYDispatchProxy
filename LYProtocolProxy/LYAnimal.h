//
//  LYAnimal.h
//  LYDispatchProxy
//
//  Created by Liya on 2018/7/14.
//  Copyright © 2018年 Liya. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol LYAnimal <NSObject>
- (void)talk;
- (void)walk;
- (void)pushers;
@end

@interface LYAnimal : NSObject <LYAnimal>

@end
