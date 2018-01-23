---
title: vuex 使用技巧
date: 2017-06-15 18:36:30
tags: [vuex]
categories: vue
---

## Action
提供方法和API请求,类似于mutation
> mutation  修改 state 只能是同步的
* action 充满了各种异步 api
```
actions: {
	increment (context) {
    	context.commit('increment')
   }
}
另一种写法
increment({commit}) {
	commit('increment')
}
```

## 分发 Action
> store.dispatch('increment')
