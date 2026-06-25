#!/usr/bin/env bash
# 为缺失 _guide.md 的 L2 子域批量生成「货架骨架」占位文件（幂等，不覆盖已存在文件）。
# 用法: bin/scaffold-guides.sh        # 实际生成
#       bin/scaffold-guides.sh --dry  # 仅预览将创建哪些文件
set -euo pipefail
cd "$(dirname "$0")/.."

DRY=0; [ "${1:-}" = "--dry" ] && DRY=1
created=0

find . -mindepth 2 -maxdepth 2 -type d \
  -not -path '*/.git*' -not -path '*/.obsidian*' -not -path '*/.workbuddy*' -not -path '*/.claude*' \
  -not -path './A0-agents/*' \
  -not -path './80-projects/05-github/*' \
  -not -path './C0-archive/*' \
  -not -path './00-system/02-governance/*' \
  -not -path './00-system/03-ops/*' \
  2>/dev/null | sort | while read -r d; do
    f="$d/_guide.md"
    [ -f "$f" ] && continue
    name="$(basename "$d")"
    parent="$(basename "$(dirname "$d")")"
    if [ "$DRY" = "1" ]; then
      echo "将创建: $f"
      continue
    fi
    cat > "$f" <<EOF
# ${name} · 子域指南

> 所属域：\`${parent}\` ｜ 层级：L2 ｜ 状态：🚧 待完善

## 范围（Scope）

<!-- TODO: 这个子域收纳什么内容？边界在哪？ -->

## 导航（Navigation）

<!-- TODO: 列出主要下级目录 / 关键文件，作为 MOC 入口 -->

## 约定（Conventions）

- 命名遵循 \`00-system/02-governance/naming.md\`：\`[日期]_[类型]_[描述]_[状态].ext\`
- 新增内容前先读本指南；不确定归属时先进 \`00-system/01-inbox\`
EOF
    echo "已创建: $f"
    created=$((created+1))
done

echo "完成。"
