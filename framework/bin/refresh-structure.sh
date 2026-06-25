#!/usr/bin/env bash
# 重新生成 STRUCTURE.md —— SecondBrain 目录骨架快照
# 用法: bin/refresh-structure.sh [最大层数，默认 3]
set -euo pipefail
cd "$(dirname "$0")/.."

DEPTH="${1:-3}"
OUT="STRUCTURE.md"

{
  echo "# SecondBrain 目录骨架快照"
  echo ""
  echo "> 由 \`bin/refresh-structure.sh\` 生成，仅反映高层组织结构（L1–L${DEPTH}），不含内容正文。"
  echo "> 生成时间：$(date '+%Y-%m-%d')"
  echo ""
  echo '```'
  find . -maxdepth "$DEPTH" -type d \
    -not -path '*/.git*' -not -path '*/.obsidian*' -not -path '*/.workbuddy*' -not -path '*/.claude*' \
    -not -path './A0-agents/workspaces/*' -not -path './80-projects/05-github/*' \
    2>/dev/null | sort | sed 's|^\./||; s|[^/]*/|  |g'
  echo '```'
} > "$OUT"

echo "已更新 $OUT（深度 L1–L${DEPTH}，$(grep -c '' "$OUT") 行）"
