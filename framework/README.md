# SecondBrain 货架框架（Framework）

> NUCLEUS 家族 · 「空货架」可移植脚手架。配合本仓 `../SKILL.md` 的规则使用，
> 让任何人都能用 git 版本化自己的第二大脑**组织骨架**（而非内容正文）。

## 设计理念

把知识库分成两层，**只版本化骨架**：

| 层 | 是什么 | 入 git? |
|----|--------|---------|
| **货架** | 目录骨架 + 各域 `_guide.md` / `_index.md` 导航 | ✅ |
| **内容** | 笔记正文、二进制资产、内嵌 repo、密钥 | ❌ |

货架分层覆盖 **L1–L3**（L1 域 / L2 子域 / L3 工作单元）；L4+ 属内容层，不进货架。

## 文件

| 文件 | 用途 |
|------|------|
| `gitignore.template` | 白名单式 `.gitignore`，复制到库根改名为 `.gitignore` |
| `bin/refresh-structure.sh [层数]` | 生成 `STRUCTURE.md` 目录骨架快照（默认 L3） |
| `bin/scaffold-guides.sh [--dry]` | 幂等批量补全缺失的 L2 `_guide.md` |
| `_guide.template.md` | L2 子域指南占位模板 |

## 快速开始（在你自己的知识库根目录）

```bash
# 1) 装上货架 .gitignore
cp <本目录>/gitignore.template .gitignore

# 2) 拷入维护脚本
mkdir -p bin && cp <本目录>/bin/*.sh bin/ && chmod +x bin/*.sh

# 3) 为 L2 子域铺 _guide.md 骨架
bin/scaffold-guides.sh --dry   # 预览
bin/scaffold-guides.sh

# 4) 生成目录骨架快照
bin/refresh-structure.sh 3

# 5) 初始化并提交（只显式 add 货架文件，切勿 git add -A）
git init
git add .gitignore STRUCTURE.md README.md bin/*.sh
find . \( -name _guide.md -o -name _index.md \) -not -path '*/.git/*' -print0 | xargs -0 git add
git commit -m "chore: 初始化货架仓库"
```

> ⚠️ 维护铁律：**只用显式 `git add <文件>`，永不 `git add -A`**——否则会误纳深层
> `README.md`/`*.yaml` 与内嵌 git 仓库（gitlink）。`git status` 里的 `??` 未跟踪目录是正常的。

## 家族关系

| 仓 | 职责 |
|---|---|
| `nucleus-secondbrain-catalog`（本仓） | 货架**规则 skill** + 本**框架脚手架** |
| `harold-secondbrain-vault` | 某人的**私有实例**（含真实内容元数据，不公开） |
| `nucleus-governance` | PDCA 治理框架（tool-neutral） |
