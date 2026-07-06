#!/usr/bin/env bash
# validate-structure.sh —— 货架治理层校验器：O1「建前校验闸」的可执行形态。
# 校验 R1（NN-名 + 封闭例外清单）、R5（记法/ASCII）、垃圾抽屉、O6（PII 域入 git 索引）。
# 包裹（内嵌 git 仓、A0/D0 之下、_ 开头目录）内部自治，不校验。
# 用法: bin/validate-structure.sh [根目录，默认 .] [最大治理深度，默认 3]
# 环境: SECOND_BRAIN_VALIDATE_EXCLUDES 冒号分隔的 find -path 排除模式
set -uo pipefail

ROOT="${1:-.}"
DEPTH="${2:-3}"
cd "$ROOT" || exit 2

errors=0
warnings=0

err()  { echo "✗ $1"; errors=$((errors+1)); }
warn() { echo "⚠ $1"; warnings=$((warnings+1)); }

IFS=':' read -r -a EXTRA_EXCLUDES <<< "${SECOND_BRAIN_VALIDATE_EXCLUDES:-}"
FIND_EXCLUDES=(
  -not -path '*/.*'
  -not -path '*/node_modules*'
)
for pattern in ${EXTRA_EXCLUDES[@]+"${EXTRA_EXCLUDES[@]}"}; do
  [ -n "$pattern" ] && FIND_EXCLUDES+=(-not -path "$pattern")
done

# 已识别的包裹前缀（内嵌 git 仓）；子树全部跳过
pkg_prefixes=()
is_under_pkg() {
  local p="$1" pre
  for pre in ${pkg_prefixes[@]+"${pkg_prefixes[@]}"}; do
    case "$p" in "$pre"/*) return 0 ;; esac
  done
  return 1
}

while IFS= read -r d; do
  rel="${d#./}"
  base="${rel##*/}"

  # R1 例外②：_ 开头 = 元文件/辅助目录（含其子树）
  case "$rel" in _*|*/_*) continue ;; esac

  # 包裹子树内部自治
  is_under_pkg "$rel" && continue

  # 内嵌 git 仓 = 包裹（R2）：包裹名不受 R1 约束，子树跳过
  if [ -e "$d/.git" ]; then
    pkg_prefixes+=("$rel")
    continue
  fi

  # A0/D0 的 L3 及以下 = 包裹/软件现场，跳过
  case "$rel" in A0-agents/*/*|D0-notes/*/*) continue ;; esac

  # 功能层 overlay（R2：永远是包裹内部，不可能是治理层）——含其子树
  case "$base" in 1_raw|2_work|3_wiki|4_output) pkg_prefixes+=("$rel"); continue ;; esac

  # 根级工具目录（框架自带）
  case "$rel" in bin) continue ;; esac

  ok=0
  reason=""

  # R1 例外①：4 位年份货架
  if [[ "$base" =~ ^(19|20)[0-9]{2}$ ]]; then
    ok=1
  fi

  # R1 例外③：元层/现场域的语义 L2（封闭清单）
  if [ "$ok" = 0 ]; then
    case "$rel" in
      A0-agents/platforms|A0-agents/workspaces|A0-agents/runtime) ok=1 ;;
      A0-agents/*) reason="[R1] A0-agents 的语义 L2 仅限 platforms/workspaces/runtime" ;;
      D0-notes/*)
        if [[ "$base" =~ ^[a-z][a-z0-9._-]*$ ]]; then ok=1
        else reason="[R1] D0-notes 的 L2 应为软件名（小写语义名）"; fi ;;
    esac
  fi

  # 标准治理层名 NN-描述名
  if [ "$ok" = 0 ] && [ -z "$reason" ] && [[ "$base" =~ ^[0-9A-Z][0-9A-Z]-. ]]; then
    ok=1
  fi

  if [ "$ok" = 0 ]; then
    if [ -z "$reason" ]; then
      if [[ "$base" =~ ^[0-9a-z][0-9a-z]- ]]; then
        reason="[R5] 编号含小写字母（base36 须大写）"
      elif [[ "$base" =~ ^[0-9][0-9]$ ]]; then
        reason="[R5] 年份须固定 4 位"
      else
        reason="[R1] 治理层名须为 NN-描述名"
      fi
    fi
    err "$reason: $rel"
    continue
  fi

  # 七规则③：禁垃圾抽屉（仅匹配整个描述名，避免误伤如「其他副业」）
  desc="${base#??-}"
  case "$(printf '%s' "$desc" | tr '[:upper:]' '[:lower:]')" in
    misc|other|others|其他|杂项|temp|tmp)
      err "[七规则③] 疑似垃圾抽屉（应进 01-inbox 分诊）: $rel" ;;
  esac

  # R5 补充：项目口治理层一律 ASCII
  case "$rel" in
    80-*|80-*/*)
      if ! LC_ALL=C bash -c '[[ "$1" =~ ^[\ -~]+$ ]]' _ "$base"; then
        err "[R5] 80-projects 治理层须为纯 ASCII: $rel"
      fi ;;
  esac
done < <(find . -mindepth 1 -maxdepth "$DEPTH" -type d "${FIND_EXCLUDES[@]}" 2>/dev/null | sort)

# O6：PII 域出现在 git 索引（私有加密仓自担；公共仓必须为零）。
# 货架元文件（.gitkeep/_guide.md/_index.md）是骨架仓的合法跟踪对象，不算 PII 内容。
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  pii_files="$(git -c core.quotePath=false ls-files -- 10-family 30-health 60-finance 2>/dev/null \
    | grep -v -e '/\.gitkeep$' -e '/_guide\.md$' -e '/_index\.md$' || true)"
  if [ -n "$pii_files" ]; then
    pii_count="$(printf '%s\n' "$pii_files" | wc -l | tr -d ' ')"
    warn "[O6] PII 域有 $pii_count 个内容文件在 git 索引中（10-family/30-health/60-finance）——若本仓为公共仓，必须移除"
    printf '%s\n' "$pii_files" | head -5 | sed 's/^/    /'
  fi
fi

echo "----"
echo "校验完成：$errors 处违规，$warnings 处警告。"
[ "$errors" -gt 0 ] && exit 1
exit 0
