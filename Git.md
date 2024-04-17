# Git

## 1. 设置用户信息

```shell
 git config --global user.name "name"
 git config --global user.email "email"
 git config --list
```

## 2. 仓库

```shell
#生成密钥
ssh-keygen -t rsa 
#获取公钥
cat id_rsa.pub
#进入github添加公钥  测试是否成功
ssh -T git@github.com
#===================
echo "# Qt_OpenCV-practice" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin "path"
git push -u origin main
```

## 3.拉取

```shell
# 会自动合并本地分支
git pull
# or
git fetch origin master:tmp 
#在本地新建一个temp分支，并将远程origin仓库的master分支代码下载到本地temp分支
git diff tmp 
#来比较本地代码与刚刚从远程下载下来的代码的区别
git merge tmp
#合并temp分支到本地的master分支
git branch -d temp
#如果不想保留temp分支 可以用这步删除
```





