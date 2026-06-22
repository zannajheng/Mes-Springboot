# MES-Springboot Code Wiki 索引

> 本 Wiki 旨在为 **章鱼师兄 / MES-Springboot** 项目提供一套结构化、完整的代码导读文档,覆盖项目整体架构、主要模块职责、关键类与函数说明、依赖关系、运行方式等关键信息。

## 1. 项目简介

**MES-Springboot**(原名"黑科")是一个面向离散制造行业的制造执行系统(MES),作者基于在杭州东方通信、浙江大华、天能集团等多个 MES 项目的实战经验沉淀而来。项目采用前后端不分离的 **Spring Boot + FreeMarker + Layui** 架构,实现系统管理、工艺管理、计划管理、物料管理、设备管理、SN 管理、在制品管理、质量管理、数字化平台等功能。

- 演示地址:<http://www.meswozuiniu.icu:8887>(用户名 `admin`,密码 `123`)
- 仓库:<https://gitee.com/wangziyangyang/MES-Springboot>
- 在线 API 文档:启动后访问 `/swagger-ui.html`

## 2. Wiki 目录

| 序号 | 文档 | 说明 |
| ---- | ---- | ---- |
| 01 | [项目概览](01-overview.md) | 项目背景、定位、核心特性、业务模块一览 |
| 02 | [整体架构](02-architecture.md) | 技术栈、系统分层、请求处理流程、运行机制 |
| 03 | [模块划分](03-modules.md) | 各业务包/模块的职责、依赖关系一览 |
| 04 | [公共模块 common](04-common.md) | BaseController / Result / BaseEntity / 通用工具与配置 |
| 05 | [系统管理 system](05-system.md) | 用户/角色/菜单/部门/字典/权限/Shiro 安全体系 |
| 06 | [工艺管理 technology](06-technology.md) | 工艺路线、BOM、零件、工序、工序内容等 |
| 07 | [业务模块](07-business.md) | 基础数据(basedata)/ 订单(order)/ 计划(plan)/ 数字化与数字孪生 |
| 08 | [部署与运行](08-deployment.md) | 环境依赖、数据库初始化、启动方式、Docker、FAQ |

## 3. 一分钟速览

- **技术栈**:`Spring Boot 2.1.7` + `MyBatis-Plus 3.1.2` + `Shiro 1.4.0` + `Redis` + `Ehcache` + `FreeMarker` + `Layui` + `ECharts` + `Three.js` + `Hutool` + `Swagger 2.9.2` + `Druid` + `MySQL 8`
- **包名根**:`com.wangziyang.mes`
- **启动类**:`com.wangziyang.mes.SparchetypeApplication`
- **主配置文件**:`mes/src/main/resources/application.yml`、`application-pro.yml`
- **默认端口**:`8080`(可在 `application-pro.yml` 中调整)
- **默认账号**:`admin / 123`

## 4. 文档约定

- 所有 Java 包路径均以 `com.wangziyang.mes` 为根。
- 文档中代码链接一律使用 `file:///` 协议指向仓库内具体文件。
- 模块图、流程图采用 Mermaid 语法(部分渲染器不支持时回退为文字描述)。
