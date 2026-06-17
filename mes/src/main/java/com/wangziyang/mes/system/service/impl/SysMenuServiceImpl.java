package com.wangziyang.mes.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wangziyang.mes.common.util.TreeUtil;
import com.wangziyang.mes.system.dto.SysMenuDTO;
import com.wangziyang.mes.system.entity.SysMenu;
import com.wangziyang.mes.system.mapper.SysMenuMapper;
import com.wangziyang.mes.system.service.ISysMenuService;
import com.wangziyang.mes.system.vo.TreeVO;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-16
 */
@Service
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements ISysMenuService {

    @Autowired
    private SysMenuMapper sysMenuMapper;

    /**
     * 根据角色id查询菜单列表
     *
     * @param roleId
     * @return
     * @throws Exception
     */
    @Override
    public List<SysMenuDTO> listByRoleId(String roleId) throws Exception {
        return sysMenuMapper.listByRoleId(roleId);
    }

    /**
     * 系统首页初始化菜单树数据
     *
     * @return 系统首页初始化菜单树数据
     * @throws Exception 异常
     */
    @Override
    public Map<String, Object> listIndexMenuTree() throws Exception {
        List<SysMenu> sysMenus = sysMenuMapper.selectList(
                new QueryWrapper<SysMenu>().orderBy(true, true, "sort_num"));
        return buildMenuTreeResult(sysMenus);
    }

    /**
     * 根据角色ID列表过滤系统首页初始化菜单树数据
     *
     * @param roleIds 角色ID列表
     * @return 系统首页初始化菜单树数据
     * @throws Exception 异常
     */
    @Override
    public Map<String, Object> listIndexMenuTree(List<String> roleIds) throws Exception {
        List<SysMenu> sysMenus;
        if (CollectionUtils.isEmpty(roleIds)) {
            // roleIds为空时返回空菜单（安全关闭原则）
            sysMenus = new ArrayList<>();
        } else {
            sysMenus = sysMenuMapper.listByRoleIds(roleIds);
            // 确保父菜单也包含在内，避免子菜单因缺少父节点而被丢弃
            sysMenus = ensureParentMenus(sysMenus);
        }
        return buildMenuTreeResult(sysMenus);
    }

    /**
     * 确保角色菜单列表包含所有必要的父菜单，防止子菜单成为孤儿节点
     */
    private List<SysMenu> ensureParentMenus(List<SysMenu> menus) {
        if (CollectionUtils.isEmpty(menus)) {
            return menus;
        }
        Set<String> existingIds = menus.stream().map(SysMenu::getId).collect(Collectors.toSet());
        List<SysMenu> result = new ArrayList<>(menus);
        // 递归查找缺失的父菜单
        for (SysMenu menu : menus) {
            String parentId = menu.getParentId();
            if (!"0".equals(parentId) && !existingIds.contains(parentId)) {
                SysMenu parent = sysMenuMapper.selectById(parentId);
                if (parent != null && !existingIds.contains(parent.getId())) {
                    result.add(parent);
                    existingIds.add(parent.getId());
                    // 递归检查父菜单的父菜单
                    addMissingAncestors(parent, result, existingIds);
                }
            }
        }
        return result;
    }

    private void addMissingAncestors(SysMenu menu, List<SysMenu> result, Set<String> existingIds) {
        String parentId = menu.getParentId();
        if (!"0".equals(parentId) && !existingIds.contains(parentId)) {
            SysMenu parent = sysMenuMapper.selectById(parentId);
            if (parent != null && !existingIds.contains(parent.getId())) {
                result.add(parent);
                existingIds.add(parent.getId());
                addMissingAncestors(parent, result, existingIds);
            }
        }
    }

    /**
     * 构建菜单树结果
     */
    private Map<String, Object> buildMenuTreeResult(List<SysMenu> sysMenus) {
        Map<String, Object> result = new LinkedHashMap<>(4);

        Map<String, String> clearInfo = new HashMap<>(2);
        clearInfo.put("clearUrl", "json/clear.json");

        Map<String, String> homeInfo = new HashMap<>(4);
        homeInfo.put("name", "首页");
        homeInfo.put("icon", "fa fa-home");
        homeInfo.put("url", "admin/welcome-ui");

        Map<String, String> logoInfo = new HashMap<>(4);
        logoInfo.put("name", "黑科制造MES");
        logoInfo.put("image", "/image/logo.png");
        logoInfo.put("url", "");

        Map<String, Object> menuInfo = new LinkedHashMap<>(8);

        List<TreeVO<SysMenu>> menus = new ArrayList<>();
        for (SysMenu m : sysMenus) {
            TreeVO<SysMenu> tree = new TreeVO<>();
            tree.setId(m.getId());
            tree.setPid(m.getParentId());
            tree.setCode(m.getCode());
            tree.setName(m.getName());
            tree.setUrl(m.getUrl());
            tree.setIcon(m.getIcon());
            tree.setType(m.getType());
            tree.setPermission(m.getPermission());
            tree.setTarget("_self");
            menus.add(tree);
        }
        List<TreeVO<SysMenu>> treeVOS = TreeUtil.buildList(menus, "0");
        for (TreeVO<SysMenu> mTree : treeVOS) {
            menuInfo.put(mTree.getCode(), mTree);
        }

        result.put("clearInfo", clearInfo);
        result.put("homeInfo", homeInfo);
        result.put("logoInfo", logoInfo);
        result.put("menuInfo", menuInfo);

        return result;
    }

    /**
     * 用户搜索系统首页初始化菜单树数据
     * @param menuName 菜单名字
     * @return 菜单树数据
     * @throws Exception 异常
     */
    @Override
    public Map<String, Object> listIndexMenuSearchTree(String menuName) throws Exception {
        return buildMenuSearchResult(sysMenuMapper.listBySearchByName(menuName));
    }

    /**
     * 用户搜索系统首页初始化菜单树数据（根据角色过滤）
     * @param menuName 菜单名字
     * @param roleIds  角色ID列表
     * @return 菜单树数据
     * @throws Exception 异常
     */
    @Override
    public Map<String, Object> listIndexMenuSearchTree(String menuName, List<String> roleIds) throws Exception {
        List<SysMenu> sysMenus;
        if (CollectionUtils.isEmpty(roleIds)) {
            // roleIds为空时返回空搜索结果（安全关闭原则）
            sysMenus = new ArrayList<>();
        } else {
            // 先按角色过滤出所有可见菜单ID，再在其中搜索
            List<SysMenu> roleMenus = sysMenuMapper.listByRoleIds(roleIds);
            if (CollectionUtils.isEmpty(roleMenus)) {
                return buildMenuSearchResult(new ArrayList<>());
            }
            Set<String> roleMenuIds = roleMenus.stream().map(SysMenu::getId).collect(Collectors.toSet());
            sysMenus = sysMenuMapper.listBySearchByName(menuName).stream()
                    .filter(m -> roleMenuIds.contains(m.getId()))
                    .collect(Collectors.toList());
        }
        return buildMenuSearchResult(sysMenus);
    }

    /**
     * 构建菜单搜索结果
     */
    private Map<String, Object> buildMenuSearchResult(List<SysMenu> sysMenus) {
        Map<String, Object> result = new LinkedHashMap<>(4);
        Map<String, Object> menuInfo = new LinkedHashMap<>(8);
        List<TreeVO<SysMenu>> menus = new ArrayList<>();
        for (SysMenu m : sysMenus) {
            TreeVO<SysMenu> tree = new TreeVO<>();
            tree.setId(m.getId());
            tree.setPid(m.getParentId());
            tree.setCode(m.getCode());
            tree.setName(m.getName());
            tree.setUrl(m.getUrl());
            tree.setIcon(m.getIcon());
            tree.setType(m.getType());
            tree.setPermission(m.getPermission());
            // TODO 是否需要更改？
            tree.setTarget("_self");
            menus.add(tree);
        }
        List<TreeVO<SysMenu>> treeVOS = TreeUtil.buildList(menus, "0");
        for (TreeVO<SysMenu> mTree : treeVOS) {
            menuInfo.put(mTree.getCode(), mTree);
        }
        result.put("menuInfo", menuInfo);
        return result;
    }

    /**
     * 获取系统菜单树
     *
     * @return 系统菜单树
     * @throws Exception 异常
     */
    @Override
    public List<TreeVO<SysMenu>> listMenuTree() throws Exception {
        List<TreeVO<SysMenu>> menus = new ArrayList<>();
        List<SysMenu> sysMenus = sysMenuMapper.selectList(null);
        for (SysMenu m : sysMenus) {
            TreeVO<SysMenu> tree = new TreeVO<>();
            tree.setId(m.getId());
            tree.setPid(m.getParentId());
            tree.setCode(m.getCode());
            tree.setName(m.getName());
            tree.setUrl(m.getUrl());
            tree.setIcon(m.getIcon());
            tree.setType(m.getType());
            tree.setPermission(m.getPermission());
            menus.add(tree);
        }
        return TreeUtil.buildList(menus, "0");
    }
}
