---
title: nginx配置和问题处理
date: 2018-04-26 11:16:23
tags: [nginx]
categories: 代理
---
# nginx 介绍

Nginx ("engine x") 是一个高性能的 HTTP 和 反向代理服务器，也是一个 IMAP/POP3/SMTP 代理服务器。 Nginx 是由 Igor Sysoev 为俄罗斯访问量第二的 Rambler.ru 站点开发的，第一个公开版本0.1.0发布于2004年10月4日。其将源代码以类BSD许可证的形式发布，因它的稳定性、丰富的功能集、示例配置文件和低系统资源的消耗而闻名。

尽管Node.JS的性能不错，但处理静态事务确实不是他的专长，如：gzip编码，静态文件，HTTP缓存，SSL处理，负载平衡和反向代理及多站点代理等，都可以通过nginx来完成，从而减小node.js的负载，并通过nginx强大的缓存来节省您网站的流量从而提高网站的加载速度。

## 查看 nginx 进程

```t
ps aux|grep nginx
```

## nginx.conf 配置

```-t
server {
                listen       3001;
                server_name  localhost;

                #charset koi8-r;

                #access_log  logs/host.access.log  main;

                location / {
                        root   html;
                        index  index.html index.htm;
                }
        }
```
> 大约 36 行的位置，端口号可以设置其他，最好不要用80，设置好之后重启。

## nginx 问题总结

### ubuntu 下卸载不干净

```t
sudo apt-get remove nginx nginx-common # 卸载删除除了配置文件以外的所有文件。

sudo apt-get purge nginx nginx-common # 卸载所有东东，包括删除配置文件。

sudo apt-get autoremove # 在上面命令结束后执行，主要是卸载删除Nginx的不再被使用的依赖包。

sudo apt-get remove nginx-full nginx-common #卸载删除两个主要的包。

sudo service nginx restart  #重启nginx
```