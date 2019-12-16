# Faker使用指南

Faker 是一个生成虚假数据的Python包, 使用场景包括: 填充数据库, 填充HTML文档, 匿名化敏感数据, 压力测试等. 

同时Faker提供命令行模式, 可以很方便地在命令行中生成临时测试数据.



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

在Python脚本中使用Faker同样很简单:
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

一个生成器属性(如: name, text, address)被称为一个*fake*. Faker中包含多个*fake*, 被打包为多个*Provider*, 用来将功能类似的*fake*归类. 常用的Provider包括: base, internet, date_time, company等. base是默认Provider, 无需添加.

包的结构：

```
faker.providers
|__ internet          		 
|   |__ ipv4_private
|   |__ ipv4
|   |__ ipv6
|	|__ ...
|
|__ addresss
|__ ...
```



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

Faker可以通过设置语言参数, 来使输出本地化. 如果没有找到对应的语言的provider, 将默认使用en_US.

- 在Python脚本中设置语言:
```python
from faker import Faker
fake = Faker('ja_JP')
for _ in range(3):
    print(fake.name())

# 田辺 太郎
# 坂本 京助
# 宮沢 花子
```

- 在命令行下设置语言, 使用`-l <language>`指定:
> $ faker -l zh_CN name
> 阎艳

- 支持的语言, 详细说明见该[手册页](https://faker.readthedocs.io/en/master/), 此处仅列出部分常用语言：
```
...
de_DE - German
el_GR - Greek
en_US - English (United States)
fr_FR - French
it_IT - Italian
ja_JP - Japanese
ko_KR - Korean
ru_RU - Russian
zh_CN - Chinese (China)
zh_TW - Chinese (Taiwan)
...
```


### 常用字段(fake)


| 名称               | 示例输出                     | 作用               |
| ------------------ | ---------------------------- | ------------------ |
| city               | 永安市                       | 产生城市名(带后缀) |
| city_name          | 永安                         | 产生城市名         |
| address            | 江苏省东市西夏路路F座 205283 | 产生地址           |
| province           | 四川省                       | 产生省份名         |
| country            | 斯威士兰                     | 产生国家名         |
| company            | 浦华众城科技有限公司         | 产生公司名         |
| postcode           | 618004                       | 产生邮政编码       |
| date               | 2019-01-10                   | 产生日期           |
| date_this_month    | 2019-12-15                   | 产生该月的日期     |
| time               | 21:47:38                     | 产生时间           |
| email              | luxiuying@yan.cn             | 产生email          |
| ipv4               | 173.23.132.168               | 产生ipv4地址       |
| name               | 李红                         | 产生姓名           |
| first_name         | 建军                         | 产生名             |
| last_name          | 张                           | 产生姓             |
| phone_number       | 18251974306                  | 产生电话号码       |
| phonenumber_prefix | 185                          | 产生电话前缀       |
| job                | 客房服务员                   | 产生工作名称       |
| word               | 开始                         | 产生一个词         |
| sentence           | ...                          | 产生一句话         |
| paragraph          | ...                          | 产生一个段落       |
| text               | ...                          | 产生一段文字       |
| random_digit       | 1                            | 产生一位随机数     |
| random_int         | 1012                         | 产生一个随机数     |

示例：

```
$ faker -l zh_CN name
张建军
```



### 与 shell 脚本结合

例子: 生成插入数据的insert语句.
```bash
#! /usr/bin/env sh

i=1
for i in {0..100}; do

    id=$(faker ean8)					# 8位id
    name=$(faker -l zh_CN company)		# 公司名
    amount=$(faker random_int)			# 随机数量
    merchant_id="af12dbd"				# 商家名称
    start_date='2019-12-10'				# 开始时间
    end_date='2019-12-30'				# 过期时间
    is_disable=$(( $(od -An -N1 -i /dev/urandom) % 2 )) 		# 随机产生 1 or 0
    
    # 拼接出 insert 语句
    echo "INSERT INTO \`yxms\`.\`yxms_ticket_config\`"       \
         "(\`id\`, \`name\`, \`amount\`, \`merchant_id\`,"   \
         " \`start_date\`, \`end_date\`, \`is_disable\`)"    \
         " VALUES ('$id', '${name:0:10}', '$amount', '$merchant_id', '$start_date', '$end_date', '$is_disable');"

done
```
部分生成的语句：
```sql
INSERT INTO `yxms`.`yxms_ticket_config` (`id`, `name`, `amount`, `merchant_id`,  `start_date`, `end_date`, `is_disable`)  VALUES ('39825971', '凌云网络有限公司', '2201', 'af12dbd', '2019-12-10', '2019-12-30', '0');
INSERT INTO `yxms`.`yxms_ticket_config` (`id`, `name`, `amount`, `merchant_id`,  `start_date`, `end_date`, `is_disable`)  VALUES ('01152449', '信诚致远网络有限公司', '926', 'af12dbd', '2019-12-10', '2019-12-30', '1');
...
```



## 二. 资源链接

[官方文档](https://faker.readthedocs.io/en/master/)
[Faker项目Github仓库](https://github.com/joke2k/faker)



-------------------------------------------------------
Copyright@ShuXin Shu, Ebupt, 2019

Version: 0.1