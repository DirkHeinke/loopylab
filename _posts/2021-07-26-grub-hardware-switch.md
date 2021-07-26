---
title: A hardware switch for grub
layout: default
tags:
- linux
- electronics
- diy
---

After years of running dual boot systems and always waiting for grub to load and select the desired OS, I finally built a hardware switch to select the OS. You can use the `SAVEDEFAULT` option in GRUB to remember the last choice and booting from Linux to Windows might work with `grub-reboot X`. But I was looking for an option which allows me to select the system for the next boot, then turn on my pc and walk away.

Recently I stumbled upon [this hackaday post](https://hackaday.io/project/179539-hardware-boot-selection-switch) where Stephen used a microcontroller to serve a dynamic file which is read by grub. In the comments Stephen wrote: "You can achieve this pretty simply by switching power to a flash drive and checking for the presence of that volume UUID [...]" and that's what I have done.

WARNING: If you don't know how to recover from a broken grub, do not mess with the config.

![](/assets/2021-07-26/full.jpg)

A USB B port soldered to a USB A port with a switch on the VCC.

![](/assets/2021-07-26/back.jpg)

I added an old 512MB USB stick and a quickly printed case

![](/assets/2021-07-26/case.jpg)

To the software part:
- format the stick as fat32
- get and copy the uuid (`sudo blkid` it should be something like XXXX-XXXX)
- modify a file in `/etc/grub.d/` to add the following lines to the generated grub file:

```
search --no-floppy --fs-uuid --set=LinuxUSB XXXX-XXXX

if [ "\${LinuxUSB}" ] ; then
  set default="0"
else
  set default="2"
fi
```

- update grub with `sudo grub-mkconfig -o /boot/grub/grub.cfg`

Grub will now boot entry 0, if the stick is connected, entry 2 otherwise. You don't need the hardware switch, you can also just plug and unplug the stick.


While writing this post, I also found [this project](https://github.com/rw-hsma-fpga/grub-switch/), which looks way more flexible.