package com.wangziyang.mes.system.controller.admin;

import com.wangziyang.mes.common.BaseController;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.system.dto.SysRoleDTO;
import com.wangziyang.mes.system.dto.SysUserDTO;
import com.wangziyang.mes.system.service.ISysMenuService;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 系统登录
 *
 * @author SongPeng
 * @date 2019/9/27 16:05
 */
@RequestMapping("/admin")
@Controller("adminSysLoginController")
public class SysLoginController extends BaseController {

    Logger logger = LoggerFactory.getLogger(SysLoginController.class);

    /**
     * 系统菜单 Service
     */
    @Autowired
    private ISysMenuService sysMenuService;

    /**
     * 后台管理首页
     *
     * @param model
     * @return
     */
    @GetMapping({"", "/index"})
    public String indexUI(Model model) {
        return "admin/index";
    }

    /**
     * 后台管理欢迎页
     *
     * @param model
     * @return
     */
    @ApiOperation("后台管理欢迎页")
    @GetMapping("/welcome-ui")
    public String welcomeUI(Model model) {
        return "admin/welcome";
    }

    /**
     * 系统首页初始化菜单树数据
     * 根据当前用户的角色过滤菜单：admin角色看到全部菜单，其他用户看到其角色授权的菜单
     * @return 菜单树数据
     * @throws Exception 异常
     */
    @ApiOperation("系统首页初始化菜单树数据")
    @GetMapping("/list/index/menu/tree")
    @ResponseBody
    public Result tree() throws Exception {
        SysUserDTO userDTO = getSysUserDTO();
        Map<String, Object> result;
        if (userDTO != null && CollectionUtils.isNotEmpty(userDTO.getSysRoleDTOs())) {
            // 判断是否 admin 角色，admin 看到全部菜单
            boolean isAdmin = userDTO.getSysRoleDTOs().stream()
                    .anyMatch(role -> "admin".equals(role.getCode()));
            if (isAdmin) {
                result = sysMenuService.listIndexMenuTree();
            } else {
                List<String> roleIds = userDTO.getSysRoleDTOs().stream()
                        .map(SysRoleDTO::getId)
                        .collect(Collectors.toList());
                result = sysMenuService.listIndexMenuTree(roleIds);
            }
        } else {
            // 用户无角色或获取失败时返回空菜单（安全关闭原则）
            result = sysMenuService.listIndexMenuTree(new ArrayList<>());
        }
        return Result.success(result);
    }

    /**
     * 用户搜索系统首页初始化菜单树数据
     * 根据当前用户的角色过滤搜索结果
     * @param menuName 菜单名字
     * @return 菜单树数据
     * @throws Exception 异常
     */
    @ApiOperation("系统首页初始化菜单树数据")
    @GetMapping("/list/index/menu/search/tree/{menuName}")
    @ResponseBody
    public Result searchTree(@PathVariable String menuName) throws Exception {
        SysUserDTO userDTO = getSysUserDTO();
        Map<String, Object> result;
        if (userDTO != null && CollectionUtils.isNotEmpty(userDTO.getSysRoleDTOs())) {
            boolean isAdmin = userDTO.getSysRoleDTOs().stream()
                    .anyMatch(role -> "admin".equals(role.getCode()));
            if (isAdmin) {
                result = sysMenuService.listIndexMenuSearchTree(menuName);
            } else {
                List<String> roleIds = userDTO.getSysRoleDTOs().stream()
                        .map(SysRoleDTO::getId)
                        .collect(Collectors.toList());
                result = sysMenuService.listIndexMenuSearchTree(menuName, roleIds);
            }
        } else {
            // 用户无角色或获取失败时返回空菜单（安全关闭原则）
            result = sysMenuService.listIndexMenuSearchTree(menuName, new ArrayList<>());
        }
        return Result.success(result);
    }

}
