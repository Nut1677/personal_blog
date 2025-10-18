
# 设置分支名称
BRANCH_NAME="main"

# 设置提交信息
read -p "COMMIT_MESSAGE:" COMMIT_MESSAGE 
COMMIT_MESSAGE="$COMMIT_MESSAGE _$(date +'%Y-%m-%d %H:%M:%S')"

# 检查是否在 Git 仓库中
if ! git rev-parse --git-dir > /dev/null 2>&1; then
  echo "Error: This script must be run inside a Git repository."
else
    # 添加所有更改的文件
    git add .
    # 检查是否有更改
    if ! git diff-index --quiet HEAD --; then
        # 提交更改
        git commit -m "$COMMIT_MESSAGE"
        echo "Commit successful: $COMMIT_MESSAGE"

        # 推送到指定分支
        git push origin $BRANCH_NAME

        echo "Push successful to branch $BRANCH_NAME"
    else
        echo "No changes to commit."    
    fi
fi

read