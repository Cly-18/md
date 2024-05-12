# Linux常用操作

## 图形界面root登录

```shell
vim /etc/gdm3/custom.conf
#添加
AllowRoot=true

vim /etc/pam.d/gdm-password
#注释掉第三行
# auth  required        pam_succeed_if.so user != root quiet_success
```

## 配置vncserver

```shell
#安装vnc
apt install tigervnc-standalone-server
#安装桌面
apt-get install gnome-panel
#设置密码
vncpasswd
#~/.vnc目录下新建xstartup
vim xstartup
############################  输入以下内容
#!/bin/sh
export XKL_XMODMAP_DISABLE=1
export XDG_CURRENT_DESKTOP="GNOME-Flashback:GNOME"
export XDG_MENU_PREFIX="gnome-flashback-"
gnome-session --session=gnome-flashback-metacity --disable-acceleration-check
#############################
#启动vnc
vncserver -localhost no
#关闭会话
vncserver -kill :*
```

## 配置程序自启动

```shell
```

## 中文输入法

```shell
# 中文包
sudo apt-get install language-pack-zh-hans
# 设置区域
sudo dpkg-reconfigure locales
# 中文输入法
sudo apt-get install ibus ibus-pinyin


# 配置环境变量
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus


```

## 临时修改DNS

```shell
vi /etc/resolv.conf
nameserver 8.8.8.8
```

# apt

```shell
# 证书
Certificate verification failed: The certificate is NOT trusted. The certificate issuer is unknown.  Could not handshake: Error in the certificate verification. [IP: 23.45.12.48 443]

sudo apt-get install --reinstall ca-certificates
sudo update-ca-certificates
```


