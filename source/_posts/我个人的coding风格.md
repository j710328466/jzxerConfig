---
title: 我个人的coding风格
date: 2017-11-26 13:46:13
tags: [CStyle]
categories: web前端
---

我一直在探索属于我自己独一无二的代码风格

## 识别度高的 HTML

## 简洁大方的 CSS

## 可维护性强的 js

> 最近在看这本书，书中有很多技巧让我受益颇多

### 基本格式

* 缩进保持 4 个空格
* if else 语句和上一个 if 语句中间留个空行
* 注释另起一行
* 不写分号，保持样式简洁
* 符号与字符串之间要空行
* 中文和英文之间用空格拆开
* 单行代码长度不超过 80 个字符
* 如果一行代码超过最大限度，换行的给两个默认缩进，增加辨识度
* 另外，换行缩进不要带符号换行
* 命名方式：
        1· 方法函数是驼峰命名
        2· 构造函数是首字母大写命名
        3· 常量采取全大写命名
        4· js 中不要省略小数点前的 0 （css可以）
* 多次申明 单var
* if 语句即使再短，也不要写在一行
* 申明在调用的前面
* 函数调用，参数要左右空格，以突出参数
* 立即执行函数若赋值给某个对象，给该函数加一个圆括号
* 尽量不使用 === 和 != (强转换机制)
* css 和 JavaScript 的松耦合
* 避免使用全局变量
* 组件式开发时，_ 开头为私有方法，监听事件前缀为 handle，事件监听传递时，属性名用 on 开头
* react组件内容编写顺序：
        1. static 开头类的属性，eg：defaultProps， propTypes
        2. 构造函数 constructor
        3. getter/setter 
        4. 组件生命周期
        5. _开头的私有方法
        6. 事件监听方法
        7. render* 开头的方法
        8. render

> EXP(以 react 为例):
``` 
    //组件
    class Exp extends Component {
        //初始化
        static propTypes = {
            onSubmit: PropTypes.func
        }

        //构造函数
        constructor () {
            super()
            this.state = {
                test: '1'
            }
        }

        // getter/setter
        getter() {

        }
        
        // 即将挂载
        componentWillMount () {
            localStorage.getItem('username')
        }

        // 已挂载
        componentDidMount () {

        }

        // 私有方法
        _selfFunction (username) {
            localStorage.setItem('username', username)
        }

        // 监听方法
        function1 () {
            //第一个 if 语句
            if () {
                var test = 'abc',
                    first = 1,
                    //立即执行函数
                    secound = (function () { return 0}())

                //第二个 if 语句
                if (allNumber || first || secound || third || monday || sunday || 
                        satarday) {
                    
                    //第三个 if 语句
                    if () {
                        function act (ppt) {}

                        act( ppt )
                        }
                    }
            } else {
                
            }
        }
    }
        
```