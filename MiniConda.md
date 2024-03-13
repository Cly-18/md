# MiniConda

## 1. 换源

```powershell
#设置清华源
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/bioconda 
conda config --set show_channel_urls yes
conda config --show
```

## 2. 更换env

```powershell
#改变下载位置
conda config --add envs_dirs #dirpath#
conda env list
```

## 3. init

```powershell
#C:\Users\12183\Documents\WindowsPowerShell\profile.ps1
#启动时加载命令
set-executionpolicy remotesigned#设置可执行脚本
#set-executionpolicy restricted  复原
```

## 4. 创建环境

```powershell
#创建名为的demo的python 3.9 环境
conda create --name demo python=3.9 -y
#激活
conda activate demo
#退出
conda deactivate
#移除
conda env remove -n demo
#设置默认环境
conda config --set env_prompt  tensorflow
```

