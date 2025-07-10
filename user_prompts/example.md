---
title: "示例：为已有代码生成单元测试"
date: "2025-07-10 10:01:00"
tags:
  - unit-test
  - python
  - programming
model: "Gemini Pro"
---

请为以下 Python 函数编写一个全面的单元测试套件，使用 `pytest` 框架。

```python
def calculate_average(numbers):
    if not isinstance(numbers, list):
        raise TypeError("Input must be a list.")
    if not numbers:
        return 0
    return sum(numbers) / len(numbers)
```

测试用例应覆盖以下场景：
1.  一个包含正整数的普通列表。
2.  一个空列表。
3.  一个包含浮点数的列表。
4.  一个包含负数的列表。
5.  当输入不是列表时，验证是否会引发 `TypeError`。
