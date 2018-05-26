---
title: js常见的九种设计模式
date: 2018-03-09 10:31:48
tags: [pattern, 未完成]
categories: web前端
---
## 介绍

设计模式(DP)是一套被反复使用，多数人知晓的、经过分类编目的、代码设计经验的总结。

## 分类

* 单体模式
* 单例模式
* 工厂模式
* 观察者模式（发布订阅者模式）
* 策略模式
* 模块模式
* 模板模式
* 代理模式
* 外观模式

> 设计模式目前有23种，目前只列举出了在实战中比较常用的几种。

## 九种

### 单体模式

#### 概念

单体是一个用来划分命名空间并将一批相关的属性和方法组织在一起的对象，如果它可以被实例化，那么它只能被实例化一次。

#### 特点

1. 可以用来划分命名空间，从而清除全局变量所带来的危险。
2. 利用分支技术来封装浏览器之间的差异。
3. 可以把代码组织的更为一体。

#### 代码实现

```js
var Singleton = {
  attribute: true,
  method1: function () {},
  method2: function () {}
}
```

#### 应用场景

单体模式我们平时应用的比较多，相当于我们把代码封装在一起，只暴露一个入口，防止对全局的污染。

### 单例模式

#### 概念

单例模式定义了一个对象的创建过程，此对象只有一个单独的实例，并提供一个访问它的全局访问点。也可以说单例就是保证一个类只有一个实例，实现的方法一般是先判断实例存在与否，如果存在直接返回，如果不存在就创建了再返回，这就确保了一个类只有一个实例对象。

#### 代码实现

```js
var single = (function () {
  var unique

  function getInstance () {
    // 如果该实例存在，则直接返回，否则就对其实例化
    if (unique === undefined) {
      unique = new Construct()
    }
    return unique
  }
  function Construct () {
    //生成单例的构造函数的代码
  }

  return {
    getInstance
  }

})()

```

上面的代码中，unique 便是返回对象的引用，而 getinstance 便是静态方法获得实例。 Construct 便是创建实例的构造函数。
可以通过 single.getInstance() 来获取到单例，并且每次调用均获取到同一个单例。这是 单例模式 所实现的效果。

#### 应用场景

单例模式是一种常用的模式，有一些对象我们往往只需要一个，比如全局缓存、浏览器的 window 对象。

1. 可以用它来划分命名空间。
2. 借助单例模式，可以把代码组织的更为一致，方便阅读和维护。

### 工厂模式

#### 概念

提供创建对象的接口，根据参数产生相应的对象，就是把成员对象的创建工作交给一个外部对象，好处在于消除对象之间的耦合。

#### 分类

* 简单工厂模式：使用一个类，通常为单体，来生成实例。
* 复杂工厂模式：将其成员对象的实例化推到子类中，子类可以重写父类接口的方法以便创建的时候指定自己的对象类型。父类只对创建过程中的一般性问题进行处理，这些处理会被子类继承，子类之间是相互独立的，具体的业务逻辑会放在子类中进行编写。

#### 代码实现

简单工厂模式

```js
var XHRFactory = function () {}

XHRFactory.createXMLHttp = function () {
  var XMLHttp = null

  if (window.XMLHttpRequest) {
    XMLHttp = new XMLHttpRequest()
  } else if (window.ActiveObject) {
    XMLHttp = new ActiveXObject('Microsoft.XMLHTTP')
  }

  return XMLHttp
}

var Ajax = function () {
  var XMLHttp = XHRFactory.createXMLHttp()
}
```

复杂工厂模式：先设计一个抽象类，这个类不能被实例化，只能用来派生子类，最后通过对子类的拓展实现工厂方法。

```js
var XHRF = function () {}

XHRF.prototype = {
  createFactory: function () {
    throw new Error('this is an abstract class')
  }
}

var XHRH = function () {}

// 子类继承父类
extend(XHRH, XHRF)

// 把父类原型传递给子类，实现继承
XHRH.prototype = new XHRF()
// 重置子类原型的构造器为子类自身
XHRH.prototype.constructor = XHRH

// 重新定义createFactory 方法
XHRH.prototype.createFactory = function () {
  var XMLHttp = null

  if (window.XMLHrrpRequest) {
    XMLHttp = new XMLHttpRequest()
  } else if (window.ActiveXObject) {
    XMLHttp = new ActiveXObject('Microsoft.XMLHTTP')
  }

  return XMLHttp
}

```

#### 应用场景

1. 对象的构建十分复杂
2. 需要依赖具体环境创建不同实例
3. 处理大量具有相同属性的小对象

#### 优点

1. 弱化对象间的耦合，防止代码重复。
2. 重复性的代码可以放在父类中去编写，子类继承于父类的所有成员属性和方法，子类只专注于实现自己的业务逻辑。

#### 缺点

当工厂增加到一定程度的时候，提高了代码的复杂度，可读性下降。而且没有解决对象的识别问题，既怎么知道一个对象的类型。

未完待续。。。