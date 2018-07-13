---
title: nodeJS性能处理（二）
date: 2018-05-30 10:53:33
tags: [性能优化]
categories: nodeJS
---
# nodeJs 性能处理

## 引言

一个网站的体验，决定了用户是否愿意去了解网站的功能，而网站的功能，决定了用户是去还是留。特别是网站的性能，如果一个网页的时间打开超过 5s ，绝大部分用户会选择关闭它。

性能极致一直是作为 fea 的最高追求，所以在性能上我们更应关注以下指标：

* 白屏时间
* 首屏时间
* 整页时间
* DNS 时间
* CPU 占用率

本文将从以下三大模块展开介绍如何优化网站性能:

1. 网络传输性能优化
2. 页面渲染性能
3. JS阻塞性能

## 1. 网络传输性能优化

首先我们需要了解页面输入 url 后，经历了哪几个阶段，如下：重定向 → 拉取缓存 → DNS 查询 → 建立TCP链接 → 发起请求 → 接收响应 → 处理html元素 → 元素加载完成。

### 1.1 浏览器缓存

浏览器向服务器请求时，首先会查询本地是否有缓存文件。我们可以在服务器上设置 Etag 字段来控制缓存存放的位置，存在时便将数据存入硬盘。
> 缓存有两种情况，分别为： from memory cache 和 from disk cache.

以 nginx 为例，来配置nginx：

```js
//首先，我们先进入nginx的配置文档
$ vim nginxPath/conf/nginx.conf

//在配置文档内插入如下两项：
etag on;   //开启etag验证
expires 7d;    //设置缓存过期时间为7天
```

然后打开我们的网站，如果响应头部看见该字段则配置成功。
> 注意是否为强缓存（本地缓存），该操作不会和服务端产生联系，所以需要给文件添加 hash 值。

### 1.2 资源打包压缩

缓存只是针对第二次访问页面，而首次打开页面的体验优化则需要对资源进行处理，可以分为以下几个方面：

* 减少请求数
* 减少请求资源体积
* 提示网络传输速率

在 webpack 配置时，注意以下几点：

#### ① JS 压缩

```js
new webpack.optimize.UglifyJsPlugin()
```

#### ② HTML 压缩

```js
new HtmlWebpackPlugin({
  template: __dirname + '/views/index.html', // new 一个这个插件的实例，并传入相关的参数
  filename: '../index.html',
  minify: {
    removeComments: true,
    collapseWhitespace: true,
    removeRedundantAttributes: true,
    useShortDoctype: true,
    removeEmptyAttributes: true,
    removeStyleLinkTypeAttributes: true,
    keepClosingSlash: true,
    minifyJS: true,
    minifyCSS: true,
    minifyURLs: true,
  },
  chunksSortMode: 'dependency'
})
```

#### ③ 提取公共资源

```js
new webpack.optimize.CommonsChunkPlugin({
            name: 'vendor',
            filename: 'scripts/common/vendor-[hash:5].js'
        })
```

> webpack3, 可能不适用 webpack4

#### ④ 提取 CSS 并压缩

这里我只截取部分片段

```js
rules: [
  {
    test: /\.css$/,
    use: ExtractTextPlugin.extract({
      fallback: 'style-loader',
      use: {
        loader: 'css-loader',
        options: {
          minimize: true
        }
      }
    })
  }
]
```

#### ⑤ 服务器端开启 GZIP 压缩

```js
gzip on;
gzip_types text/plain application/javascript application/x-javascripttext/css application/xml text/javascript application/x-httpd-php application/vnd.ms-fontobject font/ttf font/opentype font/x-woff image/svg+xml;
```

> 不要对图片进行压缩，个人理解为图片内存一般都比较大，服务器处理起来需要消耗 CPU 占内存，压缩后的图片还有可能失真，这样只会适得其反。

### 1.3 图片资源优化

图片是真正占了传输资源的东西，如果能对这类资源处理极致，效果是显著的。

#### ① 不要在 html 里面缩放图像

比如在一个 200 \* 200 的容器里面放入一个 400 \* 400 的图片，事实上并不会增加它的清晰度，相反它会让网页加载的速度下降，造成带宽的浪费，所以按照自己的需求选择图片，然后放在服务器最佳。
> 2M 和 200k 的图片传输是 12s 和 200ms 的差距。

#### ② 使用雪碧图

就是将许多小的图片放在一张图里，从而来减少请求数。

#### ③ 使用字体图标

不管是压缩的图片，还是雪碧图，终归还是图片，都会占用比较大的资源，使用字体图标，可以更进一步优化这个局面。如果项目中有很多小图标，可以考虑使用字体图标。

#### ④ WebP 格式

谷歌开发的一种加快图片加载的格式，压缩体积大约只有 JPEG的 2/3。

### 1.4 网络传输性能检测工具--Page Speed

谷歌网页测速工具

### 1.5 使用 CDN

一个项目从服务器到客户端，中间可能经过一大堆路由来转发，这就相当于直线能到家的路程，然而走了很多弯路，到达目的地的时间肯定是不一样的。CDN 就是用来处理这个问题。

cdn 一般不和网站主域名相同，为什么？往下看。

#### ① 便于CDN 业务独立，能够独立配置缓存。

为了减低 web 的压力，cnd 会遵循前面的 cache 和 expires 头标准来对返回的内容进行缓存，起到加速的功能。一般大型网站都会设置 expires 比较大，这样可以减少请求回源。

#### ② 抛开无用的 cookie，减少带宽占用。

cookie 可以通过服务器设置，如果资源同源的情况下，主域名的资源都是带 cookie 的，相对的子域名也会带 cookie。然而一般图片，css，js这一类资源请求是不需要带 cookie 的，带了也没卵用，这时候就是在浪费带宽。

处理了 CND 的问题，随之而来的是 DNS 对域名的解析产生的问题，这会花费额外的时间，增加网络延迟。这个时候 DNS Prefetch 闪亮登场。使用方法如下：

```css
/* 放在 html 头部即可预解析 */
<link ref="dns-prefetch" href="//blog.jzxer.cn">
```

## 2. 页面渲染性能优化

### 2.1 浏览器渲染过程

渲染方面尽量减少重排和重绘，因为它们会影响浏览器的性能。

浏览器的渲染过程：User → 浏览器引擎 → 渲染引擎
> 渲染引擎再ajax、js、css 进行解析。其中 js 解释器独立出来变成了 V8.

### 2.2 DOM 渲染层与 GPU 硬件加速

页面是由许多层级构建而成，3D 图就像一本书一样。它经历了以下的流程：

1. 浏览器获取 DOM 将其分割为多个独立渲染层。
2. CPU 将每个层绘制进绘图中。
3. 将位图作为纹理上传至 GPU（显卡）绘制。
4. GPU 将所有渲染层缓存（如果下次上传的渲染层没有变化，GPU就不用重绘制），并复合成最终形成的我们的图像。
> 布局由 CPU 处理，绘制由 GPU 处理。

此处用到 chorme tools 两个工具：Layers 和 Rendering。

#### Layers

列出页面存在的所有渲染层。

#### Rendering

1. paint flashing：对页面发生重绘的元素高亮。
2. Layer Borders：高亮边界突出页面中的各个渲染层。
3. FPS Meter：开启小黑窗，观察 GPU 占用率。

```css
/* 触发渲染层 */
transform: translateZ(0);
backface-visibility: hidden;
```

把容易触发排版重绘的元素单独触发渲染层，让他与“静态”元素隔离，让 GPU 分担更多，就是所谓的硬件加速。

### 2.3 重排和重绘

#### ① 重排

渲染层内部元素布局发生修改，都会导致重新排列，窗口的尺寸发生变化，删除或添加 DOM，影响了盒子大小的 css 属性。

#### ② 重绘

既渲染上色，对元素的视觉表现属性，就会引发重绘。

### 2.4 优化策略

1. css 属性读写分离：浏览器每次对样式进行操作时，都要进行一次重新渲染（重排 + 重绘），所以我们用 js 对样式进行读写操作时，最好将两者分开，先读后写。

2. 通过切换 class 或者用元素的 style.css(text) 属性去批量操作元素样式。

3. DOM 元素离线更新：

4. 将没用的元素设置为 visibility: hidden，可以减小重绘压力。

5. 压缩 DOM 深度，一个渲染层不要有过深的子元素，少用 DOM 完成页面样式，多使用伪元素或者 box-shadow。

6. 图片在渲染前指定大小：因为 img 是内联元素，加载后会改变宽高，最好在渲染前就指定大小，或者让它脱离文档流。

## 3. JS阻塞性能

如果使用了闭包而未将相关资源释放，或者引用了外部链接而将其制空，都会造成内存泄漏，进而大量占用 GPU，造成卡顿和死机。可以使用 chrome 的 JavaScript Profile 版块。
> 服务端使用闭包需谨慎。
