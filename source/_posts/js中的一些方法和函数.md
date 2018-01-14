---
title: js中的一些方法和函数
date: 2017-10-22 09:45:11
tags: [js]
---

## 原生 JS 一些方法和函数

### 方法
#### subStr(start, length)
可以在字符串中抽取从 start下标开始的指定数目的字符
> length可以不要，代表整个截取的长度

#### slice(start, end)
可以在数组 start 开始截取指定长度的数组，如果为负数就从最后一个开始，subStr也是
> end 不包括end本身 

#### split(separator, howmany)
把字符串分割成字符串数组
> separator 可以是字符串，也可以是正则，howmany 表示截取的长度不超过该数量

#### splice(index, howmany, item1...,itemX)
从数组中添加/删除项目，然后返回被删除的项目
> index 表示删除的位置，howmany 表示删除几项，如果为0表示不删除，item代表插入的项目

#### replace('old', new)
把字符串中老的字符替换成新的字符

#### str1.concat(str2...strX)
在原来的字符串基础上连接多个字符串，也可以连接数组

#### str.match(Exp)
找到一个或多个和正则表达式的匹配

#### str.search(Exp)
找到第一次出现正则表达式或者字符串的地方，返回该位置的下标，如果没有就返回-1

#### toUpperCase() toLowerCase()
字符串大小写切换

#### trim（）
去除字符串两边的空白

#### arr.every(check)
判断数组中的所有项是否都符合条件

#### arr.fill('str')
用字符串固定替换数组的元素

#### oldArr.filter(function(currentValue, index, newArr), thisValue)
创建一个新的数组 newArr, 新数组是通过检测的所有oldArr元素的集合

#### arr.join(separator)
将数组转换成字符串，并用separator 分开，可以省略

#### reverse()
反转字符串或数组

### 函数

#### 判断客户端手机型号
```
var BrowserInfo = {
    userAgent: navigator.userAgent.toLowerCase()
    isAndroid: Boolean(navigator.userAgent.match(/android/ig)),
    isIphone: Boolean(navigator.userAgent.match(/iphone|ipod/ig)),
    isIpad: Boolean(navigator.userAgent.match(/ipad/ig)),
    isWeixin: Boolean(navigator.userAgent.match(/MicroMessenger/ig)),
}
```

#### 获取 url 的参数
```
function getExp(name, url) {
    var reg = new RegExp("(^|\\?|&)" + name + "=([^&]*)(\\s|&|$)", "i")
    if (reg.test(url)) return decodeURIComponent(RegExp.$2.replace(/\+/g, " ")) return ""
}
```

#### 全屏显示
```
function launchFullScreen(element) {
    if (element.requestFullScreen) {
        element.requestFullScreen();
    } else if (element.mozRequestFullScreen) {
        element.mozRequestFullScreen();
    } else if (element.webkitRequestFullScreen) {
        element.webkitRequestFullScreen();
    }
}
```

#### 全选/全不选
```
function selectAll(objSelect) {
    if(objSelect.checked == true) {
        $("input[name='chkId']").attr("checked", true)
        $("input[name='chkAll']").attr("checked", true)
    } else if (objSelect.checked == true) {
        $("input[name='chkId']").attr("checked", false)
        $("input[name='chkAll']").attr("checked", false)
    }
}
```

#### 判断浏览器
```
<!--判断是否是 IE 浏览器-->
    if (document.all){
        alert(”IE浏览器”);
    }else{
        alert(”非IE浏览器”);
    }
    if (!!window.ActiveXObject){
        alert(”IE浏览器”);
    }else{
        alert(”非IE浏览器”);
    }
<!--判断是IE几-->
var isIE=!!window.ActiveXObject;
var isIE6=isIE&&!window.XMLHttpRequest;
var isIE8=isIE&&!!document.documentMode;
var isIE7=isIE&&!isIE6&&!isIE8;
if (isIE){
    if (isIE6){
        alert(”ie6″);
    }else if (isIE8){
        alert(”ie8″);
    }else if (isIE7){
        alert(”ie7″);
    }
}
```

#### js 写 cookie
```
function setCookie(name, value, expires, path, domain) {
    if (!expires) expires = -1
    if (!path) path = "/"
    var d = "" + name + "=" + value
    var e
    if (expires < 0) {
        e = ""
    }
    else if (expires == 0) {
        var f = new Date(1970, 1, 1)
        e = ";expires=" + f.toUTCString()
    }
    else {
        var now = new Date()
        var f = new Date(now.getTime() + expires * 1000)
        e = ";expires=" + f.toUTCString()
    }
    var dm;
    if (!domain) {
        dm = ""
    }
    else {
        dm = ";domain=" + domain
    }
    document.cookie = name + "=" + value + ";path=" + path + e + dm
};
```

#### js 读 cookie
```
function readCookie(name) {
    var nameEQ = name + "="
    var ca = document.cookie.split(';')
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i]
        while (c.charAt(0) == ' ') c = c.substring(1, c.length)
        if (c.indexOf(nameEQ) == 0) {
            return decodeURIComponent(c.substring(nameEQ.length, c.length))
        }
    } return null
}
```

