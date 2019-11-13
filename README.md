# Jiaguomeng Assistor

> 使用 Python 和 ADB 工具实现的《家国梦》辅助脚本，能够自动收集金币、升级建筑、运输货物、点击商店中的红包和相册。本脚本中自带的配置文件仅用于分辨率为 1080P 的设备。


- [x] 自动检测货物的目的地；
- [x] 自动检测新的红包或相册；
- [x] 点击红包或相册时，自动选择目标；
- [ ] 自动升级政策；
- [ ] 升级建筑时，检测升级的反馈信息，若已经没有金钱则立即停止点击。

## 运行

### 常规版

> 在电脑上运行 Python 脚本，手机连接电脑或是使用安卓模拟器。

1. 配置 Python3 环境；
2. 配置 ADB 环境；
3. 安装 Git；
5. 连接设备（手机或安卓模拟器，若你的手机分辨率不是 1080P，请使用模拟器直接设定这个分辨率），确保`adb devices`能正确显示；
6. `git clone --depth 1 https://github.com/yusanshi/Jiaguomeng_Assist`；
6. `cd Jiaguomeng_Assist`；
7. `python main.py`运行主程序（自行使用 Pip 安装缺失的 module）。

### 脱离电脑版

> 只用手机，脱离电脑（即在手机上让该脚本在后台运行、游戏在前台运行）。~~需要 root 环境~~。

基本思路：使用 Termux 运行脚本，在 Termux 中配置好 Python、~~OpenCV~~、Pillow、ADB 等（由于 Termux 上安装 OpenCV 这个过程太艰难，我放弃了。故我把程序简单改了一下，不再使用 OpenCV，而是只用 Pillow）。

#### 安装并打开 Termux

略

#### 配置 Termux

```
# Install ADB
pkg install wget && wget https://github.com/MasterDevX/Termux-ADB/raw/master/InstallTools.sh && bash InstallTools.sh

pkg install python git
pkg install clang libjpeg-turbo # are used to install Pillow
pip install Pillow numpy

git clone --depth 1 https://github.com/yusanshi/Jiaguomeng_Assist
cd Jiaguomeng_Assist
```

#### 开启 ADB over network

##### 方案一（需要 root）

```
su # need root here
sh adb_tcp.sh
exit
```

##### 方案二（不需要 root）

Settings → Developer options → Debugging → Enable Android debugging and ADB over network

#### ADB 连接本机

```
adb connect localhost:5555 # Touch "allow" if this is a dialog.
adb devices # Make sure localhost is in list and is the only one.
```

#### 运行程序

```
python main.py --off_PC=True
```

#### 关闭 ADB over network（可选）

##### 方案一（需要 root）

```
# After ending manually (switch to Termux and "Ctrl + C")
su
sh adb_usb.sh
exit
```

##### 方案二（不需要 root）

Settings → Developer options → Debugging → Disable ADB over network

## 示例

常规版，使用了夜神模拟器，设置了竖屏显示、分辨率 1080P。游戏版本 V1.2.3。

终端输出：

```
C:\Users\Yu\Documents\GitHub\Jiaguomeng_Assist>python main.py
Successfully navigated to building window.

Begin collecting money.

Begin upgrading building.

Try transporting goods.

Original green channel:  [145, 119, 151, 143, 136, 141, 130, 138, 152]
Current green channel:   [153, 120, 150, 143, 136, 141, 127, 137, 153]
Zero or multiple available targets found for cargo 1. Abandoned.

Original green channel:  [145, 119, 151, 143, 136, 141, 130, 138, 152]
Current green channel:   [153, 121, 151, 141, 134, 140, 130, 137, 153]
Zero or multiple available targets found for cargo 2. Abandoned.

Original green channel:  [145, 119, 151, 143, 136, 141, 130, 138, 152]
Current green channel:   [145, 117, 151, 141, 136, 141, 130, 138, 153]
Zero or multiple available targets found for cargo 3. Abandoned.

Policy available. Begin updating policy.
In developing...

No new hongbao or album found.

Cycle 1 finished. Sleep for some time to start new cycle.

Successfully navigated to building window.

Begin collecting money.

Begin upgrading building.

Try transporting goods.

Original green channel:  [144, 119, 150, 143, 135, 142, 130, 138, 153]
Current green channel:   [152, 121, 150, 143, 137, 142, 130, 137, 153]
Zero or multiple available targets found for cargo 1. Abandoned.

Original green channel:  [144, 119, 150, 143, 135, 142, 130, 138, 153]
Current green channel:   [145, 119, 150, 142, 137, 142, 127, 136, 152]
Zero or multiple available targets found for cargo 2. Abandoned.

Original green channel:  [144, 119, 150, 143, 135, 142, 130, 138, 153]
Current green channel:   [145, 119, 151, 143, 136, 141, 130, 138, 153]
Zero or multiple available targets found for cargo 3. Abandoned.

Policy available. Begin updating policy.
In developing...

No new hongbao or album found.

Cycle 2 finished. Sleep for some time to start new cycle.

Successfully navigated to building window.

Begin collecting money.

Begin upgrading building.

Try transporting goods.

Original green channel:  [145, 118, 151, 142, 139, 141, 130, 137, 153]
Current green channel:   [152, 121, 151, 142, 137, 141, 130, 136, 152]
Zero or multiple available targets found for cargo 1. Abandoned.

Original green channel:  [145, 118, 151, 142, 139, 141, 130, 137, 153]
Current green channel:   [145, 119, 150, 143, 132, 140, 130, 136, 152]
Zero or multiple available targets found for cargo 2. Abandoned.

Original green channel:  [145, 118, 151, 142, 139, 141, 130, 137, 153]
Current green channel:   [145, 119, 151, 140, 137, 141, 129, 137, 153]
Zero or multiple available targets found for cargo 3. Abandoned.

Policy available. Begin updating policy.
In developing...

No new hongbao or album found.

Cycle 3 finished. Sleep for some time to start new cycle.

......
```

演示文件过大，故用了外链，[点击下载](https://yusanshi.com/jgm.gif)。
