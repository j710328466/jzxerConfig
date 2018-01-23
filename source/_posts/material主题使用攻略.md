---
title: material主题使用攻略
date: 2017-02-15 19:59:16
tags: [hexo]
categories: 博客搭建
---

## 安装[Material]

``` bash
npm install hexo-meterial
```

该方法会将主题下载到node_modules文件夹下，找到该文件后，将文件名改为material

### 启用[Material]

找到主题文件下的_config.template.yml 改成 _config.yml

## 更新[Material]

``` bash
npm update hexo-material
```

让后将文件复制到 Material 主题文件中

## 配置主题

### head
* favicon: 网站的 favicon
* high_res_favicon: 高清 favicon
* apple_touch_icon: iOS 主屏按钮图标
* keywords: 网站关键词

### url
* rss: 设置生成的 rss 或 atom url
* daily_pic: 设置 daily_pic 模块 点击时跳转的 url
* logo: 设置 logo 点击时跳转的 url

### scheme
* Paradox
默认 Scheme，是 Material 的最初样式。居中布局，图文并茂。
* Isolation
Paradox 的至简样式，简洁明了。

### uiux
用于设置主题 UI 与 UX。
* heme_color: 主题主要颜色。主题的大部分地方使用此颜色。
* theme_sub_color: 主题辅助颜色。
* hyperlink_color: 超链接颜色。
* button_color: 按钮颜色，例如 toTop 或 menu_button。
* android_chrome_color: 安卓 Chrome 浏览器的地址栏颜色。
* nprogress_color: 页面加载时顶部加载进度条的颜色。
* nprogress_buffer: 页面加载时顶部加载进度条的缓冲时间。

### js_effect
用来控制 Material 主题中自带的多种 js 特性。
* fade: 页面加载时部分模块的渐显效果，默认为 true。
* smoothscroll: 页面平滑滚动特效，默认为 false。

### reading
entry_excerpt: 首页文章输出摘要的字符长度。默认为 80。
* entry_excerpt: 首页文章输出摘要的字符长度。默认为 80。

### background
用于设置站点背景。
* purecolor: 填入颜色代码。则站点使用纯色背景。
* bgimg: 背景地址，默认调用 主题文件夹 -> source -> img 中的 bg.png。可更换此图片或者自己填入 url。
* bing: 用于启用“必应美图”的图片作为背景。

### dropdown
用于设置 Paradox 侧边栏用户下拉菜单，默认为空。
```
dropdown:
	page:
		link: "mailto: someone@example.com"
		icon: email
        divider: 设置成 true 后会在归档按钮底部增加一条分割线。
```

## 创建文章

### 使用命令行
```
hexo new <title>
```
手动创建也行

### 格式
```
layout	  布局	      post
title	  标题	      文件名
date	  建立日期	    文件建立日期
updated	  更新日期	    文件更新日期
tags	  标签（不适用于分页）	
categories	           分类（不适用于分页）	
permalink	           覆盖文章网址	
thumbnail 缩略图地址	
toc	      显示 TOC 按钮	   true
comment	  显示评论	       true
notag	  不生成标签按钮	false
top	置顶	 false
```

## 创建「关于我」页面
新建一个 about 页面：
```
hexo new page "about"
```

## 创建「友情链接」页面
### 创建页面
在 hexo 目录下的 source 文件夹内创建一个名为 links（只是建议，可根据自己喜好修改）的文件夹。
然后在文件内创建一个名为 index.md 的 Markdown 文件。
在 index.md 文件内写入如下内容即可。
```
---
title: links
date:
layout: links
---
```
>title 可修改，layout 不可修改。

### 添加数据
同样在在 hexo 目录下的 source 文件夹内创建一个名为 _data（禁止改名）的文件夹。

然后在文件内创建一个名为 links.yml 的文件。

单个友情链接的格式为：
```
Name:
    link: http://example.com
    avatar: http://example.com/avatar.png
    descr: "这是一个描述"
```

## 创建「图库」页面
### 创建页面
在 hexo 目录下的 source 文件夹内创建一个名为 gallery（只是建议，可根据自己喜好修改）的文件夹。

然后在文件内创建一个名为 index.md 的 Markdown 文件。

在 index.md 文件内写入如下内容即可。
```
---
title: gallery
date:
layout: gallery
---
```

### 添加数据

同样在在 hexo 目录下的 source 文件夹内创建一个名为 _data（禁止改名）的文件夹。

然后在文件内创建一个名为 gallery.yml 的文件。

单个图片的格式为：
```
Name:
	full_link: http://example.com/full-image.png
	thumb_link: http://example.com/thumb-image.png
	descr: "这是一个描述"
```

## 创建「标签云」页面

### 创建页面

在 hexo 目录下的 source 文件夹内创建一个名为 tags（只是建议，可根据自己喜好修改）的文件夹。

然后在文件内创建一个名为 index.md 的 Markdown 文件。

在 index.md 文件内写入如下内容即可。

```
---
title: tags
date:
layout: tags
---
```

## 创建「私有」页面

如果某篇文章不想显示在站点中，只需要在 front-matter 中加入

```
layout: private
```