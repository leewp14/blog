---
title: OpenWRT stable on TM/Unifi D-Link DIR-615 rev.G2
tags:
  - networking
  - openwrt
  - custom
autoplay: false
date: 2019-04-29 16:47:50
mp3:
cover: https://i.loli.net/2019/04/29/5cc6bd108ec07.jpeg
---

这po文主要会以英文呈现，因为含有技术性的东西用中文写好像挺麻烦的:3

This post is particularly written for Malaysians who are using Unifi since the early release of TM's Unifi as a FTTH service. 

Normally, for every Unifi users, you will receive a FTU (Fiber Termination Unit) and a minimum of Wireless-N Router. 

For early Unifi adoption users, you most likely should receive a white-orange coloured D-Link DIR-615 as your wireless router, which has a hardware revision `G2`. 

If you are looking for ways to further optimize your 'old' 'rubbish' 'shitty' DIR-615, this post is for you!

**Introduction**
TM/Unifi's D-Link DIR-615 rev.G2 is actually a DIR-620 rev.A1 . You can refer to the pictures below and maybe, you can compare with DIR-620 A1 teardown pictures on Google. Normally if you have a look at the chip you will know already, because the SoC chip, ROM and RAM chip is similar to DIR-620 A1. 

> https://openwrt.org/toh/d-link/dir-620
> https://wikidevi.com/wiki/D-Link_DIR-620_rev_A1

![DSC_0092.JPG](https://i.loli.net/2019/04/29/5cc6c28a4ce7e.jpg)
![DSC_0091.JPG](https://i.loli.net/2019/04/29/5cc6c29665e98.jpg)
![DSC_0089.JPG](https://i.loli.net/2019/04/29/5cc6c2ab8ece1.jpg)
![DSC_0090.JPG](https://i.loli.net/2019/04/29/5cc6c2a4cf588.jpg)
![DSC_0088.JPG](https://i.loli.net/2019/04/29/5cc6c2ad975db.jpg)
![DSC_0085.JPG](https://i.loli.net/2019/04/29/5cc6c2c4cde9c.jpg)
![DSC_0087.JPG](https://i.loli.net/2019/04/29/5cc6c2bda1966.jpg)
![DSC_0080.JPG](https://i.loli.net/2019/04/29/5cc6c299b8824.jpg)
![DSC_0081.JPG](https://i.loli.net/2019/04/29/5cc6c2b0d26b4.jpg)
![DSC_0078.JPG](https://i.loli.net/2019/04/29/5cc6c2ab49711.jpg)

**Flashing**
Oh dude, this is what makes me headache+laugh...

Simple googling shows that a lot of 'Malaysia Citizenssss' tell users to use the DIR-615 rev.D OpenWRT firmwares on their DIR-615 G2. 

No offense, they both use the same SoC, but come on dudes, 615 rev.D only has 4MB of flash!

I know, I know, yes it works, I already said no offense :3

OK, proceed to flashing. Now, please assume that your device is DIR-620 A1, to make things easier here xD

To flash you need to enter the Emergency flashing mode. According to DIR-620 OpenWRT wiki (link above), revision A1 does not have this feature while D1 has this feature. Since our 615 G2 has this feature, just follow the instructions for 615 D series over [here](https://openwrt.org/toh/d-link/dir-615#rev_d1_d2_d3_d4_d5), which is pretty straightforward. 

**Flashing Again**
Yes, you need to do another flashing! I confirmed that if you use the DIR-615 rev.D OpenWRT images, you only has 4MB of storage! Ridiculous lol xDD

So, the next thing we want to do is to flash this DIR-615 to DIR-620 A1. Download the latest OpenWRT image [here](http://downloads.openwrt.org/releases/18.06.1/targets/ramips/rt305x/openwrt-18.06.1-ramips-rt305x-dir-620-a1-squashfs-sysupgrade.bin) and flash from the LuCI interface. 

**Celebrate? Noooo, not yet, not so fast...**
Now you have your "rebranded" D-Link DIR-620 A1 **with 8MB of storage** instead of four :sunglasses:

![Screenshot_2019-04-29_18-14-33.png](https://i.loli.net/2019/04/29/5cc6ceac3d7c1.png)

Note: according to [this guy](https://www.leowkahman.com/2018/03/09/lede-on-unifi-d-link-dir-615-g2/), he only have 300kb free storage, which is pretty obvious because a few MBs are needed for the firmware. But for our case, we have nearly 4MB of free storage! (I installed quite a number of things already, so you should have roughly about 4.1MB or more out of the box actually)

![Screenshot_2019-04-29_18-17-10.png](https://i.loli.net/2019/04/29/5cc6cf397459e.png)

...which means, we can do much more things!

* ok, why we have 8MB instead of 4MB which other people has, is because we are using the **correct** firmware. 620 A1 is using 8MB flash, 615 Dx is using 4MB flash. So while 615 Dx firmwares is working on our 615 G2, we only use half of our flash storage which is 4MB out of 8MB as the firmware is configured for the 615 Dx 4MB flash, so you only have 300kb free storage out of the box instead. 

**標哥 OpenWRT Secret Recipie :3**
1. Because I'm going to college at other states soon, so I configured **DDNS/Dynamic DNS `luci-app-ddns	`** on this router. In case something happens, I can ssh into my router to help my family troubleshoot (if the internet connection is unaffected). I'm using [nsupdate](nsupdate.info) for the DDNS service (it's free!). 

2. Because I want to use SSH over public IP, thus I installed **`luci-ssl`** to ensure my connection to the router is always encrypted (always HTTPS when login into router). *NOTE: restart uhttpd after installation and wait 5-8 minutes before accessing your router again, because it needs some time to generate the HTTPS certificate

3. Because I'm not a Unifi user (I got this router from my dad's friend), so I have been searching for solutions to solve the slow download when upload problem, which exists on every copper line internet users (I'm currently using Streamyx 8MBPS). Which basically means, the internet download speed is so slow when something is being uploaded at the same time. So I found out something called **`luci-app-sqm`**. Basically this thing does QoS, but in a more efficient way. With this, I can now basically upload videos and watching youtube full HD simultaneously without any slowdowns at all. **SUPER EFFICIENT**
This is extremely useful for Streamyx users. Highly recommemded, satisfication guranteed. 

**Footer**
Nothing to say, this is quite an interesting one. Have been using this thing for months (previously my house is using the TrendNET TEW-431BRP), overall is very satisfied. That's all, feel free to contact me for any question at `lee.wp14@gmail.com`. Thanks for reading!
