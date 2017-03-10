---
title: WiPy without expansion board
tags: [wipy, python, diy, electronics]
---

I bought a WiPy 2.0 from pycom and noticed, that the documentation assumes you also bought the expansion board (which I didn't). The board has some components but most of them are for the SD card support or the LiPo charger. An (older?) version of the board is documented [here](https://github.com/wipy/wipy/tree/master/hardware/ExpansionBoard-v1.2).
What you really need is only some sort of power supply and a USB serial (3.3V). The pinout of the WiPy board is [here](https://docs.pycom.io/pycom_esp32/pycom_esp32/datasheets.html#pinout)

![](/assets/2017-03-10/wiring.jpg)

I connected a spare ESP8266 programmer to the RX and TX ports and used another USB port for the 5V supply. You can also power the board with 3.3V via the 3.3V pin, but you need at least 500mA ([more info](https://docs.pycom.io/pycom_esp32/pycom_esp32/datasheets.html#powering-by-an-external-power-source)).
