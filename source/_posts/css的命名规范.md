---
title: css的命名规范
date: 2017-07-17 10:51:20
tags: [css, web前端]
categories: web前端
---

### 关于 css 的一些命名规范
* css设计模式：SMACSS
* BEM 命名规范
* javascript Hook

### SMACSS
首先，它定义了五种样式：
* base（基本）
* layout（布局）
* module（模块）
* state（状态）
* theme（皮肤）

#### base（基本）
* 在该样式中不适用class，id等选择，只对标签元素本身做设定，可以有属性选择器和伪类：
```
html{}
input[type=text] {}
a:hover {}
```

#### layout(布局)
* 整个网站的【大架构】的外观，类似header，footer
```
#header {}
.sidebar {}
```
> 通常只有一个选择器，一个id，或一个class

#### module（组件）
* 可复用组件，不需要任何prefix，

#### partial
比 layout 范围小，可以是特定单一领域下特别的设定，通常会将名称加在子 class 作为 prefix 
```
.nav--main_item {}
```

#### state
* 定义状态，例如：.active, .on 
```
<ul>
    <li> </li>
    <li class="active"> </li>
<ul>
```
> .is-active 比.active 来的好读

#### skin（皮肤）
* 画面上所有主视觉的定义，例如：border-color，background-image，font-family等，负责大架构上的视觉样式。

### BEM 命名规范
* BEM 即 block，element，modifier 缩写
* 将 block 区块作为起始开头，element为 block下的元素，modifier为该元素的属性。
* block 和 element 用 __ 双下划线区分， 不同的modifier 则用 两个--区分，一个-表示这个 class 不依赖任何 block 或者 element ，是个独立的存在：.page-container
示范：
```
.sidebar {
    .sidebar--left__section {
        .sidebar--left__section--header {}
    }
}
```

### javascript hook
* 我理解的是，在 css 选择器的前缀加个动作或者 “js”，来表示该标签被 js 调用过
> html 里 class 之间用两个空格比一个空格好阅读