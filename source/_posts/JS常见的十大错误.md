---
title: JS常见的十大错误
date: 2018-02-07 09:26:47
tags: [js, error]
categories: web前端
---

## 1. Uncaught TypeError: Cannot read property

发生这种情况的原因很多，但常见的一种是在渲染 UI 组件时对于状态的初始化操作不当。

## 2. TypeError: ‘undefined’ is not an object

这是在 Safari 中读取属性或调用未定义对象上的方法时发生的错误。这与 1 中提到的 Chrome 的错误基本相同，但 Safari 使用了不同的错误消息提示语。

## 3. TypeError: null is not an object

这是在 Safari 中读取属性或调用空对象上的方法时发生的错误。
> 在 JavaScript 中，null 和 undefined 是不一样的，这就是为什么我们看到两个不同的错误信息。undefined 通常是一个尚未分配的变量，而 null 表示该值为空。 要验证它们不相等，请尝试使用严格的相等运算符 ===

## 4. (unknown): Script error

当未捕获的 JavaScript 错误（通过window.onerror处理程序引发的错误，而不是捕获在try-catch中）被浏览器的跨域策略限制时，会产生这类的脚本错误。这是一种浏览器安全措施，旨在防止跨域传递数据，否则将不允许进行通信。

## 5. TypeError: Object doesn’t support property

这是您在调用未定义的方法时发生在 IE 中的错误。 您可以在 IE 开发者控制台中进行测试。

## 6. TypeError: ‘undefined’ is not a function

当您调用未定义的函数时，这是 Chrome 中产生的错误。

## 7. Uncaught RangeError: Maximum call stack

这是 Chrome 在一些情况下会发生的错误。 一个是当你调用一个不终止的递归函数。

## 8. TypeError: Cannot read property ‘length’

这是 Chrome 中发生的错误，因为读取未定义变量的长度属性。

# 9. Uncaught TypeError: Cannot set property

当我们尝试访问一个未定义的变量时，它总是返回 undefined，我们不能获取或设置任何未定义的属性。 在这种情况下，应用程序将抛出 “Uncaught TypeError: Cannot set property”。

## 10. ReferenceError: event is not defined

当您尝试访问未定义的变量或超出当前范围的变量时，会引发此错误。