---
title: Nouveau驱动卡住啦 :(
tags:
  - linux
  - nouveau
  - troubleshooting
autoplay: false
date: 2018-10-04 17:04:01
mp3:
cover: https://i.loli.net/2018/10/04/5bb5e10b2bace.jpeg
---

![](https://i.loli.net/2018/10/04/5bb5d6d8d01a8.jpg)

又是烦人的一天，电脑用没多久就卡住了。通过nouveau驱动运行Nvidia gpu，一直以来（至今）都有时常卡住的问题。

我自行上网查看后，总算可以做出一个简单的解决方案总结：

1. **在Chrome关掉gpu acceleration**
  很多遇到这个问题的人都是使用chrome/chromium时发生的，主要因为nouveau的3d acceleration不是很好。
  关闭了以后看视频肯定是会卡的喔 :3

2. **在kernel cmd line设置 `nouveau.noaccel=1`**
  这个就关闭了3d acceleration，也是很多人不想要的，因为卡到半死
  至于有些人说设置`nouveau.nofbaccel=1`，个人测试了是跟普通没两样，没有什么变化，也没有解决到问题。

3. **在kernel cmd line设置 `nouveau.modeset=1`**
  其实照理来讲设置这个是没有用的，modeset=1是代表启用nouveau驱动。不过有个macbook用户运行archlinux的说他设置这个后就没再卡了。我试过了但是无效。

4. **换到回nvidia官方驱动**
  这个应该是最实用的方案了。不过可能会弄乱gl libraries，导致有些程序无法正常运行，如Anbox和Steam。


这么刚巧我的电脑就只有Nvidia的显示卡，没有intel内置的。所以的确有点麻烦，而且就是很耗电，一般充满一次只能用大约两小时（新的电池）
回想起我的同班同学跟我说过他不用linux的其中原因是因为设置驱动很麻烦，想了想嗯嗯...其实没错哈哈

今天我就试着上方的第一个方案，看可以耐多久没卡。如果还卡的话就没办法得装到回官方驱动了
