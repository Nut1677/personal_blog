#!/bin/bash

# 设置分支名称（默认分支为 main，你可以根据需要修改为其他分支）
BRANCH_NAME="main"

# 设置远程仓库名称（默认远程仓库为 GitHub，你可以根据需要修改为其他远程仓库名称）
REMOTE_NAME_1="GitHub"
#REMOTE_NAME_2="Gitee"

# 提示用户输入提交信息，并附加当前日期和时间
read -p "Enter commit message: " COMMIT_MESSAGE 
COMMIT_MESSAGE="$COMMIT_MESSAGE _$(date +'%Y-%m-%d %H:%M:%S')"

# 检查当前目录是否在 Git 仓库中
if ! git rev-parse --git-dir > /dev/null 2>&1; then
  echo "Error: This script must be run inside a Git repository."
  echo "Please run this script from within a Git repository."
else
    # 添加所有更改的文件到暂存区
    git add .

    # 检查是否有更改
    if ! git diff-index --quiet HEAD --; then
        # 提交更改
        git commit -m "$COMMIT_MESSAGE"
        echo "Commit successful: $COMMIT_MESSAGE"

        # 推送到指定分支
        git push $REMOTE_NAME_1 $BRANCH_NAME
        #git push $REMOTE_NAME_2 $BRANCH_NAME

        echo "Push successful to branch $BRANCH_NAME"
    else
        echo "No changes to commit."    
    fi
fi

read -p "Press any key to exit..." -n 1 -s
