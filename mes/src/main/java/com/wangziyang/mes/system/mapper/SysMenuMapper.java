package com.wangziyang.mes.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wangziyang.mes.system.dto.SysMenuDTO;
import com.wangziyang.mes.system.entity.SysMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-16
 */
public interface SysMenuMapper extends BaseMapper<SysMenu> {

    /**
     * 根据角色id查询菜单列表
     *
     * @param roleId
     * @return
     * @throws Exception
     */
    List<SysMenuDTO> listByRoleId(String roleId) throws Exception;

    /**
     * 根据用户输入的菜单名称 模糊匹配
     *
     * @param menuName 菜单名称
     * @return 用户结果
     * @throws Exception 异常
     */
    List<SysMenu> listBySearchByName(String menuName) throws Exception;

    /**
     * 根据多个角色id查询菜单列表（去重）
     *
     * @param roleIds 角色ID列表
     * @return 菜单列表
     * @throws Exception 异常
     */
    List<SysMenu> listByRoleIds(@Param("roleIds") List<String> roleIds) throws Exception;
}
