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

