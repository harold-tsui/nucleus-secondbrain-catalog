# nucleus-secondbrain-catalog

> NUCLEUS 家族成员 · SecondBrain 货架存储方案 skill

把「第二大脑货架式存储方案」(全域 L1–L4 + R1–R5 + 七规则 + 唯一归属 + 现场≠地图)封装成一个可移植的 OpenClaw / Claude skill。让任意 agent 在整理知识时，按统一规则做「开工第一问 / 空货架 / 放置决策 / 判断地位」。

## 内容

- `SKILL.md` —— 去个人化的 skill 本体（货架**规则**，可 `openclaw skills install`）。
- `framework/` —— 「空货架」**脚手架**：白名单 `.gitignore` 模板、`STRUCTURE.md` 生成脚本、
  L2 `_guide.md` 批量补全脚本、子域指南模板。供任何人 fork 自建货架。见 `framework/README.md`。

## 家族关系

| 仓 | 职责 | 可见性 |
|---|---|---|
| `nucleus-governance` | PDCA 治理框架（tool-neutral） | — |
| **`nucleus-secondbrain-catalog`**（本仓） | 货架**规则 skill** + **框架脚手架** | 可公开 |
| `nucleus-secondbrain-vault` | 某人的**私有实例**（真实内容元数据） | 私有 |

规则（catalog）/ 模板（framework）/ 实例（vault）构成完整家族；前两者同属
`00-system/02-governance/` 治理货架，为跨域复用的治理能力。

## 权威来源

设计规格（持续演进，当前 v3.7-baseline）：
`A0-agents/workspaces/openclaw-agent-cdo/topics/T05-Data-Governance/deliverables/2026-06-09-catalog-L2-spec.md`
本 skill 的规则若与规格不一致，以规格为准，并回灌同步本仓。
