---
title: Use android phone as USB webcam for OBS
layout: default
---

There are two common known programs to use your android phone as a webcam. The first one is [DroidCam](https://www.dev47apps.com/), the other one is [IP Webcam](https://play.google.com/store/apps/details?id=com.pas.webcam&hl=en). DroidCam offers the option to use it over USB, but is limited in the supported options. IP Webcam does only support connections over IP (which equals to WiFi for most smartphones). 

The problem with WiFi might be a laggy video feed, when the connection is not very good.

So wouldn't it be nice to use IP Webcam over a USB connection? The idea is to use adb.exe to forward the port of IP Webcam (normally 8080) to your computer.

## HowTo

Okay, so here is a step by step guide:

1. Enable Developer Mode on your phone and **enabled USB debugging**. There are a lot of tutorials to do this. For example, follow [this one](https://www.howtogeek.com/129728/how-to-access-the-developer-options-menu-and-enable-usb-debugging-on-android-4.2/).
![](/assets/2020-04-05/usbDebugging.jpg)
0. **Get adb.exe**. To get it, you can download the SDK platform tools for windows from [here](https://developer.android.com/studio/releases/platform-tools). From that zip you only need adb.exe, AdbWinApi.dll and AdbWinUsbApi.dll. Copy the files in a new directory.
0. In IP Webcam just scroll down and click on **start server**. In the new screen you will see a port number right after your IP-Address (like 192.168.178.24:*8080*).
0. **Open a terminal** in the new directory by holding Shift and right click and click on "Open PowerShell Here".
0. Type the following command `.\adb.exe forward tcp:8081 tcp:8080` to forward the port 8080 from the phone to your computer to port 8081.
![](/assets/2020-04-05/adbForward.jpg)
0. In OBS **add a browser source** and set the following URL: `http://localhost:8081/videofeed`.


## Multiple Webcams
You need multiple webcams and have multiple phones? Follow the steps from above, but when you forward the port, you need to specify  the device. You can get all devices to your computer with the command `adb.exe devices -l`. Now copy the device identifier (something like BH4023468D) and use it in the forwarding command like this: `.\adb.exe -s BH4023468D forward tcp:8081 tcp:8080`. For the next phone, replace *8081* with 8082, 8083, ... and use the new port in another browser source in OBS.


