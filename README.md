# Frps in Docker

> 基于 [fatedier/frp](https://github.com/fatedier/frp/releases) 自动构建 `Docker` 镜像

明明已经有很多大佬构建过这个镜像，甚至还有官方镜像的存在，为什么还要重复造轮子呢？

因为 frps 的主程序和配置文件都是单文件，所以大家默认都是把两个文件`frps`和`frps.toml`放在同一个目录下，类似`/run`、`/frp`，然后以单文件的形式挂载配置文件，类似`-v /root/frps/frps.toml:/frp/frps.toml`，这么做会导致某些兼容性问题，实际上Docker也不建议挂载文件而是挂载目录，非要挂载文件的话，应该使用`--mount`而不是`-v`

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

从0.52.0版本起弃用 INI ，改用 TOML、YAML、JSON 作为配置文件格式。详见 [Releases v0.52.0 · fatedier/frp](https://github.com/fatedier/frp/releases/tag/v0.52.0)

---

[kingfingerpro/frps-in-Docker](https://github.com/kingfingerpro/frps-in-Docker)，每日检测更新，[Releases · fatedier/frp](https://github.com/fatedier/frp/releases)，保持同步官方版本
