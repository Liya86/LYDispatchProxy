//
//  ViewController.m
//  LYProtocolProxy
//
//  Created by Liya on 2018/8/10.
//  Copyright © 2018年 Liya. All rights reserved.
//

#import "ViewController.h"
#import "LYAnimalHouseProxy.h"
#import "LYTableDelegate.h"
#import "LYWeakObject.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) LYDispatchProxy <UITableViewDataSource, UITableViewDelegate>*delegateProxy;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //伪装多继承
    LYAnimalHouseProxy *aniHouseProxy = [LYAnimalHouseProxy animalHouseProxy];
    [aniHouseProxy talk];
    [aniHouseProxy walk];
    [aniHouseProxy pushers];
    [aniHouseProxy shovel];
    
    LYDispatchProxy <LYAnimal, LYPerson> *dispathProx = (LYDispatchProxy <LYAnimal, LYPerson> *)ly_dispatchProxy([LYAnimal new], [LYPerson new], nil);
    [dispathProx talk];
    [dispathProx walk];
    [dispathProx pushers];
    [dispathProx shovel];
    
    
    //协议多分发 -- 
    self.delegateProxy = (LYDispatchProxy <UITableViewDataSource, UITableViewDelegate>*)ly_dispatchProxy([LYTableDelegate new], ly_weakObject(self), nil);
    
    UITableView *talbe = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:talbe];
    [talbe registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    talbe.delegate = self.delegateProxy;
    talbe.dataSource = self.delegateProxy;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"ViewController 这里也返回一个 20 行");
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = [NSString stringWithFormat:@"开心得很 😄 section = %ld row = %ld", (long)indexPath.section, (long)indexPath.row];
    cell.backgroundColor = (indexPath.row % 2) ? [UIColor yellowColor] : [UIColor redColor];
    NSLog(@"ViewController 这里也返回一个cell");
    return cell;
}

//UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0;
}
@end
