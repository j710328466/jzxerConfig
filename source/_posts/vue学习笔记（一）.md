---
title: vue学习笔记（一）
date: 2017-06-18 22:47:47
tags: [vue生命周期]
categories: vue
---

## vue的实例对象与生命周期

### vue 的生命周期图
![](http://images.cnblogs.com/cnblogs_com/fly_dragon/276813/o_lifecycle-%E6%A0%87%E6%B3%A8%E7%89%88%E6%9C%AC.png)
* beforeCreate
> 在实例初始化之后，数据观测(data observer) 和 event/watcher 事件配置之前被调用。

* created
> 实例已经创建完成之后被调用。在这一步，实例已完成以下的配置：数据观测(data observer)，属性和方法的运算， watch/event 事件回调。然而，挂载阶段还没开始，$el 属性目前不可见。

* beforeMount
> 在挂载开始之前被调用：相关的 render 函数首次被调用。

* mounted
> el 被新创建的 vm.$el 替换，并挂载到实例上去之后调用该钩子。如果 root 实例挂载了一个文档内元素，当 mounted 被调用时 vm.$el 也在文档内。

* beforeUpdate
>  数据更新时调用，发生在虚拟 DOM 重新渲染和打补丁之前。 你可以在这个钩子中进一步地更改状态，这不会触发附加的重渲染过程。

* updated
>  由于数据更改导致的虚拟 DOM 重新渲染和打补丁，在这之后会调用该钩子。
当这个钩子被调用时，组件 DOM 已经更新，所以你现在可以执行依赖于 DOM 的操作。然而在大多数情况下，你应该避免在此期间更改状态，因为这可能会导致更新无限循环。
>  该钩子在服务器端渲染期间不被调用。

* beforeDestroy
>  实例销毁之前调用。在这一步，实例仍然完全可用。

* destroyed
>  Vue 实例销毁后调用。调用后，Vue 实例指示的所有东西都会解绑定，所有的事件监听器会被移除，所有的子实例也会被销毁。 该钩子在服务器端渲染期间不被调用。

## 实例对象

### data
* 类型是Object或者Function。
> var vm = new Vue({
  data: data
})

### computed
* 介绍
Vue的计算属性（computed)的属性会自动混入Vue的实例中。所有 getter 和 setter 的 this 上下文自动地绑定为 Vue 实例。这就很强大了，再计算属性中定义的函数里面可以直接使用指向了 vue 实例的 this

### methods
* 类型: { [key: string]: Function }
methods 将被混入到 Vue 实例中。可以直接通过 VM 实例访问这些方法，或者在指令表达式中使用。方法中的 this 自动绑定为 Vue 实例。

### watch
* 类型： { [key: string]: string | Function | Object }
一个对象，键是需要观察的表达式，值是对应回调函数。值也可以是方法名，或者包含选项的对象。Vue 实例将会在实例化时调用 $watch()，遍历 watch 对象的每一个属性。

## 总结
Vue的实例封装的还是挺有艺术性的，很符合开发者的思维规范，它的生命周期也非常清晰，使用起来也非常方便。MVVM双向绑定思想也是吊的可以



