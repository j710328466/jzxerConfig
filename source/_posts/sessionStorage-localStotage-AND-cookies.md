---
title: sessionStorage localStotage AND cookies
date: 2017-08-16 11:57:16
tags: [sessionStorage, localStotage, cookies]
categories: storage
---

### sessionStorage

> 引入一个浏览器窗口的概念，开启在同源的同窗口，即使跳到其他页面，数据仍然存在，页面刷新也不会消除数据，

#### 特点

* 减少网络流量：一旦数据保存在本地后，就可以避免再向服务器请求数据，因此减少不必要的数据请求，减少数据在浏览器和服务器间不必要地来回传递
* 快速显示数据：性能好，从本地读数据比通过网络从服务器获得数据快得多，本地数据可以即时获得。再加上网页本身也可以有缓存，因此整个页面和数据都在本地的话，可以立即显示
* 临时储存：很多时候数据只需要在用户浏览一组页面期间使用，关闭窗口后数据就可以丢弃了，这种情况使用sessionStorage非常方便

### cookie

> 数据始终在同源的http请求中携带（即使不需要），即cookie在浏览器和服务器间来回传递，数据还有路径（path）的概念，可以限制cookie只属于某个路径下。

#### 特点

* cookie数据不能超过4k，同时因为每次http请求都会携带cookie，所以cookie只适合保存很小的数据，如会话标识
* 只在设置的cookie过期时间之前一直有效，即使窗口或浏览器关闭,即有一个过期值
* cookie也是在所有同源窗口中都是共享的。

### localStorage

#### 特点

* 生命周期是永久性的。假若使用localStorage存储数据，即使关闭浏览器，也不会让数据消失，除非主动的去删除数据，使用的方法如上所示。localStorage有length属性，可以查看其有多少条记录的数据。

使用方法:

```js
var storage = null;
    if(window.localStorage){              //判断浏览器是否支持localStorage
       storage = window.localStorage;
       storage.setItem("name", "Rick");    //调用setItem方法，存储数据
       alert(storage.getItem("name"));     //调用getItem方法，弹框显示 name 为 Rick
       storage.removeItem("name");     //调用removeItem方法，移除数据
       alert(storage.getItem("name"));   //调用getItem方法，弹框显示 name 为 null
    }
```