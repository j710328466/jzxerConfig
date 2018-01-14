---
title: git使用技巧
date: 2017-04-15 19:59:16
tags: [git, github]
categories: git
---

# 流程

## git连接GitHub

### 设置Git的信息(如果是第一次的话)
> git config --global user.name "名字"
> git config --global user.email "邮箱"

### 生成密匙(很重要)
这是你连接的必要部分，就相当于账号的登录密码，有这个你才能对GitHub上的项目进行操作
>  ssh-keygen -t rsa -C "710328466@qq.com"

### 配置密匙

* 将获取的密钥放到GitHub->setting下的SSH and GPG keys里面

### 新建项目

* 进入首页，新建一个repository

* 填写相应信息
        Repository name: 仓库名称

        Description(可选): 仓库描述介绍

        Public, Private : 仓库权限（公开共享，私有或指定合作者）
        Initialize this repository with a README: 添加一个README.md

        gitignore: 不需要进行版本管理的仓库类型，对应生成文件.gitignore

        license: 证书类型，对应生成文件LICENSE

### 下载 git bash
 #
* 下载地址去百度

### 将 gitHub 上的仓库克隆到本地
* git clone https://github.com/j710328466/yourItem.git（j710328466/yourBlog.git替换成你博客的地址）
>  这个步骤以后你的本地项目文件夹下面就会多出个文件夹，该文件夹名即为你github上面的项目名，如图我多出了个yourItem文件夹，我们把本地项目文件夹下的所有文件（除了新多出的那个文件夹不用），其余都复制到那个新多出的文件夹下

### cd Test 打开Test文件夹
* git add .    (添加所有文件)
> git add readme.md

* git commit -m "信息" 

* git push -u origin master  将本地文件上传到git仓库
>  如果push -u....报错，你就改成git pull --rebase origin master,重新push就可以了

## git 基本操作
### touch 文件名
添加到缓存

### git status
> 查看该项目改变的文件
* git status 

### git diff 
> 默认是暂未缓存的改动，这个可以查自己目前版本和上一个版本的改动位置

#### git diff --cached 
> 查看已缓存的改动

#### git diff HEAD 
> 查看已缓存与未缓存的所有改动

#### git diff --stat
> 显示摘要而非整个diff

### git rm 
> 将条目从缓存区中移除

### git mv
> 用于移动或重命名一个文件，目录
```
git add README
git mv README README.md
ls
```

## git 分支管理
### git branch
* 查看当前分支
> 后面加单词，即是创建分支: git branch day1

### 删除分支
> git branch -d testing

### git checkout ‘分支名’
> 切换分支

### git checkout -b newtest
>创建新分支并切换到该分支下

### git merge 分支
> 合并分支



