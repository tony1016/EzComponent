# EzComponent
This is a business logic framework for flex.Ver 3.0.0

# 为什么要再开发一个Flex框架？
Flex的开发者都知道，Flex已经有几个成熟的框架了，比如PureMVC，Parsley等等，那我为什么还要重复发明轮子呢?原因是Flex的这几个框架只关心类似于MVC这样的概念。MVC这样的概念性框架，仅仅适合于架构师去为项目量身定制，对于开发者来说，尤其是架构师下面的工程师来说，他们更愿意让架构师告诉他，我的代码该写到哪里？框架是否对我的开发效率有帮助。

因此，*该框架更加关心页面数据流的问题*。对于一个通常所谓的表单，开发人员应该关心包括以下几个切面
- 表单初始化数据组装
- 表单数据铺设
- 表单数据提交前验证
- 表单数据收集
- 表单数据提交
- 表单数据提交后操作

# 类图和序列图
![image](https://github.com/tony1016/EzComponent/raw/master/res/ClassDiagram.png)