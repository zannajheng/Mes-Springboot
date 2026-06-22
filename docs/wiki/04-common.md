# 04 · 公共模块 common

> 位置:`com.wangziyang.mes.common`
> 角色:**所有业务模块的基类与工具中心**,提供 BaseController/BaseEntity/Result/分页基类/工具类/通用配置/全局异常。

## 4.1 目录结构

```text
com.wangziyang.mes.common
├── BaseController.java          // 当前登录用户、admin 判断
├── BaseEntity.java              // id/创建/更新审计字段
├── BasePageReq.java             // 分页请求基类
├── Result.java                  // 统一返回结果
├── advice/
│   ├── ExceptionAdvice.java     // @ControllerAdvice 全局异常
│   └── MyErrorViewResolver.java // /400 错误页注册
├── config/
│   ├── JsonConfig.java          // ObjectMapper(LocalDateTime 序列化)
│   ├── MybatisPlusConfig.java   // @MapperScan + 分页拦截器
│   ├── ShiroTagsFreeMarkerConfig.java // FreeMarker 中加入 <@shiro.*> 标签
│   ├── SpMetaObjectHandler.java // 自动填充 createUsername/updateTime
│   └── WebMvcConfig.java        // 静态资源映射(/files、/avatar)
├── enums/
│   └── CommonEnum.java          // 数据库审计字段名常量
└── util/
    ├── ByteUtil.java
    ├── CodeGenerator.java       // MyBatis-Plus 代码生成器入口
    ├── HashUtil.java            // MD5/SHA-1
    ├── HttpUtil.java            // Ajax 判断 + 继承 Hutool
    ├── IdUtil.java              // 53 bits unique id(雪花变体)
    ├── RandomVerificationCodeUtil.java
    └── TreeUtil.java
```

## 4.2 核心基类

### 4.2.1 [BaseController](file:///c:/Users/Zanna/.trae-cn/worktrees/MES-Springboot/feat-generate-code-wiki-6rEV1s/mes/src/main/java/com/wangziyang/mes/common/BaseController.java)

所有业务 Controller 都继承该类,提供:

| 方法 | 作用 |
| ---- | ---- |
| `SysUser getSysUser()` | 从 Shiro Subject 中获取当前登录用户(`SysUser`)。若 principal 是 `String`,则再调用 `ISysUserService` 查询并转换为 `SysUser`。 |
| `SysUserDTO getSysUserDTO()` | 获取当前登录用户(含角色/菜单)。 |
| `boolean isAdmin()` | 判断当前用户是否拥有 code 为 `admin` 的角色。 |

### 4.2.2 [BaseEntity](file:///c:/Users/Zanna/.trae-cn/worktrees/MES-Springboot/feat-generate-code-wiki-6rEV1s/mes/src/main/java/com/wangziyang/mes/common/BaseEntity.java)

所有持久化实体的父类。字段:

| 字段 | 类型 | 填充策略 | 说明 |
| ---- | ---- | -------- | ---- |
| `id` | `String` | `@TableId(type=ID_WORKER_STR)` | MyBatis-Plus 19 位雪花 ID(字符串形式) |
| `createTime` | `LocalDateTime` | `INSERT` | 创建时间 |
| `createUsername` | `String` | `INSERT` | 创建用户 |
| `updateTime` | `LocalDateTime` | `INSERT_UPDATE` | 最后更新时间 |
| `updateUsername` | `String` | `INSERT_UPDATE` | 最后更新用户 |

填充由 [SpMetaObjectHandler](file:///c:/Users/Zanna/.trae-cn/worktrees/MES-Springboot/feat-generate-code-wiki-6rEV1s/mes/src/main/java/com/wangziyang/mes/common/config/SpMetaObjectHandler.java) 完成:从 Shiro 中拿当前 username,未登录时使用 `system`。

### 4.2.3 [BasePageReq](file:///c:/Users/Zanna/.trae-cn/worktrees/MES-Springboot/feat-generate-code-wiki-6rEV1s/mes/src/main/java/com/wangziyang/mes/common/BasePageReq.java)

继承 `com.baomidou.mybatisplus.extension.plugins.pagination.Page`,带默认排序字段 `orderBy = "update_time"`。各业务模块按"一张表对应一个 Req"的约定实现它,如 `SysUserPageReq`、`SpBomReq`。

### 4.2.4 [Result<T>](file:///c:/Users/Zanna/.trae-cn/worktrees/MES-Springboot/feat-generate-code-wiki-6rEV1s/mes/src/main/java/com/wangziyang/mes/common/Result.java)

统一返回结构:

```json
{
  "code": 0,
  "data": <T>,
  "msg": "操作成功"
}
```

约定:code = 0 表示成功,1 表示失败。提供 `success(...)` / `failure(...)` / `fail(...)` 静态工厂。

## 4.3 通用配置

### 4.3.1 [MybatisPlusConfig](file:///c:/Users/Zanna/.trae-cn/worktrees/MES-Springboot/feat-generate-code-wiki-6rEV1s/mes/src/main/java/com/wangziyang/mes/common/config/MybatisPlusConfig.java)

```java
@EnableTransactionManagement
@Configuration
@MapperScan("com.wangziyang.mes.*.mapper*")
public class MybatisPlusConfig {
    @Bean
    public PaginationInterceptor paginationInterceptor() { ... }
}
```

- 启用事务管理。
- 扫描所有 `com.wangziyang.mes.*.mapper*` 包。
- 注册分页拦截器(默认单页上限 500 行,`setOverflow(false)`)。

### 4.3.2 [SpMetaObjectHandler](file:///c:/Users/Zanna/.trae-cn/worktrees/MES-Springboot/feat-generate-code-wiki-6rEV1s/mes/src/main/java/com/wangziyang/mes/common/config/SpMetaObjectHandler.java)

- `insertFill` → 填充 `createUsername`、`createTime`。
- `updateFill` → 填充 `updateUsername`、`updateTime`。
- username 优先取自 `SecurityUtils.getSubject().getPrincipal()`,未登录则为 `system`。

### 4.3.3 [WebMvcConfig](file:///c:/Users/Zanna/.trae-cn/worktrees/MES-Springboot/feat-generate-code-wiki-6rEV1s/mes/src/main/java/com/wangziyang/mes/common/config/WebMvcConfig.java)

- `/files/**` → 映射到 `${user.dir}/upload/`
- `/admin/sys/user/avatar/**` → 映射到 `${user.dir}/upload/avatar/`

### 4.3.4 [JsonConfig](file:///c:/Users/Zanna/.trae-cn/worktrees/MES-Springboot/feat-generate-code-wiki-6rEV1s/mes/src/main/java/com/wangziyang/mes/common/config/JsonConfig.java)

- 注册 `JavaTimeModule`(序列化 `LocalDateTime` 为 `yyyy-MM-dd HH:mm:ss`、`LocalDate` 为 `yyyy-MM-dd`、`LocalTime` 为 `HH:mm:ss`)。
- 注册 `ParameterNamesModule`、`Jdk8Module`。
- 解决 Java 8 时间 API 与 Jackson 的兼容。

### 4.3.5 [ShiroTagsFreeMarkerConfig](file:///c:/Users/Zanna/.trae-cn/worktrees/MES-Springboot/feat-generate-code-wiki-6rEV1s/mes/src/main/java/com/wangziyang/mes/common/config/ShiroTagsFreeMarkerConfig.java)

`@PostConstruct` 中将 `ShiroTags` 注入到 FreeMarker 共享变量,模板里可使用:

```html
<@shiro.hasPermission name="sys:user:add">
    <button class="layui-btn" lay-event="add">新增</button>
</@shiro.hasPermission>
```

## 4.4 全局异常与错误页

### 4.4.1 [ExceptionAdvice](file:///c:/Users/Zanna/.trae-cn/worktrees/MES-Springboot/feat-generate-code-wiki-6rEV1s/mes/src/main/java/com/wangziyang/mes/common/advice/ExceptionAdvice.java)

| 异常 | 处理 |
| ---- | ---- |
| `AuthorizationException` | Ajax → `Result.failure("未授权")`;否则 `error/403` |
| `DuplicateKeyException` | Ajax → `Result.failure("数据重复")`;否则 `error/403` |
| `Exception` | Ajax → `Result.failure(e.getMessage())`;否则 `error/500` |

`HttpUtil.isAjax(req)` 通过 `x-requested-with = XMLHttpRequest` 判断。

### 4.4.2 [MyErrorViewResolver](file:///c:/Users/Zanna/.trae-cn/worktrees/MES-Springboot/feat-generate-code-wiki-6rEV1s/mes/src/main/java/com/wangziyang/mes/common/advice/MyErrorViewResolver.java)

注册 `400 → /400` 错误页(由 Shiro 或 Spring 触发)。

## 4.5 工具类

| 类 | 关键能力 |
| -- | -------- |
| [ByteUtil](file:///c:/Users/Zanna/.trae-cn/worktrees/MES-Springboot/feat-generate-code-wiki-6rEV1s/mes/src/main/java/com/wangziyang/mes/common/util/ByteUtil.java) | 字节数组与十六进制互转 |
| [CodeGenerator](file:///c:/Users/Zanna/.trae-cn/worktrees/MES-Springboot/feat-generate-code-wiki-6rEV1s/mes/src/main/java/com/wangziyang/mes/common/util/CodeGenerator.java) | MyBatis-Plus AutoGenerator 入口;`main` 方法扫描控制台输入的"模块名"生成代码 |
| [HashUtil](file:///c:/Users/Zanna/.trae-cn/worktrees/MES-Springboot/feat-generate-code-wiki-6rEV1s/mes/src/main/java/com/wangziyang/mes/common/util/HashUtil.java) | MD5、SHA-1 |
| [HttpUtil](file:///c:/Users/Zanna/.trae-cn/worktrees/MES-Springboot/feat-generate-code-wiki-6rEV1s/mes/src/main/java/com/wangziyang/mes/common/util/HttpUtil.java) | `isAjax(HttpServletRequest)`;继承 `cn.hutool.http.HttpUtil` |
| [IdUtil](file:///c:/Users/Zanna/.trae-cn/worktrees/MES-Springboot/feat-generate-code-wiki-6rEV1s/mes/src/main/java/com/wangziyang/mes/common/util/IdUtil.java) | 53 位 unique id(雪花变体),支持单机/集群;`IdUtil.nextId()` 返回字符串 |
| [RandomVerificationCodeUtil](file:///c:/Users/Zanna/.trae-cn/worktrees/MES-Springboot/feat-generate-code-wiki-6rEV1s/mes/src/main/java/com/wangziyang/mes/common/util/RandomVerificationCodeUtil.java) | 图形验证码生成 |
| [TreeUtil](file:///c:/Users/Zanna/.trae-cn/worktrees/MES-Springboot/feat-generate-code-wiki-6rEV1s/mes/src/main/java/com/wangziyang/mes/common/util/TreeUtil.java) | 通用树形结构构建 |

### IdUtil 位数分配(53 bits)

| 段 | 位 | 含义 |
| -- | -- | ---- |
| timestamp - 2000-01-01 | 31 | 可用到 2106 年 |
| 序列号 | 17 | 单机每秒 13 万 |
| 分片(机器) | 5 | 最多 32 台机器,自动从 hostname 提取数字 |

## 4.6 通用枚举

[CommonEnum](file:///c:/Users/Zanna/.trae-cn/worktrees/MES-Springboot/feat-generate-code-wiki-6rEV1s/mes/src/main/java/com/wangziyang/mes/common/enums/CommonEnum.java) 集中维护数据库审计字段名:

```text
is_deleted       (删除标记)
create_time      (创建时间)
create_username  (创建用户)
update_time      (更新时间)
update_username  (更新用户)
```

用于 SQL 中需要硬编码字段名、又希望与代码保持一致的场合。

## 4.7 模板生成器

[CodeGenerator](file:///c:/Users/Zanna/.trae-cn/worktrees/MES-Springboot/feat-generate-code-wiki-6rEV1s/mes/src/main/java/com/wangziyang/mes/common/util/CodeGenerator.java) 配置:

- `outputDir = ${projectPath}/src/main/java`
- `Author = WangZiYang`
- `Url = jdbc:mysql://localhost:3306/sparchetype?...`(注意密码硬编码为 `admin/admin`,运行前请按本地环境修改)
- `Parent = com.wangziyang.mes`
- 模板位于 `templates/codegenerator/*`(Controller/Entity/Mapper/Service/ServiceImpl/Mapper.xml),使用 FreeMarker 模板引擎。

## 4.8 下一步

- Shiro / Swagger / 系统管理 → [05-system.md](05-system.md)
- 工艺管理 → [06-technology.md](06-technology.md)
- 基础数据 / 订单 / 计划 / 数字化 → [07-business.md](07-business.md)
