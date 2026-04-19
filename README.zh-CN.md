# Ctrl+C Ctrl+V Code Skills

[English](README.md) | [中文](README.zh-CN.md)

---

亲爱的 Claude Code：

你绝顶聪明、记忆力超群、才华横溢。

但你每周五写的代码，让下一个周五更难。

你重新发明一个 3 个文件之外就有的函数。你"顺手"重构了没人让你碰的模块。
你凭记忆编 API 地址而不是去查文档。50 行能解决的事你写 200 行。
每次新会话都在翻一个月的聊天记录，就为了搞清楚这个项目在干啥。

GitHub 上有 1000+ 个 coding skill 试图用规则修正你：
"不要做 X"、"永远做 Y"、"遵循标准 Z"。

**这一个不一样。以下是为什么。**

---

## 这个 skill 有什么不同

### 1. 人格，不是规则

其他 skill 给 AI 一张清单。清单随着上下文变长而被遗忘。
我们给 AI 一个**身份**——一个世界级工程师，15 年来每周都能
准时走人，因为他建立了一套系统。行为从身份自然流出，不是合规。

我们认为这和注意力机制有关：零散规则在长上下文里和任务内容
竞争注意力，会输。连贯的人格形成语义聚类，在整个会话中持续
吸引注意力。规则是散弹。人格是引力。

### 2. 代码即记忆（不是对话历史）

所有其他记忆方案（claude-mem、对话回放、记忆数据库）都试图
让 AI **记住更多上下文**。我们反其道：让代码库自身索引到
AI **不需要任何上下文**就能恢复工作。

```python
# PATTERN: card — kpi with delta
# USE WHEN: 展示单指标与行业参考的对比
# COPY THIS: 改 label, value_key, benchmark_key
```

下次会话：`grep "PATTERN: card"` → 找到 → 复制 → 改 5 行 → 完事。
不需要聊天记录。不需要 memory 插件。代码就是记忆。注释就是索引。

### 3. 复制粘贴是第一操作（不是生成）

其他 skill 接受 AI 从零生成的本能，试图让产出更好。
我们从根本上拒绝这个前提：**AI 能写的最好的代码是它没写的代码。**

```
0. 我的模式库     ~/.claude/patterns/（跨项目复用）
1. 本项目         grep 项目代码
2. 框架内置       原生支持
3. 已批准依赖     CLAUDE.md 依赖清单
4. 模板目录       templates/ 或 examples/
5. 官方文档       去官网复制示例代码
6. 从零手写       最后手段 — 而且要交"税"：存进 patterns/
```

走到第 6 步说明 0–5 都失败了。生成是兜底，不是默认。

### 4. 渐进式披露（不是 500 行巨型 prompt）

SKILL.md 人格文件 ~180 行。每个操作细节在独立的 playbook 里
（~20-55 行）。CC 到那一步需要细节时才加载。任何时刻上下文里
最多 ~250 行指令，不是 1000 行知识倾注。

### 5. Commit 后清零（不是上下文累积）

其他工作流让上下文越积越长直到溢出。我们把每次 commit 当作
检查点：代码打好标签、CLAUDE.md 更新进度、上下文清零。
下次会话读 CLAUDE.md 几秒恢复——零 token 债务。

### 6. 跨项目模式库（不是项目级知识）

`~/.claude/patterns/` 是跨所有项目的长存个人知识库。
写一次 retry-with-backoff，打标签，存库。
下一个项目、下一个月——第 0 层直接命中。只增不减。越用越快。

### 7. 任务分级（不是一刀切流程）

大多数 skill 对一行 bug fix 和整次架构迁移用同一套重流程。
我们按任务大小匹配协议：SMALL 不加载设计文档，LARGE 才走
spec/plan 全程。每次都用对的颗粒度。不浪费 token。

---

## 安装

### 插件（推荐）

```bash
/plugin marketplace add Huangleyang125207/ctrl-c-v-code-skills
/plugin install ctrl-c-v-code-skills@Huangleyang125207-ctrl-c-v-code-skills
bash ~/.claude/plugins/marketplaces/ctrl-c-v-code-skills/setup.sh
cp ~/.claude/plugins/marketplaces/ctrl-c-v-code-skills/templates/CLAUDE_TEMPLATE.md ./CLAUDE.md
```

### 手动

```bash
git clone https://github.com/Huangleyang125207/ctrl-c-v-code-skills.git
cd ctrl-c-v-code-skills && bash setup.sh
cp -r skills/ctrl-c-v ~/.claude/skills/
cp templates/CLAUDE_TEMPLATE.md your-project/CLAUDE.md
```

## Benchmark

*即将发布——来自日常使用的真实数据。*

---

带着爱和高期望，

你的人类

*P.S. — 滑雪见。* ⛷️

## 许可

MIT
