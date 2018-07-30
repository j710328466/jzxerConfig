---
title: node前后端自动部属方案
date: 2018-07-30 11:41:57
tags:
---
# 简介

前后端分离的概念现在已经应用的比较广了，它使我们的工作更加的高效，也提升了后期代码的可维护性，减少人力成本。

近年来 nodeJS 的出现，更让 js 提升到了一个新的高度，同时衍生出了很多。grunt、gulp、webpack、parcel这些工具都是建立在 node 的基础上实现的，它们极大的提升了我们的开发的效率。

在一个公司，开发一般会分为几个阶段：

> 开发 -> 开发部署 -> 开发测试  -> 测试部署 -> 测试测试 -> 预发布部署 -> 预发布测试 -> 正式上线
基本上每次测试之前，我们都有一个部署阶段，而部署阶段，往往都依赖运维。那么问题来了，有没有一种简洁高效的方案，让我们从运维那个层面脱离出来，实现开发到上线，或者是开发至预上线的自动部署？答案是肯定的，在 node 的帮助下，这次我们可以装这波逼...

## 实现思路

通过 push git 上的代码，webhooks 向你的 ECS 发送请求，ECS 接收到请求后，重新拉取 git 上的最新数据，实现自动部署。

## 开发准备

* 腾讯云 ECS （centOS 7.2 64位）
* GitHub 账号
* node 基本知识
* pm2、git

## 第一步

首先，需要有一个服务器来模拟场景，如果是新手，建议新建一个账号，不要直接在 root 权限下运行。然后在服务器上安装：git、pm2 和 node。新建一个项目文件夹，npm 初始化后，在里面创建 app.js 文件，内容如下：

```js
var express = require('express')
var app = express()
var bodyParser = require('body-parser')
var path = require('path')
var { exec } = require('child_process')
// var fetch = require('node-fetch')

const PORT = 3008

app.use(bodyParser.json())

app.post('/CI', (req, res, next) => {
    var project = 'travis_demo'
    let PATH = path.resolve(__dirname, '../' + project)

    var cmd = `cd ${PATH} && git reset --hard && git pull && pm2 restart ${project}`

    // 将你想要运行的命令行代码输出运行
    exec(cmd, (err, stdout, stderr) => {
      if (err) {
        res.writeHead(500)
        res.end('Server Internal Error.')
        throw err
      }
      console.log(`stdout: ${stdout}`);
      console.log(`stderr: ${stderr}`);
      res.writeHead(200)
      res.end('this is good~')
    })
})

app.listen(PORT, () => {
  console.log('this app is running at port:' + PORT)
})

```

## 第二步

给云主机添加 ssh ，具体教程百度，我博客里面也有，好了之后将上面的接口暴露给你想自动部署的项目，位置在该项目下 setting 选项下的 Webhooks，你可以设置它在什么场景下才会调用这个接口。
![](https://user-gold-cdn.xitu.io/2018/7/30/164ea0f044c8baf7?w=1018&h=688&f=png&s=107311)

## 第三步

将这个项目通过 git clone 拉取到 ECS，安装依赖后，在项目根目录新建一个 bash 脚本（建议以该项目的文件夹名称命名），然后用 pm2 将该项目通过 pm2 start bash.sh 跑起来。

## 第四步

到了这一步，基本上已经 OK 了~

> 但是！！！

这样逼格还是不够高，不能满足我们的需求。我们捋一捋，一般情况下，项目是否部署成功，需要有个消息推送通知，这样我们可以及时的知道该项目目前的状态。钉钉为我们提供了这个功能，它可以让我们接入自定义的 webhooks。接下来我们将 ECS 的接口内容修改为：

```js
app.post('/CI', (req, res, next) => {
    var project = 'travis_demo'
    let PATH = path.resolve(__dirname, '../' + project)

    var cmd = `cd ${PATH} && git reset --hard && git pull && pm2 restart ${project}`

    // 将你想要运行的命令行代码输出运行
    exec(cmd, (err, stdout, stderr) => {
      if (err) {
        res.writeHead(500)
        res.end('Server Internal Error.')
        throw err
      }
      let mes = {
        "msgtype": "text",
        "text": {
          // 在钉钉上推送的自定义消息
           "content": `我就是我, @1825718XXXX 是不一样的烟火`
        }
      }
    }
    // access_token 是创建机器人的那个人才能看见
    fetch('https://oapi.dingtalk.com/robot/send?access_token=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
      {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(mes)
      }
    ).then(response => response.json())
      .then(json => console.log(json));
    console.log(`stdout: ${stdout}`);
    console.log(`stderr: ${stderr}`);
    res.writeHead(200)
    res.end('this is good~')
  })
})
```

现在就是见证奇迹的时刻，当你每次 push 代码到 git 的时候，ECS 会向钉钉推送消息，如下图所示：

![](https://user-gold-cdn.xitu.io/2018/7/30/164ea148f4794ee1?w=964&h=186&f=png&s=34196)

## 总结

这篇文章总结的内容还只是从一个中端的角度思考的，对目前这种实现的方法唯一担心的地方就是安全，毕竟一万个人有一万种想法，所以才需要更深入的学习将它的坑位全部填满，待到技术成熟之日，就是抢后端饭碗之时~