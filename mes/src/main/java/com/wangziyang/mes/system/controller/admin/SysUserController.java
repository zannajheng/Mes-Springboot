package com.wangziyang.mes.system.controller.admin;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wangziyang.mes.common.BaseController;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.system.dto.SysRoleDTO;
import com.wangziyang.mes.system.dto.SysUserDTO;
import com.wangziyang.mes.system.entity.SysDepartment;
import com.wangziyang.mes.system.entity.SysUser;
import com.wangziyang.mes.system.entity.SysUserRole;
import com.wangziyang.mes.system.request.SysUserPageReq;
import com.wangziyang.mes.system.service.ISysRoleService;
import com.wangziyang.mes.system.service.ISysDepartmentService;
import com.wangziyang.mes.system.service.ISysUserRoleService;
import com.wangziyang.mes.system.service.ISysUserService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-15
 */
@Controller("adminSysUserController")
@RequestMapping("/admin/sys/user")
public class SysUserController extends BaseController {

    Logger logger = LoggerFactory.getLogger(SysUserController.class);

    @Autowired
    private ISysUserService sysUserService;

    @Autowired
    private ISysRoleService sysRoleService;

    @Autowired
    private ISysDepartmentService sysDepartmentService;

    @Autowired
    private ISysUserRoleService sysUserRoleService;

    @GetMapping("/list-ui")
    public String listUI(Model model) {
        return "admin/system/user/list";
    }

    @PostMapping("/page")
    @ResponseBody
    public Result page(SysUserPageReq req) throws Exception {
        QueryWrapper qw = new QueryWrapper();
        if (StringUtils.isNotEmpty(req.getNameLike())) {
            qw.like("name", req.getNameLike());
        }
        if (StringUtils.isNotEmpty(req.getUsernameLike())) {
            qw.like("username", req.getUsernameLike());
        }
        // 用户管理列表展示全部状态（正常、已删除、已禁用）的用户，方便统一管理
        qw.orderByDesc(req.getOrderBy());
        IPage<SysUser> page = sysUserService.page(req, qw);
        List<SysUser> records = page.getRecords();
        if (records != null) {
            for (SysUser user : records) {
                if (StringUtils.isNotEmpty(user.getDeptId())) {
                    SysDepartment dept = sysDepartmentService.getById(user.getDeptId());
                    if (dept != null) {
                        user.setDeptName(dept.getName());
                    }
                }
            }
        }
        return Result.success(page);
    }

    @GetMapping("/add-or-update-ui")
    public String addOrUpdateUI(SysUser record, Model model) throws Exception {
        if (StringUtils.isNotEmpty(record.getId())) {
            SysUser result = sysUserService.getById(record.getId());
            model.addAttribute("result", result);
        }
        List<SysRoleDTO> sysRoles = sysRoleService.listByUserId(record.getId());
        model.addAttribute("sysRoles", sysRoles);
        model.addAttribute("departments", sysDepartmentService.list());
        model.addAttribute("isAdmin", isAdmin());
        return "admin/system/user/addOrUpdate";
    }

    @PostMapping("/add-or-update")
    @ResponseBody
    public Result addOrUpdate(SysUserDTO record) throws Exception {
        if (StringUtils.isBlank(record.getName())) {
            return Result.failure("姓名不能为空");
        }
        if (StringUtils.isBlank(record.getUsername())) {
            return Result.failure("用户名不能为空");
        }
        if (StringUtils.isBlank(record.getDeptId())) {
            return Result.failure("部门不能为空");
        }
        if (StringUtils.isBlank(record.getEmail())) {
            return Result.failure("邮箱不能为空");
        }
        if (StringUtils.isBlank(record.getMobile())) {
            return Result.failure("手机号不能为空");
        }
        if (StringUtils.isBlank(record.getSex())) {
            return Result.failure("性别不能为空");
        }
        if (StringUtils.isBlank(record.getBirthday())) {
            return Result.failure("出生年月日不能为空");
        }

        // 只有 admin 才能分配角色
        if (!isAdmin()) {
            record.setSysRoleIds(null);
        }
        if (StringUtils.isEmpty(record.getId())) {
            sysUserService.save(record);
        } else {
            sysUserService.update(record);
        }
        return Result.success(record.getId());
    }

    /**
     * 删除用户（物理删除，同时清理用户角色关联）
     */
    @PostMapping("/delete")
    @ResponseBody
    public Result delete(String id) {
        if (StringUtils.isNotEmpty(id)) {
            QueryWrapper<SysUserRole> qw = new QueryWrapper<>();
            qw.eq("user_id", id);
            sysUserRoleService.remove(qw);
            sysUserService.removeById(id);
        }
        return Result.success();
    }

    /**
     * 批量删除用户（物理删除，同时清理用户角色关联）
     */
    @PostMapping("/delete-batch")
    @ResponseBody
    public Result deleteBatch(@RequestParam("ids") String ids) {
        if (StringUtils.isNotEmpty(ids)) {
            String[] idArray = ids.split(",");
            List<String> idList = Arrays.asList(idArray);
            QueryWrapper<SysUserRole> qw = new QueryWrapper<>();
            qw.in("user_id", idList);
            sysUserRoleService.remove(qw);
            sysUserService.removeByIds(idList);
        }
        return Result.success();
    }

    @GetMapping("/current")
    @ResponseBody
    public Result current() throws Exception {
        Subject subject = SecurityUtils.getSubject();
        Object principal = subject.getPrincipal();
        String username = null;
        if (principal instanceof SysUserDTO) {
            username = ((SysUserDTO) principal).getUsername();
        } else if (principal instanceof String) {
            username = (String) principal;
        } else if (principal instanceof SysUser) {
            username = ((SysUser) principal).getUsername();
        }
        if (username == null) {
            return Result.success(null);
        }
        SysUser sysUser = sysUserService.lambdaQuery().eq(SysUser::getUsername, username).one();
        if (sysUser == null) {
            return Result.success(null);
        }
        SysUserDTO user = new SysUserDTO();
        user.setId(sysUser.getId());
        user.setName(sysUser.getName());
        user.setUsername(sysUser.getUsername());
        user.setPassword(sysUser.getPassword());
        user.setDeptId(sysUser.getDeptId());
        user.setEmail(sysUser.getEmail());
        user.setMobile(sysUser.getMobile());
        user.setTel(sysUser.getTel());
        user.setSex(sysUser.getSex());
        user.setBirthday(sysUser.getBirthday());
        user.setPicId(sysUser.getPicId());
        user.setDeleted(sysUser.getDeleted());
        return Result.success(user);
    }

    @PostMapping("/update-profile")
    @ResponseBody
    public Result updateProfile(SysUserDTO record) throws Exception {
        if (StringUtils.isBlank(record.getName())) {
            return Result.failure("姓名不能为空");
        }
        if (StringUtils.isBlank(record.getDeptId())) {
            return Result.failure("部门不能为空");
        }
        if (StringUtils.isBlank(record.getEmail())) {
            return Result.failure("邮箱不能为空");
        }
        if (StringUtils.isBlank(record.getMobile())) {
            return Result.failure("手机号不能为空");
        }
        if (StringUtils.isBlank(record.getSex())) {
            return Result.failure("性别不能为空");
        }
        if (StringUtils.isBlank(record.getBirthday())) {
            return Result.failure("出生年月日不能为空");
        }
        sysUserService.updateById(record);
        return Result.success();
    }

    @PostMapping("/change-password")
    @ResponseBody
    public Result changePassword(String oldPassword, String newPassword) throws Exception {
        Subject subject = SecurityUtils.getSubject();
        Object principal = subject.getPrincipal();
        String username = null;
        if (principal instanceof SysUserDTO) {
            username = ((SysUserDTO) principal).getUsername();
        } else if (principal instanceof String) {
            username = (String) principal;
        } else if (principal instanceof SysUser) {
            username = ((SysUser) principal).getUsername();
        }
        SysUserDTO sysUser = sysUserService.getUserAndRoleAndMenuByUsername(username);
        String encryptedOldPassword = new Md5Hash(oldPassword, sysUser.getUsername(), 3).toString();
        if (!encryptedOldPassword.equals(sysUser.getPassword())) {
            return Result.failure("原密码错误");
        }
        String encryptedNewPassword = new Md5Hash(newPassword, sysUser.getUsername(), 3).toString();
        sysUser.setPassword(encryptedNewPassword);
        sysUserService.updateById(sysUser);
        return Result.success();
    }

    private static final String AVATAR_DIR = System.getProperty("user.dir") + "/upload/avatar/";

    @PostMapping("/upload-avatar")
    @ResponseBody
    public Result uploadAvatar(@RequestParam("file") MultipartFile file) {
        try {
            File dir = new File(AVATAR_DIR);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            String originalFilename = file.getOriginalFilename();
            String ext = "";
            if (originalFilename != null && originalFilename.contains(".")) {
                ext = originalFilename.substring(originalFilename.lastIndexOf("."));
            }
            String filename = UUID.randomUUID().toString().replace("-", "") + ext;
            File dest = new File(dir, filename);
            file.transferTo(dest);
            return Result.success(filename);
        } catch (Exception e) {
            logger.error("上传头像失败", e);
            return Result.failure("上传失败");
        }
    }

    @GetMapping("/avatar/{filename}")
    @ResponseBody
    public org.springframework.core.io.Resource getAvatar(@PathVariable String filename) {
        File file = new File(AVATAR_DIR, filename);
        if (file.exists()) {
            return new org.springframework.core.io.FileSystemResource(file);
        }
        return null;
    }
}
