#!/bin/bash
# GitHub Trending 自动同步脚本

REPO_DIR="/root/.openclaw/workspace-analystopensource/github-trending-daily"
SOURCE_DIR="/root/.openclaw/workspace-analystopensource/github-trending"
TODAY=$(date +%Y-%m-%d)

cd $REPO_DIR

# 复制今天的报告
if [ -f "$SOURCE_DIR/$TODAY.md" ]; then
    cp "$SOURCE_DIR/$TODAY.md" reports/
    echo "✅ 已复制报告: $TODAY.md"
else
    echo "⚠️ 未找到报告: $SOURCE_DIR/$TODAY.md"
    exit 1
fi

# Git 提交
git add reports/$TODAY.md
git commit -m "📊 添加 $TODAY 热门项目报告" || echo "无变更需要提交"

# 推送到 GitHub
git push origin main || git push origin master

echo "✅ 已同步到 GitHub"
