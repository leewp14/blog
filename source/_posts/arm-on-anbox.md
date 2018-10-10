---
title: Anbox上运行arm软件 (houdini)
tags:
  - android
  - linux
  - arm emulation
  - houdini
  - 电击文库
autoplay: false
date: 2018-10-10 18:54:21
mp3:
cover: https://i.loli.net/2018/10/10/5bbdf916dcd4a.jpg
---

起初死都要用nouveau驱动，其中原因就是使到Anbox可以正常运行：3

理所当然的，Anbox没有内置houdini翻译器，所以自然而然只能接受能够适配x86手机的软件。

不过这不是绝路，Anbox有rootfs-overlay的功能，所以修改Anbox系统文件并不是问题啦，简直就跟喝水没两样！ ：）

> https://docs.anbox.io/userguide/advanced/rootfs_overlay.html
> https://zhsj.me/blog/view/anbox-and-houdini

其实真的很简单，上面zhsj的步骤是通过修改anbox的image的，也就是旧的方式。不过有了rootfs-overlay，只需将想过要添加或者修改的文件放置在 `/var/snap/anbox/common/rootfs-overlay` ，然后chmod等等（参见以上的网站），就完成啦！

至于如何知道到底有没有效，官方的检查方案是行不通的，因为你 `ls -al combined-rootfs` 一定没有东西的。我通过telegram group了解，只需 `adb shell` 然后通过 `ls` 或者 `cat` 等等检查是否用更动即可！

下面也分享一下在Anbox打手游——电击文库！

**Anbox上运行电击文库**
其实也没怎么样，有了houdini后安装qq并不是问题了（我的电击文库使用qq登录，djwk不必houdini也可以运行）。不过游戏登录就有点棘手，得在djwk登录qq时resize window变成电话的size才看得到授权djwk登录的按钮。

![](https://i.loli.net/2018/10/10/5bbde3071101a.png)

等等，还没说完哈哈，如果点击授权后djwk自动关闭或者卡着，就得开启anbox的software acceleration来启动anbox再登录了（详情参见 `adb logcat` )  登录成功后关闭anbox再关闭software acceleration才进去玩 就可以啦(*^__^*) 嘻嘻……

xorg-server的用户，如果放大djwk的window，titlebar会消失，滑鼠的click也不准确（参见 https://github.com/anbox/anbox/issues/928 )，可以spam `alt+f11` ，幸运的话titlebar就会出现哟 :33

大致上挺满意的，还蛮顺畅的哟！

![](https://i.loli.net/2018/10/10/5bbde313b75a2.png)
![](https://i.loli.net/2018/10/10/5bbde2f7e2461.png)
![](https://i.loli.net/2018/10/10/5bbde313e05f1.png)
![](https://i.loli.net/2018/10/10/5bbde30f81c37.png)
