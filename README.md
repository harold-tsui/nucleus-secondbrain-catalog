# nucleus-secondbrain-catalog

> NUCLEUS 家族成员 · SecondBrain 货架存储方案 skill

把「第二大脑货架式存储方案」(全域 L1–L4 + R1–R5 + 七规则 + 唯一归属 + 现场≠地图)封装成一个可移植的 agent skill。让任意 agent 在整理知识时，按统一规则做「开工第一问 / 空货架 / 放置决策 / 判断地位」。

## 内容

- `SKILL.md` —— 去个人化的 skill 本体（货架**规则**）。
- `BLUEPRINT.md` —— 去个人化的 **L1-L3 目录蓝图**：从真实实例反推，但剔除 PII / 商业细节 / 凭据路径。
- `blueprint/` —— 可直接复制的 **实体空货架目录树**。这是本仓最主要的交付物。
- `framework/` —— 「空货架」**脚手架**：白名单 `.gitignore` 模板、`STRUCTURE.md` 生成脚本、
  L2 `_guide.md` 批量补全脚本、子域指南模板。供任何人 fork 自建货架。见 `framework/README.md`。
- `NAMING-POLICY.md` —— public 方法论仓的命名指针；私有 owner / 业务线 / 项目名不进入本仓。
- `THEORY.md` —— **理论依据**：心智模型、P1–P10 原则、R1–R5 结构规则、O1–O6 操作纪律、四实体模型。skill 与框架均由此推导。

## 家族关系

| 仓 | 职责 | 可见性 |
|---|---|---|
| `nucleus-governance-spec` | PDCA 治理规范（tool-neutral） | 可公开 |
| **`nucleus-secondbrain-catalog`**（本仓） | 货架**规则 skill** + **框架脚手架** | 可公开 |
| `{private-owner}-secondbrain-vault` | 个人/组织的**私有实例**（真实内容元数据） | 私有 |

规则（catalog）/ 模板（framework）/ 实例（vault）构成完整家族。命名遵循
[`NAMING-POLICY.md`](NAMING-POLICY.md)：public 方法论使用 `nucleus-*`；private 实例使用自己的 owner 前缀，且不在 public 仓披露真实 owner。

## 反哺机制（实践 → 方法论）

方法论与实践是**双向**的：

```
nucleus-secondbrain-catalog  ──(指导)──▶  {private-owner}-secondbrain-vault
        ▲                                          │
        └──────────(回灌：去个人化后反哺)────────────┘
```

- **正向**：私有实例依据本仓的 `THEORY.md` + `SKILL.md` + `framework/` 实现货架。
- **反哺**：在私有实例维护中沉淀出的**通用改进**（新规则、新脚本、踩坑修正），
  **去个人化后回灌**到本仓，升级公共方法论。回灌须剔除一切 PII / 内部路径 / 凭据。
- **目录蓝图**：从私有实例反推的目录结构先进入 `BLUEPRINT.md`，只保留可迁移的 L1-L3 货架，不回灌真实包裹名。
- **实体目录**：public 可复制骨架落在 `blueprint/`，目录用 `.gitkeep` 跟踪；真实内容永不放入本仓。
- **权威序**：内部规格为持续演进的权威源；本仓提炼自规格；私有实例依据本仓落地。
  三者不一致时，规格 > 本仓 > 实例。

## 权威来源

设计规格（持续演进，当前 v3.7-baseline）保存在 private governance workspace。
本 skill 的规则若与规格不一致，以规格为准，并回灌同步本仓。

## 维护记录

| 日期 | 维护人 | 变更 |
|---|---|---|
| 20260630 | codex | Review public 文件并移除 private owner / 业务线 / 内部路径等实例信息；脚本实例排除路径改为环境变量配置 |
| 20260630 | codex | 新增 `blueprint/` 实体空货架目录树，作为本仓主要交付物 |
| 20260630 | codex | 新增 `BLUEPRINT.md`，把私有 SecondBrain 实例去个人化抽象为 public L1-L3 目录蓝图 |
