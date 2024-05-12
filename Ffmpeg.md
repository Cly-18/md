# FFmpeg

## 安装

```shell
sudo apt-get install libavcodec-dev libavformat-dev libavdevice-dev libavfilter-dev libswscale-dev libswresample-dev
```

## 模块

| 包            | 用法                                                         |
| :------------ | :----------------------------------------------------------- |
| libavformat   | 用于各种音视频封装格式的生成和解析，包括获取解码所需信息以生成解码上下文结构。 |
| libavcodec    | 用于各种类型音视频编解码。                                   |
| libavutil     | 包含一些公共的工具函数。                                     |
| libswscale    | 用于视频场景比例缩放、色彩映射转换等。                       |
| libpostproc   | 用于后期效果处理等。                                         |
| libswresample | 提供音频重采样功能，包括采样频率、声道 格式等。              |
| libavfilter   | 用于滤波器处理，如音视频倍速、水平翻转、叠加文字等功能。     |
| libavdevice   | 包含输入／输出设备的库，实现音视频数据的抓取或渲染。         |

