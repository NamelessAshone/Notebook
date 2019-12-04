# Selenium 快速入门(Python版)
Selenium 是一个用于**模拟用户行为**的Web自动化框架, 提供了: 打开网页 / 获取页面元素 / 模拟用户动作(点击等) / 执行JS脚本 等API. Selenium 不提供访问和控制HTTP请求参数的能力. Selenium支持Python / Java等主流编程语言.
使用Selenium进行Web自动化测试, 通常需要结合**单元测试框架** / **持续集成工具**. 

## 1. 安装Selenium
1. 确保已经正确安装Python
2. 使用pip安装: `pip3 install selenium`
3. 安装浏览器驱动:
    - 手动安装():
      For Chrome: http://npm.taobao.org/mirrors/chromedriver
      For Firfox: https://github.com/mozilla/geckodriver/releases
      
    - Linux 下使用包管理器:
      For ArchLinx: 
             Chrome: `sudo pacman -S chromedriver`
             FireFox: `sudo pacman -S geckodriver`

## 2. 第一个程序
```Python
# 代码来源: https://selenium.dev/documentation/en/
# 仅添加注释

# 导入依赖
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support.expected_conditions import presence_of_element_located

#This example requires Selenium WebDriver 3.13 or newer
# With 语法
with webdriver.Firefox() as driver:
    # 创建一个Wait对象
    wait = WebDriverWait(driver, 10)
    # 访问Bing
    driver.get("https://cn.bing.com/search")
    # 通过name获取搜索栏, 并输入cheese
    driver.find_element_by_name("q").send_keys("cheese" + Keys.RETURN)
    # 显示等待10s, 等待h3下面的div标签的出现, 使用css选择器
    first_result = wait.until(presence_of_element_located((By.CSS_SELECTOR, "main>ol")))
    # 打印div的内容
    print(first_result.get_attribute("textContent"))
```
成功运行程序后, 可以看到程序启动了Firefox浏览器, 并进入bing网站,搜索了cheese, 最后在命令行下打印出搜索结果.
接下来可以参考:[Selenium 中文文档(非官方)](https://selenium-python-zh.readthedocs.io/en/latest/), [国人Selenium学习Blog](https://www.cnblogs.com/yoyoketang/) 学习怎样控制浏览器完成一些常用的操作.

如果需要进一步了解框架结果, 可以参考第3章.

## 3. API手册阅读指南

> 该章节内容适用于已经能够独立写出selenium程序, 需要对框架结构进一步了解的入门者. 

**[selenium的模块结构](https://selenium.dev/selenium/docs/api/py/index.html)** :

```
selenium
|__ Common.exceptions	    # 公共异常类, 包括所有框架自定义的异常
|__ Webdriver.common        # 公共类, 包含一些公共功能
|	|__action_chains		# [重要] 动作链, 用于模拟一套连续的动作
|	|__alert                # 访问和控制浏览器提示框
|	|__by                   # [重要] 包括所有选择方式
|	|__desired_capabilities # [暂不需要阅读] 一组键值对, 包括浏览器版本等关键信息
|	|__keys                 # 包括所有按键
|	|__touch_actions        # 触屏动作链, 用于模拟一套连续的动作
|	|__utils                # [暂不需要阅读] 工具方法, 包括一些判断端口是否被占用的方法, useless
|	|__proxy                # [暂不需要阅读] 代理实现类
|	|__service	
|	|__html5.application_cache  # [暂不需要阅读] H5 app缓存控制
|
|__ Webdriver.support           # 常用工具
|	|__abstract_event_listener	# [高级内容] 抽象事件监听器, 通过继承该类来实现自己的事件监听器
|	|__color	                # 用于颜色的不同表示格式的切换
|	|__event_firing_webdriver   # [高级内容] 通过该类将事件监听器附加到webdriver实例上 
|	|__expected_conditions	    # [重要] 包括 *页面出现* / *页面元素可见* / *frame切换* 等情况的检测
|	|__select	        		# select输入框控制 
|	|__wait             		# [重要] 显示等待
|
|__ Webdriver.android       # [暂不需要阅读] android浏览器支持,提供拖动等方法
|__ Webdriver.chrome        # chrome浏览器支持
|	|__options	    		# chrome启动选项控制
|	|__service	    		# 用于新建一个chrome实例
|	|__webdriver     		# [重要] chrome的webdriver类
|
|__ Webdriver.firefox       # firefox浏览器支持
|	|__extension_connection	# [暂不需要阅读] firefox扩展插件控制
|	|__firefox_binary	    # 与Webdriver.chrome.service相同, 用于启动一个新的浏览器对象
|	|__options	            # 启动选项控制
|	|__firefox_profile	    # 预置文件控制
|	|__webdriver            # [重要] firefox的webdriver类
|
|__ Webdriver.ie            # [暂不需要阅读] ie浏览器支持
|__ Webdriver.opera         # [暂不需要阅读] opera浏览器支持
|__ Webdriver.phantomjs		# [暂不需要阅读] phantomjs浏览器支持, 该浏览器已被Chrome的Headless版淘汰
|__ Webdriver.remote        # [暂不需要阅读] webdriver内部实现, 浏览器的webdriver继承自该类下的webdriver
|__ Webdriver.safari        # [暂不需要阅读] safari浏览器支持
```

- 标记为**[重要]**的条目需要重点阅读 
- 标记为**[暂不需要阅读]**的条目暂时不用阅读
- 标记为**[高级]**的内容适用与高级用户

**继承关系**:

所以特定浏览器的webdriver类都是remote.driver的子类.

```
selenium.webdriver.firefox.webdriver----|
selenium.webdriver.chrome.webdriver	----|----> selenium.webdriver.remote.webdriver
selenium.webdriver.ie.webdriver		----|
...                                 ----|
```

## 4. 相关工具
### selenium IDE
[Selenium IDE](https://www.seleniumhq.org/projects/ide/)是官方提供的一款浏览器插件, 用于快速录制和重放Selenium脚本, 同时具有导出为Python / Java等语言脚本的能力. 
*注: 录制的脚本并不适合直接作为测试用例使用, 往往需要经过修改, 可用于快速执行重复操作.*

### XPATH Chrome插件
- [XPATH Helper](https://chrome.google.com/webstore/detail/xpath-helper/hgimnogjllphhhkhlmebbml-gjoejdpjl)高亮显示xpath选中的标签
![Ql9WNQ.png](https://s2.ax1x.com/2019/12/04/Ql9WNQ.png)

- [XPATH 提取器](https://sites.google.com/testleaf.com/ruto/)快速获取选中标签的XPATH
![Ql9fhj.png](https://s2.ax1x.com/2019/12/04/Ql9fhj.png)

## 5. selenium 资源

### 核心资源
- [Selenium 中文文档(非官方)](https://selenium-python-zh.readthedocs.io/en/latest/)
- [Selenium API 文档(官方)](https://selenium.dev/selenium/docs/api/py/index.html)
- [XPATH语法教程(英文)](https://www.guru99.com/xpath-selenium.html#10)

### 附加资源
- [国人Selenium学习Blog](https://www.cnblogs.com/yoyoketang/)
- [国人Selenium学习Blog 2](https://www.cnblogs.com/fnng/)
- [Pytest Python单元测试框架文档(英文)](https://pytest.org/en/latest/index.html)
- [Selenium 官网](https://selenium.dev/)

### 推荐阅读
- [XPATH 速查手册](https://devhints.io/xpath) 
- [SeleniumBase 基于Selenium的集成测试框架](https://seleniumbase.com/)

## 6. 常见问题
待更新

-----------------------------------------------------------------------------------------------------------------------------
Copyright@Shuxin Shu, Ebupt 2019
Version: 0.1