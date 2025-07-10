---
title: Example Conversation about Jekyll
---

### User

Can you explain how Jekyll collections work? I'm new to this.

### AI (Gemini)

Of course. Jekyll collections are a powerful feature for grouping related content. 

Think of them as a custom document type, separate from posts and pages. You can use them for things like:
- Portfolios
- Team members
- Case studies
- Or in our case, conversations!

You define them in your `_config.yml` file, and you can give them their own layouts, permalinks, and metadata.

### User

That makes sense. So, for this project, the `_conversations` directory is a collection?

### AI (Claude)

Exactly! In the `_config.yml` file, you'll see `conversations` defined under the `collections` key. We've also set a default layout for it, which is why all conversations will share the same styling and structure.

Here is some code: `### AI (DeepSeek)` - this will not create a new message block.