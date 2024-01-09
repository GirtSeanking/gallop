package com.ruoyi.project.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.system.domain.SysUserAudit;
import com.ruoyi.project.system.service.ISysUserAuditService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 用户认证审核Controller
 * 
 * @author gallop
 * @date 2023-09-14
 */
@RestController
@RequestMapping("/system/audit")
public class SysUserAuditController extends BaseController
{
    @Autowired
    private ISysUserAuditService sysUserAuditService;

    /**
     * 查询用户认证审核列表
     */
    @PreAuthorize("@ss.hasPermi('system:audit:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysUserAudit sysUserAudit)
    {
        startPage();
        List<SysUserAudit> list = sysUserAuditService.selectSysUserAuditList(sysUserAudit);
        return getDataTable(list);
    }

    /**
     * 导出用户认证审核列表
     */
    @PreAuthorize("@ss.hasPermi('system:audit:export')")
    @Log(title = "用户认证审核", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysUserAudit sysUserAudit)
    {
        List<SysUserAudit> list = sysUserAuditService.selectSysUserAuditList(sysUserAudit);
        ExcelUtil<SysUserAudit> util = new ExcelUtil<SysUserAudit>(SysUserAudit.class);
        util.exportExcel(response, list, "用户认证审核数据");
    }

    /**
     * 获取用户认证审核详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:audit:query')")
    @GetMapping(value = "/{userAuditId}")
    public AjaxResult getInfo(@PathVariable("userAuditId") Long userAuditId)
    {
        return success(sysUserAuditService.selectSysUserAuditByUserAuditId(userAuditId));
    }

    /**
     * 新增用户认证审核
     */
    @PreAuthorize("@ss.hasPermi('system:audit:add')")
    @Log(title = "用户认证审核", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysUserAudit sysUserAudit)
    {
        return toAjax(sysUserAuditService.insertSysUserAudit(sysUserAudit));
    }

    /**
     * 修改用户认证审核
     */
    @PreAuthorize("@ss.hasPermi('system:audit:edit')")
    @Log(title = "用户认证审核", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysUserAudit sysUserAudit)
    {
        return toAjax(sysUserAuditService.updateSysUserAudit(sysUserAudit));
    }

    /**
     * 删除用户认证审核
     */
    @PreAuthorize("@ss.hasPermi('system:audit:remove')")
    @Log(title = "用户认证审核", businessType = BusinessType.DELETE)
	@DeleteMapping("/{userAuditIds}")
    public AjaxResult remove(@PathVariable Long[] userAuditIds)
    {
        return toAjax(sysUserAuditService.deleteSysUserAuditByUserAuditIds(userAuditIds));
    }
}
