# Robot Framework快速指南



## 一个例子

```Robot
# -*- coding: robot -*-
*** Settings ***
Library     OperatingSystem
Library     String

*** Test Cases ***
Add Test
    Add   1   2   3
    Add   1   3   4
    Add   0  -1   2

*** Keywords ***
Add
    [Arguments]    ${a
    ${rc}   ${output} =     Run And Return Rc And Output    ./add.py
    Should Be Equal     ${rc}   ${0}
    Log     ${output}
```



## 资源

[官方文档: http://robotframework.org/robotframework/#user-guide](http://robotframework.org/robotframework/#user-guide)



