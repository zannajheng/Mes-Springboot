package com.wangziyang.mes.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wangziyang.mes.system.dto.SysMenuDTO;
import com.wangziyang.mes.system.entity.SysMenu;
import com.wangziyang.mes.system.vo.TreeVO;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-16
 */
public interface ISysMenuService extends IService<SysMenu> {


    /**
     * 根据角色id查询菜单列表
     *
     * @param roleId
     * @return
     * @throws Exception
     */
    List<SysMenuDTO> listByRoleId(String roleId) throws Exception;

    /**
     * 系统首页初始化菜单树数据
     *
     * @return 系统首页初始化菜单树数据
     * @throws Exception 异常
     */
    Map<String, Object> listIndexMenuTree() throws Exception;

    /**
     * 根据角色ID列表过滤系统首页初始化菜单树数据
     *
     * @param roleIds 角色ID列表，非空时按角色过滤菜单；为空则返回全部菜单
     * @return 系统首页初始化菜单树数据
     * @throws Exception 异常
     */
    Map<String, Object> listIndexMenuTree(List<String> roleIds) throws Exception;


    /**
     * 用户搜索系统首页初始化菜单树数据
     *
     * @return 系统首页初始化菜单树数据
     * @throws Exception 异常
     */
    Map<String, Object> listIndexMenuSearchTree(String menuName) throws Exception;

    /**
     * 用户搜索系统首页初始化菜单树数据（根据角色过滤）
     *
     * @param menuName 菜单名字
     * @param roleIds  角色ID列表，非空时按角色过滤菜单
     * @return 菜单树数据
     * @throws Exception 异常
     */
    Map<String, Object> listIndexMenuSearchTree(String menuName, List<String> roleIds) throws Exception;


    /**
     * 获取系统菜单树
     *
     * @return 系统菜单树
     * @throws Exception 异常
     */
    List<TreeVO<SysMenu>> listMenuTree() throws Exception;
}
