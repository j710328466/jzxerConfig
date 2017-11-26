---
title: vue-eleme
date: 2017-07-05 21:51:12
tags: [vue, web前端]
categories: web前端
---

### 准备工作
* vue-cli
* better-scroll
* node.js
* 电脑（废话）
* 在dev-server中配置本地 data.json API接口

### header组件

#### star组件
* 该项目中多处用到 星星 ，所以可以将它整合成一个组件，以复用
* 用 import 引入到父组件，给该组件传入 seller.score 评分数据
```
itemClasses () {
      let result = []
      let score = Math.floor(this.score * 2) / 2
      let hasDecimal = score % 1 !== 0
      let integer = Math.floor(score)
      for (let i = 0; i < integer; i++) {
        result.push(CLS_ON)
      }
      if (hasDecimal) {
        result.push(CLS_HELF)
      }
      while (result.length < STARLENG) {
        result.push(CLS_OFF)
      }
      return result
    }
```
> 分别获取它们的整数，小数，和无

#### sticky footer 布局
* 为了防止内容超过容器，图标遮挡内容的现象

* 实现原理就是设置一个容器，将该容器的最小大小设置为100%，容器外面再设一个容器，给他一个负的 margin 或者是 padding，将它固定在容器的最下方

>可以参考我这篇(文章)[http://jzxer.cn/sticky-footer.html]

### goods 组件

#### nextTrick () 方法
* 该函数的意思是，当一个 DOM 刚刚 create 的时候，因为 DOM 会在当前 tick里面的代码全部执行完再更新，所以不能做到在修改数据之后 DOM 更新之后再执行，要保证 DOM 更新之后再执行某一块代码，就必须放在下一次循环更新里面，，这样 DOM 更新后， 就会立即执行这块的代码
！()[https://pic4.zhimg.com/47b878cfdac72ea510733667f39f2f6f_b.png]

#### better-scroll 插件
  > 可以在 npm 包管理器中下载
* 使用方法就是直接给你需要滚动的列表上创建一个实例，该实例的调用要放在nextTrick（）中，因为触屏滚动每次都是需要更新 dom 的

#### refs 和 el 数据传递
* refs就是将子组件的数据传递给父组件，el就是 elment，指的是该实例的 dom 分支


### API 接口配置
新建一个 express.Router() 实例，给它们分配路由路径，记得加入一个 errno ，判断是否正确获取数据
>这个时候就发现 node 是多么的强大，前后端全包了~

### shopCart 组件
指的是底部购物车组件，这个部分比较麻烦的是数据绑定，因为我们需要绑定一个数据流，点击添加商品，判断商品是否大于起送价，否则返回空，按钮不可点击，购物车头部无红色小标签，是则按钮变为绿色，购物logo变成蓝色，出现红色计数标签。

### cartcontral 组件
实现的思路是，点击添加会改变shopcart里的数据，双向绑定，这里用到了 $emit 就是将子路由中的数据传递给父组件，和ref的原理很像，父组件再通过监听事件得到子组件的数据。