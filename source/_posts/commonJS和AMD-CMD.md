---
title: commonJS和AMD/CMD
date: 2017-08-23 16:49:51
tags: [web前端, js]
---

## 一. CommonJS
 node.js的模块系统，就是参照CommonJS规范实现的。在CommonJS中，有一个全局性方法require()，用于加载模块。假定有一个数学模块math.js，就可以像下面这样加载。NodeJS是CommonJS规范的实现，webpack 也是以CommonJS的形式来书写。
> var math = require('math')

#### 1. 原理
浏览器兼不兼容commonJS，在于是否缺少这几个环境变量
* module
* export
* require
* global

#### 2. browsertify
将 npm包 编译成可以被 html 页面引入的 js模块
> 一个类似的库：browser-unpack
