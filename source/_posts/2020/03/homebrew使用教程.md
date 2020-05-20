---
title: homebrew 使用教程
date: 2020-03-15 10:40:03
tags: [brew]
categories: mac
---

## 什么是 homebrew？

homebrew 是macos上的一款类似拓展软件包管理工具，当电脑提示缺少套件的时候，你就可以使用它去安装你所需要的套件

## 安装步骤

### 1. 第一步：创建brew文件夹

> sudo mkdir /usr/local/Homebrew

### 2. 第二步：克隆 brew 源

> sudo git clone https://mirrors.ustc.edu.cn/brew.git /usr/local/Homebrew

### 3. 第三步：创建一个快捷方式到/usr/local/bin目录

> sudo ln -s /usr/local/Homebrew/bin/brew /usr/local/bin/brew

### 4. 第四步：创建core文件夹 并 克隆（两句话分开运行）

> sudo mkdir -p /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core

> sudo git clone https://mirrors.ustc.edu.cn/homebrew-core.git /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core

### 5. 第五步：获取权限 运行更新（两句话分开运行）

设置 brew 的权限
> sudo chown -R $(whoami) /usr/local/Homebrew

更新 brew 配置
> brew update

### 最后：设置环境变量

> echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles' >> ~/.zshrcecho '

> export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles' >> ~/.bash_profile

## 常见的 brew 命令

### brew search pkg

搜索想要安装的依赖包

### brew doctor

查看本机brew是否可用

### brew install pkg

安装想要的依赖包

### brew uninstall pkg

卸载依赖包

### brew list

查看已经安装的依赖包

### brew info pkg

查看依赖包信息

## 常见问题

### Errno::EPERM: Operation not permitted @ dir_s_mkdir - /usr/local/Cellar

文件夹不存在，可以按照提示创建一下文件夹

