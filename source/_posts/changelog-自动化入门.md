---
title: changelog 自动化入门
date: 2019-01-10 10:40:03
tags: [changelog, node]
categories: web前端
---

# 初衷

在团队作战中，为了记录版本更新情况，往往需要一个日志进行记录每个版本功能的变化。但是目前公司使用的是人工纯手动生成日志，效率比较低，而且记录的不够详细。

## 预期实现功能

* 每次提交 commit 信息能够更直观，形成一定规范。
* 自动记录更新后重要的内容同步到 changeLog.md。

## log 相关工具

该文章主要介绍以下几款工具的组合使用：

* conventional-changelog-cli 核心命令行工具
* commitizen 简单的 commit 格式工具
* standard-version 版本管理工具

##  GIT commit 格式介绍

```html
<type>(<scope>): <subject>
// 空一行
<body>
// 空一行
<footer>
```

> 其中 Body 和 Footer 可以省略

### type

用于说明 commit 类别，以下给出几种类型代表的含义：

* feat 新功能
* fix Bug 修复
* docs 文档更新
* style 代码的格式，标点符号的更新
* refactor 代码重构
* perf 性能优化
* test 测试更新
* build 构建系统或者包依赖更新
* ci CI 配置，脚本文件等更新
* chore 非 src 或者 测试文件的更新
* revert commit 回退

### Scope

用于说明 commit 影响的范围，比如数据层，控制层，视图层，以实际项目为准。

### Subject

简单的描述，只有一行，以动词开头，不超过 50 个字符。

### Body

对本次 commit 的详细描述，可以多行，每行不超过 100 个字符。
> 应该说明代码变动的动机，和以前的行为对比。

### Footer

分为两种情况：

#### 1. 不兼容变动

如果当前代码和上一个版本不兼容，则以 BREAKING CHANGE 开头，后面是对变动的描述，以及变动理由和迁移方法。

```md
BREAKING CHANGE: isolate scope bindings definition has changed.

  To migrate the code follow the example below:

  Before:

  scope: {
    myAttr: 'attribute',
  }

  After:

  scope: {
    myAttr: '@',
  }

  The removed `inject` wasn't generaly useful for directives so there should be no code using it.
```

#### 2. 关闭 issue

如果当前 commit 针对某个 issue， 那么可以在 Footer 部分关闭这个 Issue。

```md
Close #1234,#4566...
```

### Revert

当前 Commit 用于撤销以前的 Commit 时， 必须以 Revert 开头，后面跟着被撤销的 Commit 的 Header。

```md
revert: feat(pencil): add 'graphiteWidth' option

This reverts commit 667ecc1654a317a13331b17617d973392f415f02.
```
