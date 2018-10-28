# xfce-my-ip

Script for [xfce4-genmon-plugin](https://github.com/xfce-mirror/xfce4-genmon-plugin) that regularly checks your internet connection by requesting your public IP to a third-party service. When the script is triggered by genmon, the public IP returned if any is displayed on the panel.

The last time the connection status changed is logged and can be checked in the tooltip. Particularly useful if you are suspicious you are getting microcuts from your ISP.

![](https://user-images.githubusercontent.com/752025/47610699-2062ea80-da5c-11e8-9f96-643f7bf0c873.png)

![](https://user-images.githubusercontent.com/752025/47610703-2b1d7f80-da5c-11e8-9011-a807f8b78caf.png)

![](https://user-images.githubusercontent.com/752025/47610704-340e5100-da5c-11e8-88f9-4c9df9b41c9f.png)

Inspired and few bits taken from [parantapa/pomodoro](https://github.com/parantapa/pomodoro). The guidelines for installation have also been borrowed from its readme with slight modifications.

## Installation

If you are using XFCE along with any APT based distro you can try cloning the repository and run [```install.sh```](https://github.com/jmisasa/xfce-my-ip/blob/master/install.sh). The script should perform the whole process described below, setting up a check period of 60 seconds.

1) Download the project or clone this repository.
2) Install xfce4-genmon-plugin: `$ apt-get install xfce4-genmon-plugin`
3) Right click on your XFCE panel, go to **Panel > Add New Items...**
4) Search for **Generic Monitor**, and select it
5) Right click on the newly added monitor in panel, and select **Properties**
6) In the window that pops up, enter the path to `xfce-my-ip.sh` in **Command** field
7) Uncheck **Label**
8) Set period in seconds, this will determine how often the request is sent.

## Resources used

* [xfce4-genmon-plugin](https://goodies.xfce.org/projects/panel-plugins/xfce4-genmon-plugin)
* [ipify service](https://www.ipify.org)
* Icons have been downloaded from iconsdb.com: [ok icon](https://www.iconsdb.com/green-icons/circle-icon.html) and [down icon](https://www.iconsdb.com/red-icons/circle-icon.html)
