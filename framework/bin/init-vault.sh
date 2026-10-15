#!/usr/bin/env bash
# init-vault.sh —— 从 blueprint 一键初始化新的 SecondBrain 货架库。
# 幂等：已存在的文件/目录一律不覆盖。须在 nucleus-secondbrain-catalog 检出内运行。
# 用法: framework/bin/init-vault.sh <目标目录>
set -euo pipefail

SRC_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
BLUEPRINT="$SRC_ROOT/blueprint"
FRAMEWORK="$SRC_ROOT/framework"
TARGET="${1:?用法: init-vault.sh <目标目录>}"

[ -d "$BLUEPRINT" ] && [ -d "$FRAMEWORK/bin" ] || {
  echo "错误：找不到 blueprint/ 或 framework/bin/（请在 catalog 仓检出内运行本脚本）" >&2
  exit 2
}

mkdir -p "$TARGET"
TARGET="$(cd "$TARGET" && pwd)"

echo "== 1/6 复制空货架 blueprint/ → ${TARGET}（不覆盖已有）=="
rsync -a --ignore-existing --exclude 'README.md' "$BLUEPRINT/" "$TARGET/"

echo "== 2/6 安装白名单 .gitignore =="
if [ -f "$TARGET/.gitignore" ]; then
  echo "已存在，跳过"
else
  cp "$FRAMEWORK/gitignore.template" "$TARGET/.gitignore"
fi

echo "== 3/6 安装检索可见性 .ignore =="
if [ -f "$TARGET/.ignore" ]; then
  echo "已存在，跳过"
else
  cp "$FRAMEWORK/ignore.template" "$TARGET/.ignore"
fi

echo "== 4/6 安装维护脚本与命名规范 =="
mkdir -p "$TARGET/bin"
for s in refresh-structure.sh scaffold-guides.sh validate-structure.sh; do
  if [ -f "$TARGET/bin/$s" ]; then
    echo "bin/$s 已存在，跳过"
  else
    cp "$FRAMEWORK/bin/$s" "$TARGET/bin/$s" && chmod +x "$TARGET/bin/$s"
  fi
done
if [ -f "$TARGET/00-system/02-governance/naming.md" ]; then
  echo "naming.md 已存在，跳过"
else
  cp "$FRAMEWORK/naming.template.md" "$TARGET/00-system/02-governance/naming.md"
fi

echo "== 5/6 铺 L2 _guide.md + 生成 STRUCTURE.md =="
(cd "$TARGET" && bin/scaffold-guides.sh && bin/refresh-structure.sh 3)

echo "== 6/6 结构校验（O1）=="
(cd "$TARGET" && bin/validate-structure.sh . 3)

cat <<'EOF'

下一步（手动执行；永不 `git add -A`）：
  cd <目标目录>
  git init
  git add .gitignore .ignore STRUCTURE.md bin/*.sh
  git add 00-system/02-governance/naming.md
  find . \( -name _guide.md -o -name .gitkeep \) -not -path '*/.git/*' -print0 | xargs -0 git add
  git commit -m "chore: 初始化货架仓库"

提醒：
  - blueprint 中的占位货架（01-child / 01-parent / 01-business-or-org / PROJECT-ID_* 等）
    请改名为你自己的语义名，或删掉暂不需要的（按需创建，不铺空壳）。
  - .ignore 与 .gitignore 必须成对保留：前者管检索可见性，后者管 git 跟踪范围。
    删掉 .ignore 会让「尊重 ignore 文件的检索工具」在库内失明（只能看见骨架文件）。
  - PII 域（10-family / 30-health / 60-finance）禁提交任何公共 git（O6）。
EOF
