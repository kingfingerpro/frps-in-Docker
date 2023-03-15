# Frps in Docker

> 基于 [fatedier/frp](https://github.com/fatedier/frp/releases) 自动构建 `Docker` 镜像

## 启动容器

```bash
docker run -it \
  --name=frps \
  --network host \
  -v '/path/to/dir':/frps \
  --restart=always \
  -d kingfingerpro/frps
```

其中 `'/path/to/dir'` 需修改为实际存放 `frps.ini` 的目录

---

[kingfingerpro/Frps](https://github.com/kingfingerpro/Frps)，每日检测更新，[Releases · fatedier/frp](https://github.com/fatedier/frp/releases)，保持同步官方版本
