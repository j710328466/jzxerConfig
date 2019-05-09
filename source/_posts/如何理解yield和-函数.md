---
title: 如何理解yield和*函数
date: 2018-01-30 16:10:15
tags: [generator, yield]
categories: JS
---

## Koa1

### 什么是 Generator

```js
function *test() {

}

test()    //  -> [Object Generator]
```

> generator 函数可以只运行函数的一部分，以及控制何时运行剩余的部分。

```js
function *learn() {
  yield 1
  yield 2
  return 3
}
let learnGen = learn()

learnGen.next()  //  -> {"done": false, "value": 1}
```

> 再次调用会运行到下一个 yield 处

```js
learnGen.next()  //  -> {"done": false, "value": 2}
learnGen.next()  //  -> {"done": true, "value": 3}
```

### 小结

可以通过 `yield` 和 `*` 的结合实现类似 `await` `async` 的效果的效果
