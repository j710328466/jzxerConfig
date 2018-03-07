---
title: redis环境搭建
date: 2018-03-07 10:35:17
tags: [redis]
categories: 数据库
---
## 下载
[官方网站](https://redis.io/)

## 安装
```
解压
tar zxvf redis-4.0.8.tar.gz
移动文件夹
mv redis-4.0.8 /usr/local/
打开该文件夹
cd /usr/local/redis-4.0.8/
编译测试
sudo make test
编译安装
sudo make install
```

## 启动
```
redis-server
```

## 配置
```
新建目录
sudo mkdir  redis-4.0.8/bin
sudo mkdir  redis-4.0.8/etc
sudo mkdir  redis-4.0.8/db
拷贝文件
cp src/mkreleasehdr.sh bin
cp src/redis-benchmark bin
cp src/redis-check-rdb bin
cp src/redis-cli bin
cp src/redis-server bin
```

## 修改redis.conf
```
#修改为守护模式
daemonize yes
#设置进程锁文件
pidfile /usr/local/redis-3.2.8/redis.pid
#端口
port 6379
#客户端超时时间
timeout 300
#日志级别
loglevel debug
#日志文件位置
logfile /usr/local/redis-3.2.8/log-redis.log
#设置数据库的数量，默认数据库为0，可以使用SELECT <dbid>命令在连接上指定数据库id
databases 16
##指定在多长时间内，有多少次更新操作，就将数据同步到数据文件，可以多个条件配合
#save <seconds> <changes>
#Redis默认配置文件中提供了三个条件：
save 900 1
save 300 10
save 60 10000
#指定存储至本地数据库时是否压缩数据，默认为yes，Redis采用LZF压缩，如果为了节省CPU时间，
#可以关闭该#选项，但会导致数据库文件变的巨大
rdbcompression yes
#指定本地数据库文件名
dbfilename dump.rdb
#指定本地数据库路径
dir /usr/local/redis-3.2.8/db/
#指定是否在每次更新操作后进行日志记录，Redis在默认情况下是异步的把数据写入磁盘，如果不开启，可能
#会在断电时导致一段时间内的数据丢失。因为 redis本身同步数据文件是按上面save条件来同步的，所以有
#的数据会在一段时间内只存在于内存中
appendonly no
#指定更新日志条件，共有3个可选值：
#no：表示等操作系统进行数据缓存同步到磁盘（快）
#always：表示每次更新操作后手动调用fsync()将数据写到磁盘（慢，安全）
#everysec：表示每秒同步一次（折衷，默认值）
appendfsync everysec
```

## 启动服务
```
启动
./bin/redis-server etc/redis.conf
查看日志
tail -f log-redis.log
OK
./bin/redis-cli
```

## 基本命令
```
查看所有数据
keys *
插入键值对
set a b
查看数据
get a
```

