---
layout: default
---

{% assign pages_by_dir = site.pages | where_exp: "item", "item.path contains '/'" | group_by_exp: "item", "item.path | split: '/' | first" %}

{% for dir in pages_by_dir %}
  <h2>{{ dir.name | capitalize }}</h2>
  <ul>
    {% for item in dir.items %}
      <li><a href="{{ item.url | relative_url }}">{{ item.name | remove: ".md" }}</a></li>
    {% endfor %}
  </ul>
{% endfor %}
