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



