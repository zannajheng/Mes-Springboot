package com.wangziyang.mes.common;

import com.wangziyang.mes.system.dto.SysUserDTO;
import com.wangziyang.mes.system.entity.SysUser;
import com.wangziyang.mes.system.service.ISysUserService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 基础前端控制器
 *
 * @author SongPeng
 * @date 2019/9/27 16:05
 */
public class BaseController {

    @Autowired
    private ISysUserService sysUserService;

    public SysUser getSysUser() {
        Object principal = SecurityUtils.getSubject().getPrincipal();
        String username = null;
        if (principal instanceof SysUser) {
            return (SysUser) principal;
        } else if (principal instanceof SysUserDTO) {
            return (SysUser) principal;
        } else if (principal instanceof String) {
            username = (String) principal;
        }
        if (username != null) {
            try {
                SysUserDTO dto = sysUserService.getUserAndRoleAndMenuByUsername(username);
                if (dto != null) {
                    SysUser user = new SysUser();
                    user.setId(dto.getId());
                    user.setName(dto.getName());
                    user.setUsername(dto.getUsername());
                    user.setPassword(dto.getPassword());
                    user.setDeptId(dto.getDeptId());
                    user.setEmail(dto.getEmail());
                    user.setMobile(dto.getMobile());
                    user.setTel(dto.getTel());
                    user.setSex(dto.getSex());
                    user.setBirthday(dto.getBirthday());
                    user.setPicId(dto.getPicId());
                    user.setDeleted(dto.getDeleted());
                    return user;
                }
            } catch (Exception e) {
                return null;
            }
        }
        return null;
    }

    /**
     * 获取当前登录用户的完整信息（含角色和菜单）
     *
     * @return SysUserDTO，包含角色列表和菜单列表
     */
    public SysUserDTO getSysUserDTO() {
        Object principal = SecurityUtils.getSubject().getPrincipal();
        String username = null;
        if (principal instanceof SysUserDTO) {
            return (SysUserDTO) principal;
        } else if (principal instanceof SysUser) {
            username = ((SysUser) principal).getUsername();
        } else if (principal instanceof String) {
            username = (String) principal;
        }
        if (username != null) {
            try {
                return sysUserService.getUserAndRoleAndMenuByUsername(username);
            } catch (Exception e) {
                return null;
            }
        }
        return null;
    }

    /**
     * 检查当前登录用户是否是admin角色
     *
     * @return true 表示当前用户拥有admin角色
     */
    public boolean isAdmin() {
        SysUserDTO userDTO = getSysUserDTO();
        if (userDTO != null && userDTO.getSysRoleDTOs() != null) {
            return userDTO.getSysRoleDTOs().stream()
                    .anyMatch(role -> "admin".equals(role.getCode()));
        }
        return false;
    }
}
