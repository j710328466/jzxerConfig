---
title: sticky-footer
date: 2017-07-02 20:30:52
tags: [web前端]
---

今天，我想讲讲关于stick-footer布局技巧，它的内容大概就是当你页面大小为100%时，希望底部定位一个 X 按钮啥的，不管文本内容不够，或者是文本内容超过屏幕时，这个按钮位置总在文本的下方
* like this
![](http://img0.tuicool.com/fuANjiq.png!web)

### 实现思路
  * 首先是个包裹了 footer 之外其他元素的容器，将它的最小大小设置为100%
  <br>
  * 然后给这个footer一个负的 magin-top 因为如果该容器最小大小为100%，会将footer元素挤出容器外，你这个时候就要想办法把该元素‘重回战场’
  <br>
  * sticky-footer 就是这个意思，让他完美保持在底部，而又不会影响主要内容的显示

### 四种实现方法
#### 容器使用负的 margin bottom
```
<body>
  <div class="wrapper">

      content

    <div class="push"></div>
  </div>
  <footer class="footer"></footer>
</body>

html, body {
  height: 100%;
  margin: 0;
}
.wrapper {
  min-height: 100%;

  /* Equal to height of footer */
  /* But also accounting for potential margin-bottom of last child */
  margin-bottom: -50px;
}
.footer,
.push {
  height: 50px;
}
```
#### 底部使用负的 margin top
```
<body>
  <div class="content">
    <div class="content-inside">
      content
    </div>
  </div>
  <footer class="footer"></footer>
</body>

html, body {
  height: 100%;
  margin: 0;
}
.content {
  min-height: 100%;
}
.content-inside {
  padding: 20px;
  padding-bottom: 50px;
}
.footer {
  height: 50px;
  margin-top: -50px;
}
```

#### calc 版本
```
<body>
  <div class="content">
    content
  </div>
  <footer class="footer"></footer>
</body>

.content {
  min-height: calc(100vh - 70px);
}
.footer {
  height: 50px;
}
```
> calc中的 70px，和50px是假定了content中最后一个元素有个20px的margin bottom，你不必在意这些~

#### flexbox 版本
```
<body>
  <div class="content">
    content
  </div>
  <footer class="footer"></footer>
</body>

html {
  height: 100%;
}
body {
  min-height: 100%;
  display: flex;
  flex-direction: column;
}
.content {
  flex: 1;
}
```
> flexbox版本同样很简单，并且相比前面三种方式，它不需要知道footer的高度，避免了Magic Number的尴尬。

#### grid 版本
```
<body>
  <div class="content">
    content
  </div>
  <footer class="footer"></footer>
</body>
html {
  height: 100%;
}
body {
  min-height: 100%;
  display: grid;
  grid-template-rows: 1fr auto;
}
.footer {
  grid-row-start: 2;
  grid-row-end: 3;
}
```
> Chrome Canary 或者 Firefox Developer Edition才能看到效果。