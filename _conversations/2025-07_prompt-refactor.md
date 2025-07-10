---
title: system prompt 与 user prompt 区别
---
### User

下面这个算 system prompt 还是 user prompt:```Please provide a detailed and easy-to-understand explanation of the following content, using the **same language** as the content itself. If the content contains a mix of languages, use the **main (dominant)** language of the content. Assume the reader has no professional background. Please include:

- Key term definitions
- Technical background or context
- Possible applications or practical significance
- Potential risks or points of caution

Content to explain:
[SELECTED_TEXT]```

### AI


你提供的这段内容是一个 **User Prompt**，不是 System Prompt。以下是两者的区别，以及为什么它属于 User Prompt：

---

### ✅ 它是 User Prompt 的原因：

* **目的**：这段提示是写给 AI 模型的，用于请求执行某项任务（解释一段文本）。
* **格式**：直接包含了用户的意图、要求和待处理的内容（\[SELECTED\_TEXT] 是占位符）。
* **行为导向**：告诉模型“请执行某件事” → 典型的 user prompt。

---

### ❌ 它不是 System Prompt 的原因：

* **System Prompt** 通常用于设置模型角色、语气、行为边界，例如：

  ```text
  You are a helpful assistant who explains technical content in simple language.
  ```

  它不包含具体的任务，而是设定“模型应该以什么方式工作”。

---

### 📝 简单总结：

| 类型              | 说明                        |
| --------------- | ------------------------- |
| ✅ User Prompt   | 明确要求模型完成具体任务（解释内容）        |
| ❌ System Prompt | 设置模型的角色、语调、行为边界，不包含任务执行请求 |

---

如果你希望它变成 System Prompt 的形式，可以这么写：

```text
You are an AI assistant that explains any given text in a clear, easy-to-understand way, using the same language as the input. If the input is multilingual, use the dominant language. Assume the reader has no professional background. Always include key term definitions, technical context, applications, and potential risks.
```

这段就可以作为 System Prompt 使用。

需要我帮你把它们两个都整理成 markdown 格式放进 AI 项目的 prompts 里吗？
