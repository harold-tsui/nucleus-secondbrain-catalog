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
| `bin/init-vault.sh <目标目录>` | **一键初始化**：复制 `../blueprint/` 空货架 + 装 `.gitignore`/脚本/命名规范 + 铺 L2 指南 + 生成快照 + 结构校验。幂等，不覆盖已有 |
| `bin/validate-structure.sh [根] [深度]` | **结构校验器**（O1 建前校验闸的可执行形态）：校验 R1/R5/垃圾抽屉/O6，违规退出码 1；R2 告警包裹占用 L1–L3 货架位。包裹识别 = 内嵌 `.git` **或**根 `.gitmodules` 登记的 submodule 槽位（本机未初始化的空槽同样按包裹跳过，不误报 R1/R5） |
| `gitignore.template` | 白名单式 `.gitignore`，复制到库根改名为 `.gitignore` |
| `ignore.template` | 反白名单式 `.ignore`，复制到库根改名为 `.ignore`。让尊重 ignore 文件的检索工具（ripgrep 谱系）看得见真实内容，**不改变 git 行为** |
| `bin/refresh-structure.sh [层数]` | 生成 `STRUCTURE.md` 目录骨架快照（默认 L3） |
| `bin/scaffold-guides.sh [--dry]` | 幂等批量补全缺失的 L2 `_guide.md` |
| `naming.template.md` | 命名规范最小切片，安装为 `00-system/02-governance/naming.md` |
| `_guide.template.md` | L2 子域指南占位模板 |

> ⚠️ **已知副作用（两份模板必须成对安装）**：白名单 `.gitignore` 会让所有尊重 ignore 文件的
> 检索工具（IDE 搜索、`rg` CLI、多数 agent 检索）**在库内失明**——只能看见骨架文件，搜不到
> 真实内容，表现为「文件明明在，就是搜不到」。`ignore.template` 正是为此而设：`.ignore` 在
> ripgrep 中优先级高于 `.gitignore`，可把整库反放行，**且不改变 git 行为**（git 仍只跟踪骨架）。
> 另有一条边界：内嵌 git 仓库只受自己的 ignore 文件约束，父级规则伸不进去，属正常现象。

脚本默认只排除通用工具目录（如 `.git` / `.obsidian` / `node_modules`）。若你的实例有不应扫描的
私有子树，可用环境变量传入冒号分隔的 `find -path` 模式：

- `SECOND_BRAIN_STRUCTURE_EXCLUDES`：供 `refresh-structure.sh` 使用
- `SECOND_BRAIN_SCAFFOLD_EXCLUDES`：供 `scaffold-guides.sh` 使用

## 快速开始

**推荐（一键）**：在 `nucleus-secondbrain-catalog` 检出内运行

```bash
framework/bin/init-vault.sh ~/MySecondBrain
# 然后按脚本输出的「下一步」提示 git init 并显式 add 货架文件
```

**手动（已有目录树时）**：在你自己的知识库根目录

```bash
# 1) 装上货架 .gitignore 与检索可见性 .ignore（两份必须成对）
cp <本目录>/gitignore.template .gitignore
cp <本目录>/ignore.template .ignore

# 2) 拷入维护脚本
mkdir -p bin && cp <本目录>/bin/*.sh bin/ && chmod +x bin/*.sh

# 3) 为 L2 子域铺 _guide.md 骨架
bin/scaffold-guides.sh --dry   # 预览
bin/scaffold-guides.sh

# 4) 生成目录骨架快照 + 结构校验
bin/refresh-structure.sh 3
bin/validate-structure.sh . 3

# 5) 初始化并提交（只显式 add 货架文件，切勿 git add -A）
git init
git add .gitignore .ignore STRUCTURE.md README.md bin/*.sh
find . \( -name _guide.md -o -name _index.md -o -name .gitkeep \) -not -path '*/.git/*' -print0 | xargs -0 git add
git commit -m "chore: 初始化货架仓库"
```

> ⚠️ 维护铁律：**只用显式 `git add <文件>`，永不 `git add -A`**——否则会误纳深层
> `README.md`/`*.yaml` 与内嵌 git 仓库（gitlink）。`git status` 里的 `??` 未跟踪目录是正常的。

## 家族关系

| 仓 | 职责 |
|---|---|
| `nucleus-secondbrain-catalog`（本仓） | 货架**规则 skill** + 本**框架脚手架** |
| `{private-owner}-secondbrain-vault` | 某个人/组织的**私有实例**（含真实内容元数据，不公开） |
| `nucleus-governance-spec` | PDCA 治理规范（tool-neutral） |
