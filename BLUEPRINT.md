# SecondBrain Catalog · Public Directory Blueprint

> 去个人化目录蓝图。本文从一个真实 SecondBrain 实例反推而来，只保留可公开、可迁移的
> L1-L3 货架方法，不包含任何个人姓名、公司名称、凭据、财务、健康或家庭细节。

## 0. 用法

本文回答一个问题：**从零搭一套 SecondBrain，公开方法论推荐的目录长什么样？**

- `THEORY.md` 定义原则和心智模型。
- `SKILL.md` 定义 agent 放置决策流程。
- `framework/` 提供脚手架脚本。
- **本文给出可照着建的 L1-L3 目录蓝图**。
- `blueprint/` 是本文对应的实体目录树，可直接复制为新 vault 的空货架。

蓝图不是强制全量铺空壳。原则是：L1 顶层可一次建齐；L2/L3 按真实内容逐步创建。示例中的
`{person}`、`{org}`、`{project}`、`{year}` 是占位符，落地时换成自己的语义名。

## 1. 顶层 L1

```
00-system/       系统与治理：收件、规范、运维、工具
10-family/       家庭与亲密关系（PII，本机/私有同步）
20-social/       人际、人脉、社群
30-health/       身体与心理健康（PII，本机/私有同步）
40-self/         自我、价值观、目标、日记、个人信息
50-learning/     学习、课程、书籍、技能储备
60-finance/      资产、现金流、保险、规划（PII，本机/私有同步）
70-career/       事业行政口：组织背景、日常工作、业务网络
80-projects/     项目口：活跃项目包裹的 SSOT
90-lifestyle/    兴趣、旅行、娱乐、饮食等生活质量主题
A0-agents/       Agent 体系：平台、人格工作区、运行产物
B0-knowledge/    跨域知识库：被两个以上领域复用的知识
C0-archive/      冷档案：完成、退役、旧版本
D0-notes/        笔记软件现场：Obsidian/OneNote/ima 等活数据
```

### L1 设计意图

| 分组 | 作用 |
|---|---|
| `00-system` | 让系统运转的元件，不放生活/工作正文 |
| `10`-`90` | 人的生活与工作领域，按“它是什么”而不是“谁写的”归位 |
| `A0`-`D0` | 元层：Agent、跨域知识、归档、软件现场 |

`C0-archive` 不应作为当前内容来源；引用归档内容时要标明它是历史材料。

## 2. L2/L3 推荐骨架

### 00-system · 系统区

```
00-system/
  01-inbox/        唯一入站口：未分类材料暂存，事后分诊
  02-governance/   命名、目录、模板、治理规范、方法论仓库
  03-ops/          设备、网络、同步、凭据、运行配置、工具库
```

规则：
- 根域只放“让 SecondBrain 运转”的东西。
- 不确定归属的材料先入 `01-inbox`，不要新建 `misc/其他`。
- `03-ops` 常含凭据和设备配置，默认敏感。

### 10-family · 家庭

```
10-family/
  01-partner/
  02-children/
    01-{child}/
  03-parents/
    01-{parent}/
  04-family-affairs/
    01-photos/
    02-documents/
    03-plans/
```

规则：
- 这是 PII 域，默认不上 public git。
- L3 可按成员、事项或家庭事务类型组织。
- 真实姓名可以用于私有实例，public 模板只用占位符。

### 20-social · 人际

```
20-social/
  01-relationship-management/
    01-network-map/
    02-followups/
  02-contacts/
    01-classmates/
    02-work/
    03-partners/
    04-friends/
  03-communities/
    01-professional/
    02-interest/
```

规则：
- 个人关系放这里；客户、供应商、组织背景通常放 `70-career`。
- 外部通讯录是现场，不需要镜像搬运；这里只存沉淀、关系地图和重要档案。

### 30-health · 健康

```
30-health/
  01-body/
    01-checkups/
    02-medical-visits/
    03-monitoring/
    04-fitness/
  02-mental/
    01-mood-log/
    02-counseling/
```

规则：
- 这是高敏 PII 域，默认不上 public git。
- 若多人健康资料很多，也可把 L2 改为成员轴；同一实例内保持一种主轴。

### 40-self · 自我

```
40-self/
  01-values/
  02-goals/
  03-journal/
  04-personal-info/
```

规则：
- `03-journal` 存从笔记软件提炼后的复盘/成稿；笔记软件活数据进 `D0-notes`。
- `04-personal-info` 存证件、账号、实名材料等敏感资料，默认本机/私有同步。

### 50-learning · 学习

```
50-learning/
  01-active-learning/
  02-books/
  03-courses/
    01-{platform-or-topic}/
  04-skills/
    01-{skill-area}/
```

规则：
- 当前正在攻克的学习主题放 `01-active-learning`。
- 可跨多个领域复用的成熟知识，沉淀后进入 `B0-knowledge`。
- 未处理的大量原始资料不要误放技能域；按主题进入 `B0-knowledge/<topic>/1_raw` 更合适。

### 60-finance · 财务

```
60-finance/
  01-assets/
  02-liabilities/
  03-cashflow/
    2026/
  04-investments/
  05-insurance/
    01-life/
    02-critical-illness/
    03-medical/
    04-property/
  06-planning/
    01-annual-budget/
    02-home/
    03-education/
    04-retirement/
```

规则：
- 这是 PII 域，默认不上 public git。
- 存量按类别，流量按年份。
- 可用跳号预留重要但暂时稀疏的席位，例如 `02-liabilities`、`04-investments`。

### 70-career · 事业行政口

```
70-career/
  01-employment/
    00-personal/
    01-{role-or-department}/
    02-{role-or-department}/
  02-owned-business/
  03-side-business-admin/
  04-business-network/
    01-vendors/
    02-industry-resources/
```

规则：
- 这里放行政、组织背景、日常工作、业务网络、还未形成项目的材料。
- 有明确输入/输出物和生命周期的项目，应进入 `80-projects`。
- 项目和组织背景互相链接，不复制。

### 80-projects · 项目口

```
80-projects/
  00-workbench/
  01-{business-or-org}/
    2026/
      {PROJECT-ID}_{project-name}/
  02-{business-or-org}/
    00-template/
    01-incubation/
    02-presale/
    2026/
  03-side-projects/
    2026/
  04-personal-development/
    2026/
```

规则：
- 80 是所有活跃项目包裹的 SSOT。
- 正式项目优先按年份组织；未正式立项的工作可按状态轴（incubation/presale/research）按需创建。
- 项目包裹可有 `PROJECT-CHARTER.md`、`tasks/`、`topics/`、`deliverables/`，内部自治。
- 治理层建议保持机器友好命名；包裹名可保留业务需要的中文或项目 ID。

### 90-lifestyle · 兴趣生活

```
90-lifestyle/
  01-sports/
    01-skills/
    02-events/
  02-travel/
    2026/
  03-entertainment/
    01-films/
    02-performances/
  04-food/
    01-recipes/
    02-restaurants/
```

规则：
- 工作之外的生活质量主题放这里。
- 流水体验按年份，收藏/技能按类别。

### A0-agents · Agent 体系

```
A0-agents/
  platforms/
    {agent-platform}/
  workspaces/
    {agent-persona}/
  runtime/
    {runtime-output}/
```

规则：
- `platforms` 是软件平台或运行时配置。
- `workspaces` 是每个 agent/persona 的工作台，常可作为独立 git 仓。
- `runtime` 是会话、输出、快照等运行产物。
- Agent 人格、工具后端、项目包裹三者不要混放。

### B0-knowledge · 跨域知识

```
B0-knowledge/
  01-business/
  02-technology/
  03-personal-development/
  04-standards/
    1_raw/
    2_work/
    3_wiki/
    4_output/
  05-methodology/
    {method-name}/
```

规则：
- 被两个以上领域复用的知识才进入 B0。
- 单域知识留在对应域的包裹或 `3_wiki`。
- 方法论采用 Hub-and-Spoke：权威知识放一个 hub，其他域只引用不复制。

### C0-archive · 冷档案

```
C0-archive/
  01-career/
  02-projects/
  03-family/
  04-backups/
  05-old-versions/
  06-old-projects/
```

规则：
- 只放退役、完成、旧版本或冷备份。
- 尽量保留原归属路径信息，方便追溯。
- 不把归档材料当当前事实来源。

### D0-notes · 笔记软件现场

```
D0-notes/
  obsidian/
    {vault}/
  onenote/
    {notebook}/
  ima/
    {knowledge-base}/
```

规则：
- 这里放软件活数据，不放提炼后的沉淀。
- 从笔记软件提炼出的 wiki、报告、复盘，回到 `40-self`、`70-career`、`B0-knowledge` 等内容域。

## 3. 放置判据

### 3.1 先定 L1

问：这个东西未来主要靠什么找回？

| 主要检索方式 | L1 |
|---|---|
| 让系统运行 | `00-system` |
| 家人/家庭事务 | `10-family` |
| 人脉/社群/往来 | `20-social` |
| 身体/心理健康 | `30-health` |
| 自我、目标、日记、个人信息 | `40-self` |
| 学习过程 | `50-learning` |
| 资产、现金流、保险、规划 | `60-finance` |
| 职业/业务行政背景 | `70-career` |
| 有输入、输出、生命周期的项目 | `80-projects` |
| 兴趣与生活体验 | `90-lifestyle` |
| Agent 平台/人格/运行产物 | `A0-agents` |
| 跨域复用知识 | `B0-knowledge` |
| 完成/退役/旧版本 | `C0-archive` |
| 笔记软件活数据 | `D0-notes` |

### 3.2 再定 L2/L3

- **存量**：资产、保单、联系人、知识库、模板等，按类别或主体。
- **流量**：现金流、旅行、项目年份、日志等，按年份。
- **角色历程**：如果变化的是角色/岗位/阶段，用历程或组织席位，不用纯年份切碎。
- **项目包裹**：项目 ID 只应出现在最深货架之下，不当治理层。

### 3.3 不确定时

- 能唯一归属就归位。
- 真正跨域复用的知识进入 `B0-knowledge`。
- 暂时无法判断的材料进入 `00-system/01-inbox`，不要建 `misc`。
- 归档不是删除；归档后不要再当现状引用。

## 4. Public 化边界

从私有实例反哺 public 方法论时，必须做去个人化审查：

- 删除真实姓名、公司名、客户名、供应商名、项目商业细节。
- 删除路径中的设备名、用户名、凭据目录、内部配置名。
- 家庭、健康、财务、证件类只保留抽象货架，不给真实样例。
- 项目样例使用 `{PROJECT-ID}_{project-name}`，不要暴露真实项目。
- 若需要说明真实经验，只写规则形态，不写事实内容。

## 5. 维护记录

| 日期 | 维护人 | 变更 |
|---|---|---|
| 20260630 | codex | 将蓝图实体化为 `blueprint/` 目录树，作为 public repo 的主要交付物 |
| 20260630 | codex | 从真实 SecondBrain 实例抽象 public L1-L3 目录蓝图，新增去个人化放置判据与 public 化边界 |
