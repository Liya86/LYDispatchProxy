//
//  LYPerson.h
//  LYDispatchProxy
//
//  Created by Liya on 2018/7/14.
//  Copyright © 2018年 Liya. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LYPerson <NSObject>
- (void)shovel;
- (void)talk;
- (void)walk;
@end

@interface LYPerson : NSObject <LYPerson>

@end
