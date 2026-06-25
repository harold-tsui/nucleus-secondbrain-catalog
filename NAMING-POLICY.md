# NUCLEUS 仓库双品牌命名策略

> NUCLEUS 家族元规则 · 方法论与落地实践的分离

## 核心原则

仓库**按"性质/层级"分两个品牌命名空间**，而非按归属：

| 品牌 | 含义 | 可见性 | 内容 | 类比 |
|------|------|--------|------|------|
| **`nucleus-*`** | 方法论 / 框架 / 规则（tool-neutral、去个人化、可移植） | ✅ 可 public | **不含 PII** | 理论 / SDK / 规格 |
| **`harold-*`** | 落地实践 / 个人实例（真实数据、具体配置） | 🔒 必须 private | 可含 PII | 生产部署 / 实例 |

> `harold-` 不是冗余的归属标记，而是"私有实践家族"命名空间——与 `nucleus-`（公开方法论家族）对立成对。
> 多人协作时，每个实践者用自己的人名 token 开一个实践家族（`alice-*`、`bob-*`）。

## 命名模式

```
方法论：  nucleus-<主题>-<制品>     制品 ∈ {catalog, framework, spec, governance, tools-<x>}
实践：    <人名>-<主题>-<限定>      限定 ∈ {vault, instance, <设备名>}
```

**配对技巧：方法论与其落地实践共享 `<主题>` 中段**，一眼可见同主题的两层：

```
方法论(public)                  落地实践(private)
nucleus-secondbrain-catalog  ↔  harold-secondbrain-vault
nucleus-governance           ↔  harold-governance         （如有私有治理实例）
nucleus-tools-trendradar     ↔  harold-tools-<x>
```

## 铁律

1. **`harold-*`（及任何 `<人名>-*`）永远私有**——含 PII（家庭/健康/财务等域），禁止进入 public git。
2. **只有 `nucleus-*` 可转 public**，且转前必须确认无内部路径、凭据、隐私引用。
3. 方法论沉淀到 `nucleus-*`，实践数据留在 `<人名>-*`；同一能力的两层互相引用、不混仓。

## 当前家族实例

| 仓 | 品牌 | 角色 | 可见性 |
|---|---|---|---|
| `nucleus-secondbrain-catalog` | nucleus | 货架规则 skill + `framework/` 脚手架 | 可公开 |
| `nucleus-governance` | nucleus | PDCA 治理框架 | 可公开 |
| `harold-secondbrain-vault` | harold | SecondBrain 个人实例（货架骨架元数据） | 私有 |
