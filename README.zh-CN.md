# Ctrl+C Ctrl+V Code Skills

[English](README.md) | [中文](README.zh-CN.md)

一个面向 Claude Code 的 3-skill 插件套件——让 AI 像不从零写代码的资深
工程师那样工作：先搜后写、能抄就抄、把注释当作搜索索引、从不忘记上次
工作到哪。

---

## 套件里的 3 个 skill

| Skill | 何时激活 | 详细文档 |
|---|---|---|
| **ctrl-c-v** | 任何编程语言的编码任务 | [docs/ctrl-c-v.md](docs/ctrl-c-v.md) |
| **ctrl-c-v-tdd** | 代码触及外部边界（API / DB / cron） | [docs/ctrl-c-v-tdd.md](docs/ctrl-c-v-tdd.md) |
| **human-ai-schedule** | 日记 / 复盘 / 协作记录 | [docs/human-ai-schedule.md](docs/human-ai-schedule.md) |

每个 skill 按各自 description 独立激活——TRIGGER 和 SKIP 规则明确写
在 description 里，详见各 skill 的独立页。

---

## 为什么需要这个套件

三个回答应对你已经经历过的三种失败：

- **生成 > 复制**：其他 coding skill 接受 AI"从零生成"的本能，再
  试图让输出更好。我们拒绝这个前提——**copy beats compose**。
  → `ctrl-c-v`
- **未测试的边界**：周六把你叫醒的代码，是你忘了测试别人代码与你
  代码交界处的代码。→ `ctrl-c-v-tdd`
- **遗忘上下文**：聊天历史到周三就模糊。其他记忆插件试图让 AI
  "记得更多"；我们让代码库 + 带日期日记本身**索引到位**，AI 不需要
  任何上下文也能从断点续上。→ `ctrl-c-v` + `human-ai-schedule`

完整设计哲学 + 7 条原则 → [docs/ctrl-c-v.md](docs/ctrl-c-v.md)。

---

## 安装

### 插件（推荐）

```
/plugin marketplace add https://github.com/Huangleyang125207/ctrl-c-v-code-skills
/plugin install ctrl-c-v-code-skills@local
```

### 手动

```bash
git clone https://github.com/Huangleyang125207/ctrl-c-v-code-skills
cd ctrl-c-v-code-skills
bash setup.sh         # 创建 ~/.claude/patterns/ + scripts/
bash sync-runtime.sh  # 把 skills/ + templates/ 部署到 ~/.claude/
```

重启 Claude Code 让 skill 加载。

---

## 更新

```bash
git pull
bash sync-runtime.sh
```

`sync-runtime.sh` 把仓库的 `skills/` + `templates/` 部署到
`~/.claude/`，幂等。可选 flag：

- `--check-only`——rsync dry-run，只报变化不写
- `--no-setup`——跳过 `setup.sh`

⚠️ `sync-runtime.sh` 在子目录内用 `rsync --delete`。**不要手动改
`~/.claude/skills/<name>/` 下任何文件**——下次同步会被覆盖。改这个
仓库、push、再 sync。

同步后重启 Claude Code 加载更新的 description。

---

## 其他 Agent

这些 skill 主要针对 Claude Code，但模式（SKILL.md frontmatter 约定、
sub-skill 打包、copy-paste 层级）也适用于任何加载 markdown 上下文的
agent：

```
compatible-with:
  claude-code  (主要测试目标)
  cursor       (frontmatter 语法兼容)
  codex        (description-as-prompt 约定)
  windsurf     (类似)
  gemini-cli   (类似)
```

---

## 许可

MIT
