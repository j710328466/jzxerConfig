---
title: PWA初窥
date: 2018-01-20 15:13:10
tags: [PWA]
categories: web前端
---
# Progressive Web Apps

## 特性

* 渐进式：能确保每个用户都能打开网页
* 响应式：PC，手机，平板，不管哪种格式，网页格式都能完美适配
* 离线应用：支持用户在没网的条件下也能打开网页，这里就需要 Service Worker 的帮助
* APP 化：能够像 APP 一样和用户进行交互
* 常更新：一旦 Web 网页有什么改动，都能立即在用户端体现出来
* 安全：安全第一，给自己的网站加上一把绿锁--HTTPS
* 可搜索：能够被引擎搜索到推送：做到在不打开网页的前提下，推送新的消息
* 可安装：能够将 Web 想 APP 一样添加到桌面
* 可跳转：只要通过一个连接就可以跳转到你的 Web 页面。

## 配置文件

```json
minifest.json 内容
{
  "short_name": "pwa",
  "name": "pwa - demo", // 应用名称
  "icons": [ // 应用显示图标，根据容器大小适配
    {
      "src": "assets/imgs/48.png",
      "type": "image/png",
      "sizes": "48x48"
    },
    {
      "src": "assets/imgs/96.png",
      "type": "image/png",
      "sizes": "96x96"
    },
    {
      "src": "assets/imgs/192.png",
      "type": "image/png",
      "sizes": "192x192"
    }
  ],
  "background_color": "#2196F3", // 刚打开页面时的背景
  "theme_color": "#2196F3", // 主题颜色
  "display": "standalone", //独立显示
  "start_url": "index.html?launcher=true" // 启动的页面
}
```

待续...