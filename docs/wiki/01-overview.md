# 01 · 项目概览

## 1.1 项目定位

**MES-Springboot**(品牌名"章鱼师兄 / 黑科")是一套面向**离散制造业**的制造执行系统(MES),基于 **Spring Boot 2.1.7** 构建,采用前后端不分离架构。

项目沉淀自作者在以下企业的实战经验:

| 企业 | 平台 |
| ---- | ---- |
| 杭州东方通信股份 | 三星 SDS 麦康平台 |
| 浙江大华技术股份 | 三星 SDS 麦康平台 |
| 天能集团 | 自研平台(0 到 1) |

## 1.2 业务范围

按 README 中给出的规划,系统将分多个阶段实现下列八大业务域:

| 业务域 | 子模块 | 状态 |
| ------ | ------ | ---- |
| **系统管理** | 用户管理、组织管理、菜单管理、基础数据维护、基础数据配置 | ✅ 已完成 |
| **工艺管理** | 工艺路线管理、MOM 管理、BOM 管理、SOP 管理、其他工艺文件 | ✅ 主线完成 |
| **计划管理** | 工单下达、工序工单分解、工单流程变更、工单锁定、工单特殊设置 | 🚧 进行中 |
| **物料管理** | 物料出入库、智能货架、物料标签管理、AGV+WCS、**物料基础数据** | ✅ 主线完成 |
| **设备管理** | 设备档案、设备维修保养、设备出入库、设备稼动率 | ⏳ 未开发 |
| **SN 码管理** | SN 规则管理、分配 SN 管理、SN 标签+打印 | ⏳ 未开发 |
| **在制品管理** | 工序过站、在线维修管理、自动化对接、SN 返工管理 | ✅ 完成 |
| **质量管理** | IQC、OQC、FQC、质检项维护 | ⏳ 未开发 |

> 说明:上表 ✅ / 🚧 / ⏳ 标识来自 README 中说明列的约定。

## 1.3 核心特性

- **系统管理**:用户、角色、菜单、部门、字典、按钮权限的统一管理。
- **主数据动态化**:支持"动态建表 + 动态字段显示",仅需简单维护即可对表/字段进行增删改查。
- **赋码规则**:支持动态配置 SN 规则(6 位年月日 + 3 位流水号 + 随机号等),按用户配置自动生成 SN。
- **菜单与数据权限**:角色-菜单-按钮的细粒度权限;支持按机构(部门)划分数据范围。
- **字典管理**:对系统中常用的固定数据进行集中维护。
- **物料进出管理**:叫料 → 配料 → 发料 → 收料 → 上料全流程。
- **工单管理**:工单下达、工单分解、状态调整、特殊设置。
- **在制品管理**:工序过站、SN/箱/跺的绑定。
- **质量管理**:按物料/型号维护质检项,提供抽检确认页。
- **工艺文件管理**:工艺参数、BOM、导入导出。
- **报表与数字化平台**:基于 ECharts 的图形化展示,支持 SQL 视图"热部署"。
- **数字孪生**:基于 Three.js 的 3D 数字孪生(数字仿真仓库)。
- **工作流引擎**:业务工单流转、在线流程设计器(规划中)。
- **操作日志 & 异常日志**:基于 logback + logstash-encoder,可对接 ELK。
- **连接池监控**:基于 Druid 提供的 `/druid` 监控页面。

## 1.4 技术栈一览

| 类别 | 选型 | 版本 | 用途 |
| ---- | ---- | ---- | ---- |
| 语言/平台 | Java | 1.8 | 项目基线 |
| Web 框架 | Spring Boot | 2.1.7.RELEASE | 应用骨架 |
| 持久层 | MyBatis-Plus | 3.1.2 | ORM + 分页 + 代码生成 |
| 数据库 | MySQL | 8.x | 主库 |
| 连接池 | Alibaba Druid | 1.1.9 | 数据源 + 监控 |
| 安全 | Apache Shiro | 1.4.0 | 认证/授权/会话 |
| 缓存 | Redis + Ehcache | 5.x + 1.4.0 | 分布式/本地缓存 |
| 模板引擎 | FreeMarker | (随 Spring Boot) | 服务端渲染 |
| 前端 UI | Layui + 自研 sp 组件 | - | 表格、表单、弹层 |
| 图表 | ECharts | - | 报表/数字孪生 |
| 3D | Three.js + OBJLoader | - | 数字孪生仓库 |
| 富文本 | wangEditor | - | 内容编辑 |
| 工具库 | Hutool | 5.1.5 | 静态方法工具集 |
| Excel | Apache POI(ooxml) | 4.1.2 | 导入导出 |
| API 文档 | SpringFox Swagger | 2.9.2 | `/swagger-ui.html` |
| 日志 | Logback + logstash-encoder | 5.3 | 本地日志 + 远端收集 |
| 构建 | Maven | 3.x | 构建工具 |
| 容器化 | Docker(openjdk:8-jdk-alpine) | - | 镜像 |
| 部署 | Jenkins + Nginx | - | 持续集成/反向代理 |
| 宿主云 | 阿里云 ECS | - | 生产环境 |

## 1.5 顶层目录

```text
MES-Springboot/
├── docs/                       # 项目文档(本 Wiki 所在目录的兄弟节点)
├── mes/                        # 后端主项目(Spring Boot)
│   ├── src/main/java           # Java 源码
│   ├── src/main/resources      # 配置、Mapper XML、模板、静态资源
│   │   ├── application.yml     # 主配置(激活 pro profile)
│   │   ├── application-pro.yml # 生产/本地环境
│   │   ├── ehcache.xml         # 本地缓存配置
│   │   ├── logback.xml         # 日志配置(console + logstash)
│   │   ├── mapper/             # MyBatis XML
│   │   ├── templates/          # FreeMarker 页面模板
│   │   └── static/             # 静态资源(css/js/image/lib/json)
│   ├── src/main/docker/        # Dockerfile
│   └── pom.xml                 # Maven 配置
├── scripts/sql/                # 数据库初始化脚本
│   └── MySQL-20210225.sql
├── README.md                   # 项目介绍
└── README-部署说明.md          # 部署文档
```

## 1.6 命名约定

- 实体表名以 `sp_` 为前缀(部分系统表沿用 `sys_`),如 `sp_bom`、`sp_flow`、`sp_oper`、`sp_materile`、`sp_order`、`sp_material_demand_plan`、`sp_table_manager`、`sys_user`、`sys_role`、`sys_menu`、`sys_dict`、`sys_department` 等。
- 分页请求参数类以 `XxxPageReq` / `XxxReq` 命名,且一张表对应一个请求参数对象。
- 公共枚举:`com.wangziyang.mes.common.enums.CommonEnum`;模块枚举:各业务包下的 `enums` 子包,如 `com.wangziyang.mes.system.enums.SysUserEnum`。
- 控制层分两类:管理员端(以 `admin.` 命名前缀,如 `controller/admin/SysUserController`)与客户端(`controller/client/SysLoginController`)。

## 1.7 下一步阅读

- 想要了解**整体架构与请求处理流程** → [02-architecture.md](02-architecture.md)
- 想要了解**模块划分与依赖** → [03-modules.md](03-modules.md)
- 想要了解**核心公共类** → [04-common.md](04-common.md)
- 想要了解**权限与 Shiro** → [05-system.md](05-system.md)
- 想要了解**工艺/BOM 数据模型** → [06-technology.md](06-technology.md)
- 想要了解**基础数据/订单/计划/数字化平台** → [07-business.md](07-business.md)
- 想要了解**部署与运行** → [08-deployment.md](08-deployment.md)
