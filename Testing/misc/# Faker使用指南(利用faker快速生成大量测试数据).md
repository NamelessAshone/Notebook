# Faker使用指南

Faker 是一个生成虚假数据的Python包, 使用场景包括: 填充数据库, 填充HTML文档, 匿名化敏感数据, 压力测试等. 同时Faker提供命令行模式, 可以很方便地在命令行中生成临时测试数据.

## 一. 基本使用

### 安装

使用pip安装faker:
> $ pip install faker

### 在命令行中使用Faker

安装完成后, 在命令行下输入`faker name`, 生成一个名称:
> $ faker name
> James Taylor

使用`faker address`, 生成一个地址:
> $ faker adress
> 807 Wright Cape Apt. 573
> North John, MD 24366

### 在Python脚本中使用Faker
在Python脚本中使用Faker同样很简单, 一个简单的例子:
```Python
from faker import Faker

fake = Faker()

fake.name()
# 'Lucy Cechtelar'

fake.address()
# '426 Jordy Lodge
#  Cartwrightshire, SC 88120-6700'

fake.text()
# 'Sint velit eveniet. Rerum atque repellat voluptatem quia rerum. Numquam excepturi
#  beatae sint laudantium consequatur. Magni occaecati itaque sint et sit tempore. Nesciunt

```

### 提供器(Providers)
每个生成器属性(如: name, text, address)被称为fake. 一个Faker生成器有多个fake, 被打包为多个提供器(Provider). 常用的Provider包括:base, internet, date_time, company等. base是默认Provider, 无需添加.

> 注：生成器(generator)是Python中按一定形式编写的一类**函数**. 深入介绍见这篇[文章](https://nvie.com/posts/iterators-vs-generators/).

- 在脚本中使用base以外的provider, 需要进行设置：

```Python
from faker import Faker
from faker.providers import internet

fake = Faker()
fake.add_provider(internet)

fake.ipv4_private()
# 172.16.237.156
```
- 在命令行下无需设置Provider：
> $ faker ipv4_private
> 172.16.237.156
- [所有Provider的列表](https://faker.readthedocs.io/en/master/providers.html)

### 本地化



## 资源链接

[官方文档](https://faker.readthedocs.io/en/master/)
[Faker项目Github仓库](https://github.com/joke2k/faker)

-------------------------------------------------------
Copyright@ShuXin Shu, Ebupt, 2019
