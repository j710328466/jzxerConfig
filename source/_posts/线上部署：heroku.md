---
title: 线上部署：heroku
date: 2018-04-26 14:57:25
tags: [heroku]
categories: 自动化
---
# 介绍

heroku 是一个自动部署工具，可以在代码发布后马上线上跑起来，对于一个刚入门的 node 新手有利于促进你的开发热情。

## 1. 注册一个账号

[heroku](https://www.heroku.com)
> 注意邮箱项目可以填写阿里云邮箱，目前qq邮箱和163邮箱不支持注册。

## 2. 配置文件：Procfile

给 heroku 指明入口文件，配置内容如下：

```js
web: node app.js
```

## 3. 下载工具包

[下载链接](https://devcenter.heroku.com/articles/getting-started-with-nodejs#set-up)

## 4. 登录账户

```js
heroku login
```

## 5. 创建远程仓库

```js
heroku create
```

> 此时会给出一个仓库地址，留给下文用。

## 6. 推送到远端

```js
git push '给的仓库地址.git' master
```

## 7. 测试项目

输入以下命令打开推送的内容

```js
heroku open
```

## 8. 插件

heroku 有很多插件可供链接，
