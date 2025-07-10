---
title: "Jelly Knowledge"
ai_model: "Claude 3.5 Sonnet"
generated_date: 2025-07-10
tags: [jelly]
---

<div markdown="1">
{% raw %}
# Jekyll 语法总结

## 1. Liquid 模板语言基础

Jekyll 使用 Liquid 模板语言，有三种主要语法：

### 输出标签 `{{ }}`
```liquid
{{ site.title }}           # 输出网站标题
{{ page.title }}           # 输出页面标题
{{ content }}              # 输出页面内容
```

### 逻辑标签 `{% %}`
```liquid
{% if page.title %}
  <h1>{{ page.title }}</h1>
{% endif %}

{% for post in site.posts %}
  <h2>{{ post.title }}</h2>
{% endfor %}
```

### 注释标签 `{% comment %}`
```liquid
{% comment %}
这是注释，不会出现在输出中
{% endcomment %}
```

## 2. 常用变量

### 全局变量
```liquid
{{ site.title }}          # 网站标题
{{ site.description }}    # 网站描述
{{ site.url }}            # 网站 URL
{{ site.baseurl }}        # 基础路径
{{ site.time }}           # 构建时间
```

### 页面变量
```liquid
{{ page.title }}          # 页面标题
{{ page.content }}        # 页面内容
{{ page.url }}            # 页面 URL
{{ page.date }}           # 页面日期
{{ page.layout }}         # 使用的布局
```

### 文章变量
```liquid
{{ post.title }}          # 文章标题
{{ post.content }}        # 文章内容
{{ post.excerpt }}        # 文章摘要
{{ post.url }}            # 文章 URL
{{ post.date }}           # 文章日期
```

## 3. 控制结构

### 条件语句
```liquid
{% if user %}
  Hello {{ user.name }}
{% elsif user.name == 'anonymous' %}
  Hello Anonymous
{% else %}
  Hello World
{% endif %}

{% unless user %}
  Please log in
{% endunless %}
```

### 循环语句
```liquid
{% for post in site.posts %}
  <h2>{{ post.title }}</h2>
{% endfor %}

{% for item in site.data.navigation limit:5 %}
  <a href="{{ item.url }}">{{ item.title }}</a>
{% endfor %}

{% for i in (1..5) %}
  <p>Item {{ i }}</p>
{% endfor %}
```

### 循环控制
```liquid
{% for post in site.posts %}
  {% if forloop.first %}
    <h2>最新文章</h2>
  {% endif %}

  <article>{{ post.title }}</article>

  {% if forloop.last %}
    <p>共 {{ forloop.length }} 篇文章</p>
  {% endif %}
{% endfor %}
```

## 4. 过滤器

### 字符串过滤器
```liquid
{{ "hello world" | capitalize }}      # Hello world
{{ "HELLO" | downcase }}               # hello
{{ "hello" | upcase }}                 # HELLO
{{ "hello world" | replace: "world", "jekyll" }}  # hello jekyll
{{ "hello world" | split: " " }}       # ["hello", "world"]
{{ "hello world" | truncate: 8 }}      # hello...
```

### 数组过滤器
```liquid
{{ site.posts | size }}               # 数组长度
{{ site.posts | first }}              # 第一个元素
{{ site.posts | last }}               # 最后一个元素
{{ site.posts | sort: "date" }}       # 按日期排序
{{ site.posts | reverse }}            # 反转数组
{{ site.posts | where: "layout", "post" }}  # 筛选
```

### 日期过滤器
```liquid
{{ site.time | date: "%Y-%m-%d" }}     # 2024-01-01
{{ page.date | date: "%B %d, %Y" }}    # January 01, 2024
{{ "now" | date: "%Y-%m-%d %H:%M" }}   # 当前时间
```

### URL 过滤器
```liquid
{{ "/assets/style.css" | relative_url }}      # 添加 baseurl
{{ "https://example.com" | absolute_url }}    # 完整 URL
{{ page.url | prepend: site.baseurl }}        # 手动添加前缀
```

## 5. 集合 (Collections)

### 配置集合
```yaml
# _config.yml
collections:
  staff:
    output: true
    permalink: /staff/:path/
```

### 使用集合
```liquid
{% for member in site.staff %}
  <h2>{{ member.name }}</h2>
  <p>{{ member.content }}</p>
{% endfor %}
```

## 6. Front Matter

### YAML 格式
```yaml
---
title: "文章标题"
date: 2024-01-01
layout: post
categories: [blog, jekyll]
tags: [tutorial, guide]
---
```

### 在模板中使用
```liquid
<h1>{{ page.title }}</h1>
<p>发布于: {{ page.date | date: "%Y-%m-%d" }}</p>
<p>分类: {{ page.categories | join: ", " }}</p>
```

## 7. 包含文件 (Includes)

### 简单包含
```liquid
{% include header.html %}
{% include footer.html %}
```

### 带参数包含
```liquid
{% include navigation.html menu="main" %}
{% include button.html text="Click me" url="/contact" %}
```

### 在 include 文件中使用参数
```liquid
<!-- _includes/button.html -->
<a href="{{ include.url }}" class="button">{{ include.text }}</a>
```

## 8. 数据文件

### YAML 数据文件
```yaml
# _data/navigation.yml
- name: Home
  url: /
- name: About
  url: /about
```

### 使用数据文件
```liquid
{% for item in site.data.navigation %}
  <a href="{{ item.url }}">{{ item.name }}</a>
{% endfor %}
```

## 9. 常用技巧

### 默认值
```liquid
{{ page.title | default: "无标题" }}
{{ page.author | default: site.author }}
```

### 条件输出
```liquid
{{ page.excerpt | default: page.content | strip_html | truncate: 160 }}
```

### 链式过滤器
```liquid
{{ page.title | downcase | replace: " ", "-" | prepend: "/blog/" }}
```

### 捕获变量
```liquid
{% capture my_variable %}
  {{ page.title | downcase | replace: " ", "-" }}
{% endcapture %}
<p>{{ my_variable }}</p>
```

这些是 Jekyll 中最常用的语法，掌握这些就能够创建复杂的静态网站了。

{% endraw %}
</div>
