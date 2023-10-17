# Frps in Docker

> 基于 [fatedier/frp](https://github.com/fatedier/frp/releases) 自动构建 `Docker` 镜像

## 启动容器

```bash
docker run \
  --name=frps \
  --network host \
  -v '/path/to/dir':/frps \
  --restart=always \
  -d kingfingerpro/frps
```

其中 `'/path/to/dir'` 需修改为实际存放配置文件 `[frps.ini]` `(frps.toml)` 的目录

从0.52.0版本起弃用 INI ，改用 TOML、YAML、JSON 作为配置文件格式。详见 [frp · Release / v0.52.0](https://github.com/fatedier/frp/releases/tag/v0.52.0)

---

[kingfingerpro/frps-in-Docker](https://github.com/kingfingerpro/frps-in-Docker)，每日检测更新，[Releases · fatedier/frp](https://github.com/fatedier/frp/releases)，保持同步官方版本
