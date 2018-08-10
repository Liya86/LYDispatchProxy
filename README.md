# LYDispatchProxy
消息分发器

* `iOS8.0`  `Objective_C`

* 引用
  pod 'LYDispatchProxy'
  
* 使用    

  伪多继承

  
  ```
    id dispathProx = ly_dispatchProxy([LYAnimal new], [LYPerson new], nil);
    [dispathProx talk];
    [dispathProx walk];
    [dispathProx pushers];
    [dispathProx shovel];
  ```
  
  协议多分发
  
  ```
    // ⚠️ self 持有 delegateProxy，delegateProxy 内部持有传入的消息接收对象，里面也有 self, 所以使用 ly_weakObject(self)，改为 weak 引用
    // ⚠️ 当有返回值时，后面的返回值会覆盖前面的
    self.delegateProxy = (LYDispatchProxy <UITableViewDataSource, UITableViewDelegate>*)ly_dispatchProxy([LYTableDelegate new], ly_weakObject(self), nil);
    
     ....
     
    talbe.delegate = self.delegateProxy;
    talbe.dataSource = self.delegateProxy;
  ```
  
* 由于页面多为 `UITableView` 且页面多复用，各种 `统计` 或者 `页面差异展示`，所以想如果可以多个代理均可按先后顺序执行，那就可以将一些 `统计` 或者 `页面差异展示` 跟其它进行分离，提升项目代码的可维护性。

* 设计模式中的代理模式 ，`NSProxy` 是一个抽象超类(除了`NSObject`之外的另一个基类)，实现根类要求的基础方法，并定义 `<NSObject>` 协议，可作为其他对象替身（甚至不存在的对象），`NSProxy` 负责把消息转发给真正的 `target` 的代理类，利用这个特性，`NSProxy`的子类可以实现透明的分布式消息传递。
