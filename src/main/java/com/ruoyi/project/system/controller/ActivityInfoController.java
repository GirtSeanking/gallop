package com.ruoyi.project.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.framework.aspectj.lang.annotation.Anonymous;
import com.ruoyi.project.system.domain.BrandInfo;
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
import com.ruoyi.project.system.domain.ActivityInfo;
import com.ruoyi.project.system.service.IActivityInfoService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 活动信息Controller
 * 
 * @author gallop
 * @date 2023-09-11
 */
@RestController
@RequestMapping("/system/activity")
public class ActivityInfoController extends BaseController
{
    @Autowired
    private IActivityInfoService activityInfoService;

    /**
     * 查询活动信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:activity:list')")
    @GetMapping("/list")
    public TableDataInfo list(ActivityInfo activityInfo)
    {
        startPage();
        List<ActivityInfo> list = activityInfoService.selectActivityInfoList(activityInfo);
        return getDataTable(list);
    }

    @Anonymous
    @GetMapping("/listForCustomer")
    public TableDataInfo listForCustomer(ActivityInfo activityInfo) {
        startPage();
        List<ActivityInfo> list = activityInfoService.selectActivityInfoList(activityInfo);
        return getDataTable(list);
    }

    /**
     * 导出活动信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:activity:export')")
    @Log(title = "活动信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ActivityInfo activityInfo)
    {
        List<ActivityInfo> list = activityInfoService.selectActivityInfoList(activityInfo);
        ExcelUtil<ActivityInfo> util = new ExcelUtil<ActivityInfo>(ActivityInfo.class);
        util.exportExcel(response, list, "活动信息数据");
    }

    /**
     * 获取活动信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:activity:query')")
    @GetMapping(value = "/{activityId}")
    public AjaxResult getInfo(@PathVariable("activityId") Long activityId)
    {
        return success(activityInfoService.selectActivityInfoByActivityId(activityId));
    }

    /**
     * 新增活动信息
     */
    @PreAuthorize("@ss.hasPermi('system:activity:add')")
    @Log(title = "活动信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ActivityInfo activityInfo)
    {
        return toAjax(activityInfoService.insertActivityInfo(activityInfo));
    }

    /**
     * 修改活动信息
     */
    @PreAuthorize("@ss.hasPermi('system:activity:edit')")
    @Log(title = "活动信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ActivityInfo activityInfo)
    {
        return toAjax(activityInfoService.updateActivityInfo(activityInfo));
    }

    /**
     * 删除活动信息
     */
    @PreAuthorize("@ss.hasPermi('system:activity:remove')")
    @Log(title = "活动信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{activityIds}")
    public AjaxResult remove(@PathVariable Long[] activityIds)
    {
        return toAjax(activityInfoService.deleteActivityInfoByActivityIds(activityIds));
    }

    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermi('system:activity:edit')")
    @Log(title = "品牌信息", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody ActivityInfo activityInfo)
    {
        activityInfo.setUpdateBy(getUsername());
        return toAjax(activityInfoService.updateActivityStatus(activityInfo));
    }
}
