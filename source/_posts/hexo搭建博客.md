---
title: hexo 搭建博客初体验
tags: [hexo]
categories: 博客搭建
date: 2017-05-01 19:59:16
---
# hexo 搭建博客初体验

## 安装 hexo

```js
> cnpm i hexo-cli -g
报错的话就输入
> cnpm i hexo --save
查看安装是否成功
> hexo -v
```

## hexo配置

### hexo 初始化

```js
> hexo init
然后
> cnpm install
到这里你差不多就可以看到效果了，如果你要连接 GitHub，就要往下继续 
```

### 连接 GitHub

在根目录打开 vim _config.yml，翻到最下面，改成我这样子的

* 如果你是用 github 仓库

```json
> deploy:
    type: git
    repo: https://git.coding.net/jzxer/jzxer.git
    branch: master
* 如果你是用 coding 仓库
> deploy:
    type: coding
    repo: https://github.com/j710328466/j710328466.github.io.git
    branch: master
```

### 安装依赖包

```js
> npm install hexo-deployer-git --save
```

## 开始

```js
创建一篇新文章
$ hexo new "My New Post"

监听
$ hexo server

打包
$ hexo generate

上传
$ hexo deploy
```

## 主题配置

* 打开根目录下的vim _config.yml
> theme: material
> 将主题改成你喜欢的

## 主题推荐

每个不同的主题会需要不同的配置，主题配置文件在主题目录下的 _config.yml。有两个比较好的主题推荐给大家。

### Yilia

Yilia 是为 hexo 2.4+ 制作的主题。
崇尚简约优雅，以及极致的性能。

### NexT

目前Github上Star最高的Hexo主题，支持几种不同的风格。
作者提供了非常完善的配置说明。

### Material

原之质，物之渊
就是我现在用的这款，简洁大方，响应式设计。