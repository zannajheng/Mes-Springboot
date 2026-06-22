# MES-Springboot 项目部署说明

## 一、项目简介

本项目是一个基于 **Spring Boot 2.1.7** 开发的制造执行系统（MES）后端服务，采用前后端不分离架构：

- 后端：Spring Boot + MyBatis-Plus + Shiro + FreeMarker
- 前端：Layui + FreeMarker 模板
- 数据库：MySQL 8.0
- 缓存：Redis + Ehcache
- 构建工具：Maven 3.x
- 运行环境：JDK 1.8

项目主要功能包括：用户管理、角色权限、菜单管理、物料管理、BOM 管理、工艺路线、工单管理、在制品管理、设备管理等。

---

## 二、环境准备

### 2.1 必要软件

| 软件 | 版本要求 | 说明 |
|------|---------|------|
| JDK | 1.8 | 项目基于 Java 8 开发 |
| Maven | 3.x | 项目构建工具 |
| MySQL | 8.0 | 数据库，推荐使用 8.0 版本 |
| Redis | 任意稳定版 | 缓存服务 |
| IDE | IntelliJ IDEA / Eclipse | 可选，用于查看和调试代码 |

### 2.2 验证环境

打开命令行，依次执行以下命令确认环境已安装：

```bash
java -version
mvn -v
mysql --version
redis-cli ping
```

预期输出：

- `java version "1.8.xxx"`
- `Apache Maven 3.x.x`
- MySQL 版本号
- Redis 返回 `PONG`

---

## 三、数据库初始化

### 3.1 创建数据库

使用 MySQL 客户端（如 Navicat、DataGrip 或命令行）登录 MySQL，执行：

```sql
CREATE DATABASE sparchetype CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

### 3.2 导入数据

执行项目自带的 SQL 脚本，导入表结构和初始数据：

```bash
# 方式一：命令行导入
mysql -u root -p sparchetype < scripts/sql/MySQL-20210225.sql

# 方式二：使用 Navicat / DataGrip 等工具打开 SQL 文件并执行
```

> 脚本路径：`scripts/sql/MySQL-20210225.sql`
>
> 该脚本包含完整的数据库表结构、初始菜单、角色、用户等数据。

### 3.3 确认数据库连接

导入完成后，执行以下 SQL 检查数据是否正常：

```sql
USE sparchetype;
SELECT COUNT(*) FROM sys_user;
```

预期返回大于 0 的记录数。

---

## 四、Redis 启动

确保 Redis 服务已启动。

### Windows

```bash
redis-server.exe redis.windows.conf
```

### Linux / macOS

```bash
redis-server
```

验证 Redis 是否正常：

```bash
redis-cli ping
# 预期返回：PONG
```

---

## 五、项目配置

项目配置文件位于：

```
mes/src/main/resources/application-pro.yml
```

默认配置如下：

```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/sparchetype?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Hongkong&allowPublicKeyRetrieval=true&zeroDateTimeBehavior=convertToNull
    username: root
    password: 123456
  redis:
    host: 127.0.0.1
    port: 6379
    password: ""
```

如果本地 MySQL 或 Redis 的账号、密码、端口不同，请修改该文件。

---

## 六、项目启动

### 6.1 方式一：使用 Maven 命令启动（推荐开发使用）

进入项目目录：

```bash
cd mes
```

执行启动命令：

```bash
mvn clean spring-boot:run
```

首次启动会自动下载 Maven 依赖，耗时较长，请耐心等待。

### 6.2 方式二：打包后运行 Jar

```bash
cd mes
mvn clean package -DskipTests
```

打包完成后，在 `mes/target/` 目录下会生成 `mes-1.0.0.jar`。

运行：

```bash
java -jar target/mes-1.0.0.jar
```

---

## 七、访问验证

### 7.1 后端服务验证

启动成功后，在浏览器中访问：

```
http://localhost:8080
```

预期结果：跳转到系统登录页面。

### 7.2 Swagger 接口文档

```
http://localhost:8080/swagger-ui.html
```

可以查看项目提供的所有 RESTful 接口。

### 7.3 默认登录账号

| 账号 | 密码 |
|------|------|
| admin | 123 |

---

## 八、常见问题

### 8.1 数据库连接失败

**现象**：启动时报 `Communications link failure` 或 `Access denied for user`。

**解决方法**：

1. 确认 MySQL 服务已启动。
2. 确认数据库 `sparchetype` 已创建且 SQL 已导入。
3. 检查 `application-pro.yml` 中的 `url`、`username`、`password` 是否正确。

### 8.2 Redis 连接失败

**现象**：启动时报 `Connection refused: connect`。

**解决方法**：

1. 确认 Redis 服务已启动。
2. 检查 `application-pro.yml` 中 Redis 的 `host` 和 `port` 是否正确。

### 8.3 端口被占用

**现象**：启动时报 `Port 8080 was already in use`。

**解决方法**：

```bash
# 方式一：关闭占用 8080 端口的程序
# 方式二：修改项目端口，在 application-pro.yml 中添加
server:
  port: 8081
```

### 8.4 Maven 下载依赖慢

**解决方法**：在 `mes/pom.xml` 中添加阿里云 Maven 镜像，或在 `~/.m2/settings.xml` 中配置镜像：

```xml
<mirror>
    <id>aliyunmaven</id>
    <mirrorOf>*</mirrorOf>
    <name>阿里云公共仓库</name>
    <url>https://maven.aliyun.com/repository/public</url>
</mirror>
```

---

## 九、项目目录说明

```
MES-Springboot/
├── docs/                       # 项目文档
├── mes/                        # 后端主项目
│   ├── src/main/java/          # Java 源代码
│   ├── src/main/resources/     # 配置文件、模板、静态资源
│   │   ├── application.yml     # 主配置文件
│   │   ├── application-pro.yml # 生产/本地环境配置
│   │   ├── templates/          # FreeMarker 页面模板
│   │   └── static/             # 前端静态资源（CSS、JS、图片）
│   ├── src/main/docker/        # Dockerfile
│   └── pom.xml                 # Maven 构建配置
├── scripts/sql/                # 数据库脚本
│   └── MySQL-20210225.sql      # 完整数据库初始化脚本
├── README.md                   # 项目介绍
└── README-部署说明.md          # 本文件
```

---

## 十、部署成功标志

1. MySQL 中存在 `sparchetype` 数据库，且表内有数据。
2. Redis 服务正常运行。
3. 执行 `mvn spring-boot:run` 或 `java -jar` 后无报错。
4. 浏览器访问 `http://localhost:8080` 能看到登录页面。
5. 使用账号 `admin / 123` 能正常登录系统。

---

## 十一、后续扩展（可选）

如需部署到服务器或云平台，可进一步使用：

- **Docker 部署**：项目已提供 `mes/src/main/docker/Dockerfile`。
- **Jenkins + Docker + Nginx**：实现持续集成和反向代理部署。
- **云服务器部署**：如阿里云 ECS，将 jar 包上传后通过 `nohup java -jar` 运行。

---

**文档版本**：v1.0  
**适用项目**：MES-Springboot  
**编写日期**：2026-06-18
