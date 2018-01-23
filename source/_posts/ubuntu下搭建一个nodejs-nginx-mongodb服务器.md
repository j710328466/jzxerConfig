---
title: ubuntu下搭建一个nodejs+nginx+mongodb服务器
date: 2017-12-27 11:53:22
tags: [nodejs, ubuntu]
categories: 服务器
---

## ubuntu 使用方法
```
首先输入fdisk -l命令后,发现/dev/vdb，说明实例含有数据盘，需要挂载

运行fdisk /dev/vdb，对数据盘进行分区，依次输入n,p,1，然后按两次回车，最后输入wq，进行分区

分区完成之后运行fdisk -l命令，查看新的分区。可以看到新的分区vdb1已经创建好了。

运行mkfs.ext3 /dev/vdb,对新分区进行格式化。

格式化完成之后运行echo /dev/xvdb1 /mnt ext3 defaults 0 0 >> /etc/fstab (这是一条命令)写入分区信息。

完成之后运行 cat /etc/fstab 可以进行查看

运行mount /dev/vdb1 /mnt 挂载新分区，然后执行df -h 查看分区，如果出现数据盘信息，说明挂载成功，就可以开始使用新分区

作者：wuyumumu
链接：https://www.jianshu.com/p/8fb738cd8672
來源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
```

## nodejs 安装
```
sudo apt-get update

sudo apt-get install nodejs

sudo apt-get install npm
```
> 特别注意：Ubuntu中可执行的名字是 nodejs 而不是node

### 额外工具 n
一款管理nodejs版本的工具
```
升级node.js到最新稳定版

n stable

升级node.js到最新版

n latest
```

## 安装Nginx
```
安装gcc g++的依赖库
apt-get install build-essential
apt-get install libtool

安装 pcre依赖库
sudo apt-get update
sudo apt-get install libpcre3 libpcre3-dev

安装 zlib依赖库
apt-get install zlib1g-dev

安装 ssl依赖库
apt-get install openssl

安装Nginx（http://nginx.org）
#下载最新版本：
wget http://nginx.org/download/nginx-1.13.4.tar.gz（根据官网查看最新版本下载对应版本）

#解压：
tar -zxvf nginx-1.13.4.tar.gz

#进入解压目录：
cd nginx-1.13.4

#配置：
./configure --prefix=/usr/local/nginx 

#编辑nginx：
make

#安装nginx：
sudo make install

#启动nginx：
先切到根目录cd /
sudo /usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf

#查看nginx进程：
ps -ef|grep nginx 

#查看nginx版本(根目录下执行)
usr/local/nginx/sbin/nginx   -v

```

测试nginx安装成功
wget http://127.0.0.1 （会下载一个默认的html文件，直接ls查看当前目录可看到）