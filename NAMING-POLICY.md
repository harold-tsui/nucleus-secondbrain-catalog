# 命名策略（指针）

> ⚠️ **本文已升级并迁移。** 跨家族的权威命名标准现位于 NUCLEUS 治理层：
> `nucleus-governance-spec / 仓库家族治理规范`（active）。本文仅保留 secondbrain 相关切片。

## 权威标准

仓库命名遵循 **三轴模型** `<家族>-<主题>-<制品>`：

- **家族**：表示方法论、组织或个人的归属边界；public 文档不得暴露私有实例的真实家族名。
- **层级**：方法论（`-catalog/-framework/-spec/-governance/-template/-method`） vs 实践（`-vault/-instance/-<项目>`）
- **可见性**：由内容裁定（PII / 商业 IP / 凭据 → private），**不由家族决定**

完整定义（继承关系、可见性矩阵、反哺机制、落位现状）见权威规范。

## 本主题（secondbrain）的 public 落位

| 仓 | 家族·层级 | 可见性 |
|---|---|---|
| `nucleus-secondbrain-catalog`（本仓） | nucleus · 方法论（规则 + 框架） | public |
| `{private-owner}-secondbrain-vault` | 私有归属 · 实践（个人/组织实例） | private |

> Public 方法论只保留抽象占位符；私有 owner、业务线、项目名、人格名、运行时名一律留在 private 实例中。
