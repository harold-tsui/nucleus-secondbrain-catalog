# nucleus-secondbrain-catalog

> NUCLEUS 家族成员 · SecondBrain 货架存储方案 skill

把「第二大脑货架式存储方案」(全域 L1–L4 + R1–R5 + 七规则 + 唯一归属 + 现场≠地图)封装成一个可移植的 OpenClaw / Claude skill。让任意 agent 在整理知识时，按统一规则做「开工第一问 / 空货架 / 放置决策 / 判断地位」。

## 内容

- `SKILL.md` —— 去个人化的 skill 本体（货架**规则**，可 `openclaw skills install`）。
- `framework/` —— 「空货架」**脚手架**：白名单 `.gitignore` 模板、`STRUCTURE.md` 生成脚本、
  L2 `_guide.md` 批量补全脚本、子域指南模板。供任何人 fork 自建货架。见 `framework/README.md`。
- `NAMING-POLICY.md` —— **双品牌命名策略**（`nucleus-*` 方法论 ↔ `<人名>-*` 私有实践），家族元规则。
- `THEORY.md` —— **理论依据**：心智模型、P1–P10 原则、R1–R5 结构规则、O1–O6 操作纪律、四实体模型。skill 与框架均由此推导。

## 家族关系

| 仓 | 职责 | 可见性 |
|---|---|---|
| `nucleus-governance` | PDCA 治理框架（tool-neutral） | 可公开 |
| **`nucleus-secondbrain-catalog`**（本仓） | 货架**规则 skill** + **框架脚手架** | 可公开 |
| `harold-secondbrain-vault` | harold 的**私有实例**（真实内容元数据） | 私有 |

规则（catalog）/ 模板（framework）/ 实例（vault）构成完整家族。命名遵循
[`NAMING-POLICY.md`](NAMING-POLICY.md)：`nucleus-*` 公开方法论 ↔ `harold-*` 私有落地实践。

## 反哺机制（实践 → 方法论）

方法论与实践是**双向**的：

```
nucleus-secondbrain-catalog  ──(指导)──▶  harold-secondbrain-vault
        ▲                                          │
        └──────────(回灌：去个人化后反哺)────────────┘
```

- **正向**：私有实例依据本仓的 `THEORY.md` + `SKILL.md` + `framework/` 实现货架。
- **反哺**：在私有实例（`harold-*`）维护中沉淀出的**通用改进**（新规则、新脚本、踩坑修正），
  **去个人化后回灌**到本仓，升级公共方法论。回灌须剔除一切 PII / 内部路径 / 凭据。
- **权威序**：内部规格（CDO · T05）为持续演进的权威源；本仓提炼自规格；私有实例依据本仓落地。
  三者不一致时，规格 > 本仓 > 实例。

## 权威来源

设计规格（持续演进，当前 v3.7-baseline）：
`A0-agents/workspaces/openclaw-agent-cdo/topics/T05-Data-Governance/deliverables/2026-06-09-catalog-L2-spec.md`
本 skill 的规则若与规格不一致，以规格为准，并回灌同步本仓。
