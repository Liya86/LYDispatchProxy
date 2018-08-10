//
//  LYTableDelegate.m
//  LYTableDelegate
//
//  Created by Liya on 2018/7/14.
//  Copyright © 2018年 Liya. All rights reserved.
//

#import "LYTableDelegate.h"
#import <UIKit/UIKit.h>
@interface LYTableDelegate() <UITableViewDelegate, UITableViewDataSource>

@end

@implementation LYTableDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"LYTableDelegate 这里也返回一个呗， 但是无作用 好吧空的");
    
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"LYTableDelegate 这里也返回一个呗， 但是无作用 0行吗");
    return 0;
}
@end
