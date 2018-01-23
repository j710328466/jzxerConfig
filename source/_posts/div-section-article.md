---
title: 'div,section,article'
date: 2017-06-28 17:24:19
tags: [语义化]
categories: HTML
---

## div
div在html早期版本就支持了，section和article是html5提出的两个语义化标签。如果只是针对一个块内容做样式化，三者并无区别。

## section
作为语义化标签，section 应用的典型场景有文章的章节、标签对话框中的标签页、或者论文中有编号的部分。一般来说，当元素内容明确地出现在文档大纲中时，section 就是适用的。

## article
对于article标签来说，无论从结构上还是内容上来说，article 本身就是独立的、完整的。有个最简单的判断方法是看这段内容脱离了所在的语境，是否还是完整的、独立的，如果是，则应该用article标签。

## 小结
> 合理的语义化标签，可以更好的方便seo，也不知道为什么，我现在更喜欢细节的东西

div < section < article ，语义是从无到有，逐渐增强的。div 无任何语义，仅仅用作样式化或者脚本化，对于一段主题性的内容，则就适用 section，而假如这段内容可以脱离上下文，作为完整的独立存在的一段内容，则就适用 article。原则上来说，能使用 article 的时候，也是可以使用 section 的，但是实际上，假如使用 article 更合适，那么就不要使用 section 。