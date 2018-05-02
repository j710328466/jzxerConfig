---
title: nodeJS性能处理（一）
date: 2018-04-25 09:56:24
tags: [性能, 安全]
categories: nodeJS
---
# 介绍

目前市面上有很多后台纯 node 的项目，但是用 node 做后端还是有一系列的问题，比如稳定性，安全性，抛开这两块还要优化性能，如何提高用户的访问速度，在网络不佳（2G）的情况下如何能正常访问项目，都是一系列需要考虑的问题。本章内容针对安全性给出相关技巧。

## 1. 不要用 Eval

eval 的作用是将用户输入的字符串转化为可执行的代码，类似欺骗的效果，这样的坏处是会受到 XSS 攻击。

## 2. 使用 strict 模式

严格模式下的变量声明会抛出一些隐藏的错误。

```js
'use strict'
var obj = {
  a: '1',
  a: '2'
}
// 抛出错误 syntax error
```

## 3. 使用 Eslint 测试代码规范

可以使我们早期捕获一些 bug，并及时修正。

## 4. 全面测试

测试很重要，不但单元要测试，还要全面测试，例如用 mocha 测试代码覆盖率。

## 5. Unix 下不要直接使用 sudo node app.js

这样如果产生错误，会让整个系统宕机，可以使用 nginx 反向代理。

## 6. 避免 shell command 注入

```-t
child_process.exec('ls', function (err, data) {
    console.log(data);
});
```

上面的 child_process.exec 调用的是 /bin/sh ,也就是执行了一个解释器。
> 为了避免这个问题，我们可以使用：child_process.execFile。

## 7. 临时文件

创建文件时，处理上传的文件要注意，这些文件可能会吃掉你的磁盘所有空间。
> 使用 Streams。

## 8. 加密 Web 应用

用 https 代替 http，请求的过程可以添加签名头。

## 9. Reflected Cross Site Scripting

也就是跨站脚本攻击，就是但用户发送一段数据，如果在未做任何处理的情况下直接插入 DOM，这可能会出现安全问题，例如：

```js
//用户输入的数据中带脚本，如果不做处理，会被执行。
Im human <script>alert('I‘m hacker')<script>
```

> 处理方式：1. 对插入的数据进行验证，除去 HTML。

## 10. 看好你的 cookie

默认情况下，cookie 可以通过 js 在同一个域中读取，这就有可能会被跨站点脚本攻击，而且可能被第三方库读取。为了处理这种情况，我们可以在 cookies 上使用 HTTPOnly，这个标签可以让 js 无法读取。

## 11. 内容安全策略（CSP）

附加的安全层，可以检测和缓解某类攻击，例如：XSS、数据注入。启用方法如下：

```-t
Content-Security-Policy: default-src 'self' *.mydomain.com
```

## 12. Cross-Site Request Forgery

跨站请求伪造是一种迫使终端用户在他目前已验证授权的Web应用程序中执行其它的actions。node 社区已实现，可以使用同步令牌模式处理。
