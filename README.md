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

# 框架的UML描述
![image](https://github.com/tony1016/EzComponent/raw/master/res/ClassDiagram.png)

具体来解释一下类图上的一些概念

## 1.首先，框架分为页面和组件两种功能部件。页面是由组件组装构成的。
无论是多页签布局也好，瀑布式的从上到下的表单布局也好，都是由一个页面和堆砌之上的组件构成的。
![image](https://github.com/tony1016/EzComponent/raw/master/res/LayoutExample.png)

所以，应用或者系统在使用框架时，也必须遵循继承于BaseParentComponent的作为主页面，而组件继承于BaseChildComponent的逻辑。但是一般，作为大型应用的话，会提供一个公共抽象层，再让各页面继承于自己的公共抽象层，来实现一些统一的控制。当然，如果仅有一两个页面的话，抽象层也可以不做。

## 2.页面和组件究竟有什么不同？
这还得从大家熟悉的场景来总结，一般来说，组件作为整个页面的一部分，可以有自己的逻辑行为，但一般不会进行全局提交动作。但是，作为最上层的页面，一般都会有一个按钮作为整个页面的提交动作。该提交动作一般会去收集所有组件的数据，并组装成一个数据包结构，发往后台。换句话说，框架考虑了一个最常用的表单的场景————组件承载了数据，页面负责合并且提交这些数据到后台。

从类图上可以看到，作为组件基类的BaseChildComponent，有一套DataCollect，即数据收集方法，包括：
- beforeBizDataCollect():void 数据收集前的回掉方法。抽象层可以在这里扩展出数据校验逻辑。
- bizDataCollect():Object 数据收集方法，**注意返回了一个对象***作为最终收集到的数据。抽象层可以在这里扩展出统一的数据域收集方法，避免每个人都去做数据组装的动作。
- afterBizDataCollect(data:Object):void 数据收集到后的回掉方案。抽象层可以对收集到的数据进行加工，补充一些隐藏数据等。

另外，作为组件，还有一个用于区别自身的getBizId():String方法，用于在页面上众多的组件内来区别自身，默认是该组件的name属性，可以复写。在最终组装发送到后台的数据包时，该ID用来区别组件的数据快，具体可见后面的描述。

作为页面BaseParentComponent基类，有一个方法 startBizInitialize(data:Object):void，它开始了整个页面和组件的业务逻辑初始化过程。一般会在页面的CreateComplete中调用它。
作为页面和组件，都有submit()方法，但是其作用域不同。页面的submit要收集所有组件的数据，但是作为组件，只需要收集自己的数据。

## 3.如何布局或者设置，才能让页面感知到组件的存在
上面已经描述到，页面要发起全局数据初始化过程，还要从组件收集数据，那页面一定需要知道自己的所有组件的存在。如何配置或者布局，才能让页面感知到组件的存在呢？答案是不需要。EzComponent框架使用了Parsley框架的<parsley:Configure/>功能，因此，继承于BaseChildComponent的组件都会在合适时候通知页面：“我在这里”。

## 4.数据初始化过程
当页面调用startBizInitialize(data:Object):void方法后，整个框架开始了数据初始化过程。无论是页面也好，组件也好，初始化过程分为三个切面，且都可以拿到一致的初始化数据：
- beforeBizInitialize(bizInitailizeData:BizInitializeData):void 数据初始化前的回掉方法。抽象层可以在这里，对初始化数据进行加工
- bizInitialize(bizInitailizeData:BizInitializeData):void 数据进行初始化的切面。抽象层可以在这里统一进行域和数据的绑定过程。
- afterBizInitialize(bizInitailizeData:BizInitializeData):void 数据初始化后的切面。抽象层可以在这里进行一些域的调整，比如只读域处理等。

数据初始化过程不同于Flex组件初始化过程，因为这时可能有些组件自身都还处于未初始化阶段，因此EzComponent的初始化既照顾到同步数据初始化过程，又照顾到异步数据初始化过程。
- 所谓同步数据初始化过程，是指数据初始化之前，组件已经完成了自身的Flex初始化过程
- 所谓异步数据初始化过程，是指数据初始化之前，组件还未完成自身的Flex初始化过程。很简单的例子是，用户点击某个按钮，弹出一个对话框。此时早已经过了最早的数据初始化阶段。但是其三个初始化切面依然会被调用一次。框架不会漏掉这样的小兄弟^_^。

## 5.数据提交过程
无论是页面也好，组件也好，都有一个submit()方法，可以触发自身的提交切面，该切面包括：
- beforeBizDataSubmit(data:Object):void 提交前切面。抽象层可以在这里进行统一的数据校验
- bizDataSubmit(data:Object):void 数据提交切面。**抽象层必须复写该逻辑，来后台提交数据，否则会报异常**

注意，submit()方法仅触发所在对象的两个切面。即如果是在页面上调用submit()就，仅触发页面自身的两个切面，组件同理。
前面已经提到过，作为页面和组件，都有submit()方法，但是其作用域不同。页面的submit要收集所有组件的数据，但是作为组件，只需要收集自己的数据。主要是表现在最终的提交数据上：
如果是页面提交，则拿到的数据格式为
```json
{
    "component 1 bizID":{
        "property 1":"value 1",
        "property 2":"value 2",
        ...
    },
    "component 2 bizID":{
        "property 1":"value 1",
        "property 2":"value 2",
        ...
    },

    ...
}
```

如果是组件提交，仅能拿到自身的数据结构
```json
{
    "property 1":"value 1",
    "property 2":"value 2",
    ...
}
```

数据组装成什么样，完全是组件自身的bizDataCollect():Object吐出什么样的数据格式。

## 6.组件间广播消息
传统的Flex的事件机制，有一个很大的问题，就是只能冒泡似的从里向外进行事件通知，但是平行的控件之间，却没办法直接沟通。因此，EzComponent利用Parsley的message服务，构建了一套组件之间广播消息的机制：
- broadcastMessage(id:String,data:Object):void 广播消息，需要两个参数：一个消息ID，一个消息体
- handleBroadcastMessage(message:BroadcastMessage):void 接受处理消息。因为是广播，因此需要ID进行鉴别是否是自己想要的消息。

注意这两个方法在页面和组件上都有，因此，可以在任意功能部件之间通信

## 7.用契约，而不是直接访问对方的数据
通常，我们需要一个组件的数据时，都是提供一个接口直接访问它，但是这会让两个组件紧密耦合在一起。对于重构和控制都不是好事情。因此，我们设计了一套契约接口。由数据请求者设计契约，数据拥有着实现契约，最终登记在框架层面，随时查询和取用，这包括如下接口：
- registerContract(contract:IBizDataContract,type:Class):void 注册契约实现到框架。第一个参数是契约实例，第二个参数是契约的Type，一般就是你的契约接口类型
- getContractByType(type:Class):IBizDataContract 通过契约类型获取具体的实现实例。

## 8.其它

EzComponent，在写作之时，一直有个类似于PureMvc的想法，就是提供一套逻辑思路，而不是一个在Flex上的特殊实现，这样子，该套想法可以一直到JavaScr，Java等等语言。

另外，在写作该项目的Readme时，忽然听到 Simon & Garfunkel 的 The Sound Of Silence，(对，《毕业生》的那首著名的主题曲)，其中的歌词，忽然让人觉得，科技带给人们的疏远，让人唏嘘不已，正如这句
> People talking without speaking
People hearing without listening
People writing songs that voices never share
And no one dare disturb the sound of silence
"Fools" said I, "You do not know
Silence like a cancer grows”