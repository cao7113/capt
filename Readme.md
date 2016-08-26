# 墙内更快地访问apt资源

切换ubuntu apt-source 到国内镜像源

## 如何使用

```
# 使用默认国内源 (aliyun)
curl -sSL https://github.com/cao7113/capt/raw/master/capt.sh | bash
```

```
# 使用指定镜像源 (依赖share中的缓存文件存在)
curl -sSL https://github.com/cao7113/capt/raw/master/capt.sh | bash -s aliyun
```

## 工作原理及如何撤回

备份了原来的文件，所以在/et/apt/中将备份文件恢复即可
todo 通过脚本自动切回！

## Familar yourself with sources.list

man sources.list
https://help.ubuntu.com/community/Repositories/CommandLine#what
https://wiki.debian.org/SourcesList
注意：修改后要apt-get update

## Mirrors

[Ubuntu Releases and Codename](https://wiki.ubuntu.com/Releases)
[Official mirrors](https://help.ubuntu.com/community/Repositories/CommandLine)
[国内镜像汇总](http://wiki.ubuntu.org.cn/%E6%A8%A1%E6%9D%BF:16.04source)
[PPA](https://launchpad.net/ubuntu)
