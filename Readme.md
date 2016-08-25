# 墙内更快地访问apt资源

[Ubuntu Releases and Codename](https://wiki.ubuntu.com/Releases)

切换ubuntu apt-source 到国内镜像源

## 如何使用

如何获得当前运行ubuntu系统版本号

```
$> lsb_release -rs
```

```
# 使用默认国内源, 最新镜像 
curl -sSL https://github.com/cao7113/capt/raw/master/capt.sh | bash
```

```
# 使用默认国内源, 指定版本
curl -sSL https://github.com/cao7113/capt/raw/master/capt.sh | bash -s 1404
```

```
# 使用 指定版本, 指定镜像源 todo 暂未支持
curl -sSL https://github.com/cao7113/capt/raw/master/capt.sh | bash -s 1404-aliyun
```

## 工作原理及如何撤回

备份了原来的文件，所以在/et/apt/中将备份文件恢复即可

todo 通过脚本自动切回！

## Apt sources

国内镜像汇总 

http://wiki.ubuntu.org.cn/%E6%A8%A1%E6%9D%BF:16.04source

https://wiki.debian.org/SourcesList
