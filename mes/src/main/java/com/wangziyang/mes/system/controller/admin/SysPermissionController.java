package com.wangziyang.mes.system.controller.admin;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wangziyang.mes.common.BaseController;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.system.entity.SysMenu;
import com.wangziyang.mes.system.entity.SysRole;
import com.wangziyang.mes.system.entity.SysRoleMenu;
import com.wangziyang.mes.system.request.SysRolePageReq;
import com.wangziyang.mes.system.service.ISysMenuService;
import com.wangziyang.mes.system.service.ISysRoleMenuService;
import com.wangziyang.mes.system.service.ISysRoleService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Controller("adminSysPermissionController")
@RequestMapping("/admin/sys/permission")
public class SysPermissionController extends BaseController {

    @Autowired
    private ISysRoleService sysRoleService;

    @Autowired
    private ISysRoleMenuService sysRoleMenuService;

    @Autowired
    private ISysMenuService sysMenuService;

    @GetMapping("/list-ui")
    public String listUI(Model model) {
        model.addAttribute("isAdmin", isAdmin());
        return "admin/system/permission/list";
    }

	@PostMapping("/page")
	@ResponseBody
	public Result page(SysRolePageReq req) {
		QueryWrapper qw = new QueryWrapper();
		if (StringUtils.isNotEmpty(req.getNameLike())) {
			qw.like("name", req.getNameLike());
		}
		if (StringUtils.isNotEmpty(req.getCodeLike())) {
			qw.like("code", req.getCodeLike());
		}
		// 权限管理列表不显示 admin 角色，admin 由系统内置且不能给自己授权
		qw.ne("code", "admin");
		qw.orderByDesc(req.getOrderBy());
		IPage<SysRole> result = sysRoleService.page(req, qw);
		// 为每个角色统计已授权菜单数量
		for (SysRole role : result.getRecords()) {
			QueryWrapper<SysRoleMenu> countQw = new QueryWrapper<>();
			countQw.eq("role_id", role.getId());
			int count = sysRoleMenuService.count(countQw);
			role.setMenuAuthCount(count);
		}
		return Result.success(result);
	}

    @GetMapping("/add-or-update-ui")
    public String addOrUpdateUI(Model model, SysRole record) {
        if (!isAdmin()) {
            return "error/403";
        }
        if (StringUtils.isNotEmpty(record.getId())) {
            SysRole result = sysRoleService.getById(record.getId());
            model.addAttribute("result", result);
        }
        return "admin/system/permission/addOrUpdate";
    }

    @PostMapping("/add-or-update")
    @ResponseBody
    public Result addOrUpdate(SysRole record) {
        if (!isAdmin()) {
            return Result.failure("只有admin角色才能执行此操作");
        }
        sysRoleService.saveOrUpdate(record);
        return Result.success(record.getId());
    }

    @GetMapping("/auth-menu-ui")
    public String authMenuUI(Model model, String roleId) {
        if (!isAdmin()) {
            return "error/403";
        }
        model.addAttribute("roleId", roleId);
        SysRole role = sysRoleService.getById(roleId);
        model.addAttribute("roleCode", role != null ? role.getCode() : "");
        return "admin/system/permission/authMenu";
    }

    @GetMapping("/menu-ids")
    @ResponseBody
    public Result getMenuIdsByRoleId(String roleId) {
        if (!isAdmin()) {
            return Result.failure("只有admin角色才能执行此操作");
        }
        if (StringUtils.isEmpty(roleId)) {
            return Result.failure("角色ID不能为空");
        }
        SysRole role = sysRoleService.getById(roleId);
        if (role == null) {
            return Result.failure("角色不存在");
        }
        QueryWrapper<SysRoleMenu> qw = new QueryWrapper<>();
        qw.eq("role_id", roleId);
        List<SysRoleMenu> roleMenus = sysRoleMenuService.list(qw);
        List<String> menuIds = new ArrayList<>();
        for (SysRoleMenu rm : roleMenus) {
            menuIds.add(rm.getMenuId());
        }
        return Result.success(menuIds);
    }

    @PostMapping("/save-menu-auth")
    @ResponseBody
    public Result saveMenuAuth(String roleId, String menuIds) {
        if (!isAdmin()) {
            return Result.failure("只有admin角色才能执行此操作");
        }
        if (StringUtils.isEmpty(roleId)) {
            return Result.failure("角色ID不能为空");
        }
        SysRole role = sysRoleService.getById(roleId);
        if (role == null) {
            return Result.failure("角色不存在");
        }
        List<String> menuIdList = StringUtils.isNotEmpty(menuIds)
                ? new ArrayList<>(Arrays.asList(menuIds.split(",")))
                : new ArrayList<>();

        // 清洗：过滤空字符串并去重
        menuIdList = menuIdList.stream()
                .filter(StringUtils::isNotBlank)
                .distinct()
                .collect(Collectors.toList());

        // 非 admin 角色不允许被授权"权限管理"菜单
        boolean isTargetAdmin = "admin".equals(role.getCode());
        if (!isTargetAdmin) {
            Set<String> protectedMenuIds = sysMenuService.list().stream()
                    .filter(menu -> "权限管理".equals(menu.getName()))
                    .map(SysMenu::getId)
                    .collect(Collectors.toSet());
            if (!protectedMenuIds.isEmpty()) {
                menuIdList = menuIdList.stream()
                        .filter(id -> !protectedMenuIds.contains(id))
                        .collect(Collectors.toList());
            }
        }

        sysRoleMenuService.saveRoleMenuAuth(roleId, menuIdList);
        return Result.success();
    }

    @PostMapping("/delete")
    @ResponseBody
    @Transactional(rollbackFor = Exception.class)
    public Result delete(String id) {
        if (!isAdmin()) {
            return Result.failure("只有admin角色才能执行此操作");
        }
        sysRoleService.removeById(id);

        QueryWrapper<SysRoleMenu> qw = new QueryWrapper<>();
        qw.eq("role_id", id);
        sysRoleMenuService.remove(qw);

        return Result.success();
    }
}