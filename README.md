# FY
ssm架构的东北非遗网站_2020大学生创新创业大赛
--------------------分割线-------------------------
2022.9.2修正
# 此项目原本为大创项目产物。现作为练习使用。在此写一个ReadMe降低上手难度

## 项目概述
本项目为前后端分离架构。其中front包为前端，hrmapp包为后端。
** 前后端使用绝对地址的方式写入页面标签，使用的时候注意换成自己设定的端口 **

### front
编写方式为java+javabean+前端三件套。大范围的使用了frameset用于单一页面的分区

### hrmapp
借用的已有的后端管理平台并进行了本地化和定制化。
包中有原始sql，不是本项目数据库sql
** 拦截器和视图解析器存在问题 **

### hrm_db.sql
本项目数据库sql
