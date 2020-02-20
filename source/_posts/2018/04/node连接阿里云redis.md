---
title: node连接阿里云redis
date: 2018-04-24 18:45:42
tags: [redis, 阿里云]
categories: 数据库
---
# node 连接云 redis

## 1. 要求

1. 若 Redis 实例属于专有网络（VPC），ECS 必须与 Redis 实例属于同一个 VPC。
2. 若 Redis 实例属于经典网络，ECS 必须与 Redis 实例属于同一节点（地域）。
3. 若 Redis 实例开启了 IP 白名单，必须将 ECS 的内网地址加入白名单列表内。

## 2. 在云服务器 ECS Linux 中安装 rinetd

redis-cli -h 101.132.156.228 -a  r-uf60a44b13666134:'123456Jzx'

```js
wget http://www.boutell.com/rinetd/http/rinetd.tar.gz&&tar -xvf rinetd.tar.gz&&cd rinetd
sed -i 's/65536/65535/g' rinetd.c (修改端口范围)
mkdir /usr/man&&make&&make install
```

> 注意：rinetd 安装包下载地址不确保下载可用性，您可以自行搜索安装包进行下载使用。

## 3. 打开配置文件 rinetd.conf

vi /etc/rinetd.conf

## 4. 在配置文件中输入如下内容

```js
0.0.0.0 6379 Redis 的链接地址 6379
logfile /var/log/rinetd.log
```

> 说明：您可以使用 cat /etc/rinetd.conf命令来检验配置文件是否修改正确。

## 5. 执行如下命令启动 rinetd

```js
rinetd
```

> 注意
> ○ 您可以通过 echo rinetd >>/etc/rc.local 将 rinetd 设置为自启动。
> ○ 若遇到绑定报错，可以执行 pkill rinetd 结束进程，再执行 rinetd启动进程 rinetd。
> ○ rinetd 正常启动后， 执行netstat -anp | grep 6379 确认服务是否正常运行。

## 6. 在本地进行验证测试

```m
您可以在本地通过 redis-cli 连接 ECS Linux 服务器后进行登录验证，比如安装了 rinetd 的服务器的 IP 是 1.1.1.1，即redis-cli -h 1.1.1.1 -a Redis的实例ID:Redis密码。或者通过 telent 连接 ECS Linux 服务器后进行操作验证。假设 ECS Linux 服务器的 IP 是 1.1.1.1，即 telnet 1.1.1.1 6379。
连接上 ECS Linux 服务器后，输入连接 Redis 的密码：auth Redis的连接密码。
进行数据写入及查询验证。
```

## 7. 客户端连接 Redis

```js
const redis = require('redis'),
      RDS_PORT = 6379,
      RDS_PWD = '密码',
      RDS_HOST = '服务器ip',
      RDS_OPTS = {},
      client = redis.createClient(RDS_PORT, RDS_HOST, RDS_OPTS)

client.auth(RDS_PWD, function () {
  console.log('通过认证')
  client.set('author', 'jzx', redis.print)
  client.get('author', redis.print)
})
```

## 8. 小结

* 注意 ECS 若本地 redis-server 打开则先关闭，否则转发的并不是云 redis，而是本地 ECS 服务, 命令如下面给出所示。

```t
/etc/init.d/redis-server stop
/etc/init.d/redis-server start
/etc/init.d/redis-server restart
```

* 将 ECS 安全组设置里 redis 端口开放，如：6379。
