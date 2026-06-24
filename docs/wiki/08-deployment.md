# 08 · 部署与运行

## 8.1 环境要求

| 软件 | 版本 | 说明 |
| ---- | ---- | ---- |
| JDK | 1.8 | 项目基于 Java 8 |
| Maven | 3.x | 构建工具(可使用项目自带的 `mvnw` / `mvnw.cmd`) |
| MySQL | 8.0 | 数据库 |
| Redis | 任意稳定版 | 缓存(可关闭,默认走 Ehcache) |
| IDE(可选) | IntelliJ IDEA / Eclipse | 阅读、调试 |

## 8.2 数据库初始化

### 8.2.1 创建数据库

```sql
CREATE DATABASE sparchetype CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

### 8.2.2 导入数据

使用项目自带的初始化脚本(可从仓库 `scripts/sql/` 目录获取):

```bash
# 命令行
mysql -u root -p sparchetype < scripts/sql/MySQL-20210225.sql

# 或使用 Navicat / DataGrip 打开 SQL 文件并执行
```

完成后执行:

```sql
USE sparchetype;
SELECT COUNT(*) FROM sys_user;
```

应返回大于 0 的记录数。

## 8.3 应用配置

主要配置文件:

- [application.yml](file:///c:/Users/Zanna/.trae-cn/worktrees/MES-Springboot/feat-generate-code-wiki-6rEV1s/mes/src/main/resources/application.yml) — 主配置
- [application-pro.yml](file:///c:/Users/Zanna/.trae-cn/worktrees/MES-Springboot/feat-generate-code-wiki-6rEV1s/mes/src/main/resources/application-pro.yml) — 生产/本地环境

关键项:

```yaml
server:
  session-timeout: 1800
spring:
  profiles:
    active: pro
  mvc:
    view:
      prefix: /templates/
      suffix: .ftl
  freemarker:
    suffix: .ftl
    templateEncoding: UTF-8
    templateLoaderPath: classpath:/templates/
    cache: false
  datasource:
    url: jdbc:mysql://localhost:3306/sparchetype?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Hongkong&allowPublicKeyRetrieval=true&zeroDateTimeBehavior=convertToNull
    username: root
    password: 123456
    druid:
      initial-size: 8
      min-idle: 5
      max-active: 10
      query-timeout: 6000
      filters: stat,config
  redis:
    host: 127.0.0.1
    port: 6379
    password: ""
    timeout: 2000
  cache:
    type: ehcache
```

> 注意:`application.yml` 中 `spring.cache.ehcache.config=classpath:config/ehcache.xml`,而项目实际文件位于 `classpath:ehcache.xml`。如需对齐,请将 `ehcache.xml` 移至 `resources/config/` 或将配置改为 `classpath:ehcache.xml`。

## 8.4 启动方式

### 8.4.1 Maven 直接运行(开发推荐)

```bash
cd mes
mvn clean spring-boot:run
```

### 8.4.2 打包为 Jar

```bash
cd mes
mvn clean package -DskipTests
java -jar target/mes-1.0.0.jar
```

### 8.4.3 IDE 启动

直接运行 `com.wangziyang.mes.SparchetypeApplication#main`。

## 8.5 访问入口

| 入口 | URL |
| ---- | --- |
| 后台首页 | <http://localhost:8080> |
| Swagger API 文档 | <http://localhost:8080/swagger-ui.html> |
| Druid 监控 | <http://localhost:8080/druid> |
| 登录页 | <http://localhost:8080/login-ui> |

默认账号:`admin / 123`

## 8.6 Docker 部署

项目自带 [Dockerfile](file:///c:/Users/Zanna/.trae-cn/worktrees/MES-Springboot/feat-generate-code-wiki-6rEV1s/mes/src/main/docker/Dockerfile):

```dockerfile
FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD mes-1.0.0.jar app.jar
RUN bash -c 'touch /app.jar'
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'Asia/Beijing' >/etc/timezone
EXPOSE 80
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
```

构建并推送(使用 pom.xml 中已配置的 `docker-maven-plugin`):

```bash
mvn clean package docker:build -DskipTests
mvn docker:push
```

镜像名格式:`sparchetype/mes:1.0.0`(由 `${docker.image.prefix}/${project.artifactId}:${project.version}` 决定)。

## 8.7 Jenkins 持续集成

`docs/jenkins.md` 中描述了完整流程,通常包含:

1. Jenkins 拉取 Git 仓库。
2. 执行 `mvn clean package -DskipTests`。
3. 通过 `docker-maven-plugin` 构建镜像并推送到仓库。
4. 远程服务器拉取镜像并 `docker run`。
5. Nginx 反向代理 + HTTPS。

## 8.8 常见问题(FAQ)

| 现象 | 排查 / 解决 |
| ---- | ----------- |
| 启动报 `Communications link failure` 或 `Access denied for user` | MySQL 未启动 / 数据库名/账号/密码错误;检查 `application-pro.yml` |
| 启动报 `Connection refused: connect`(Redis) | Redis 未启动 / 端口错误;`application-pro.yml` 中调整 `spring.redis.*` |
| 启动报 `Port 8080 was already in use` | 占用 8080;`application-pro.yml` 中添加 `server.port: 8081` |
| Maven 下载依赖慢 | 在 `~/.m2/settings.xml` 配置阿里云镜像 |
| 启动报 `ehcache.xml` 找不到 | 见 [8.3 注意事项](#83-应用配置) |
| Swagger 不显示 | 检查 `swagger.enable` 是否为 `true` |
| 文件上传失败 | 检查 `${user.dir}/upload/` 目录是否存在且可写 |
| 中文乱码 | 模板/响应均已 UTF-8;检查 Tomcat / Nginx `charset` |

## 8.9 生产部署建议

1. **HTTPS + Nginx**:在 Nginx 终止 HTTPS,反向代理到 8080。
2. **数据库连接池**:Druid 已配置 `initial-size=8, max-active=10`,按业务量调整。
3. **Redis**:启用 `cacheType=redis`(`ShiroConfig` 内部已支持),集中缓存 session/凭证。
4. **JVM 参数**:`-Xms512m -Xmx1024m -XX:+UseG1GC -Duser.timezone=Asia/Shanghai`。
5. **日志收集**:把 `logback.xml` 中 `stash` appender 指向生产 Logstash 地址;同步保留 `STDOUT`。
6. **Druid 监控白名单**:对 `/druid/*` 限制白名单 IP 或仅内网访问。
7. **备份**:定时备份 `upload/` 与 MySQL。

## 8.10 常用维护命令

```bash
# 查看启动日志
tail -f logs/spring.log

# 监控数据源
curl http://localhost:8080/druid

# 重新构建并部署
mvn clean package -DskipTests
docker build -t sparchetype/mes:1.0.0 .
docker run -d -p 8080:8080 --name mes sparchetype/mes:1.0.0
```

## 8.11 顶层目录速查

```text
MES-Springboot/
├── docs/                            # 文档
│   ├── ajax.md, FreeMarker.md, ...
│   └── wiki/                        # 本 Wiki
├── mes/
│   ├── pom.xml
│   └── src/main/
│       ├── docker/Dockerfile
│       ├── java/com/wangziyang/mes/
│       └── resources/
│           ├── application.yml
│           ├── application-pro.yml
│           ├── banner.txt
│           ├── ehcache.xml
│           ├── logback.xml
│           ├── mapper/...
│           ├── static/...
│           └── templates/...
├── scripts/sql/                     # 数据库脚本
├── README.md
└── README-部署说明.md
```
