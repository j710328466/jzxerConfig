---
title: cookie和session
date: 2018-04-26 17:30:38
tags: [cookie, session]
categories: 本地储存
---
# 介绍

## cookie

cookie 是 HTTP 协议的一部分，处理分为以下几步：

1. 服务器向客户端发送 cookie，一般为 name=value 形式。

2. 浏览器将 cookie 储存。

3. 每次请求浏览器都会将 cookie 发给服务器。

### cookie 的属性

```js
res.cookie('isVisit', 1, {
  // 储存的时间
  maxAge: 10 * 1000,
  // 为 true 时只在https中生效
  secure: true,
  // 影响路径
  path: 'localhost',
  // 是否支持 js 读取，可以预防 XSS
  httpOnly: true
})
```

> isVisit 是 key 值，1 是 value。

### cookie 的弊端

数据在客户端就可以被修改，数据很容易被伪造，而且数据太多会影响传输效率。

## session

针对 cookie 的缺点，session 解决了这些问题，session 保存在服务端，它的运作是通过 session_id 进行，这个值一般存在客户端的 cookie 中。

### session 属性

```js
app.use(sessionParser({
  name: 'author',
  // 储存位置: 默认 cookie
  // store: new redisStore(),
  // 编码字符串
  secret: 'recommand 128 bytes random string',
  cookie: {
    maxAge: 60 * 1000
  },
  //每次请求都重设一个cookie
  rolling: false,
  resave: true,
  // 是指无论有没有session cookie，每次请求都设置个session cookie ，默认给个标示为 connect.sid
  saveUninitialized: false
}))
```

### signedCookie

就是签名，专业点就是 “信息摘要算法“，例如我有一些数据想存在 cookie 中，如何保证不被篡改？

比如我们用 dotcom_user 字段设置了个值 jzxer， cookie值应该是：

```json
> { dotcom_user: 'jzxer' }
```

这样如果验证和更改，安全性都不是很高。

我们可以这样处理，设置一个 secrit_string 和 dotcom_user 做个算法(不同的账户签名不同)
> sha1(secrit_string + dotcom_user) === '4850a42e3bc0d39c978770392cbd8dc2923e3d1d'

然后把 cookie 变成这样：

```json
{
  dotcom_user: 'jzxer',
  dotcom_user.sig: '4850a42e3bc0d39c978770392cbd8dc2923e3d1d'
}
```

这样一来信息就无法伪造了，一旦更改了 cookie 中的值，就会和服务器的冲突，破解的成本也太高。
