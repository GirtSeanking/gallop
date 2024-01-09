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
import com.ruoyi.project.system.domain.RepairInfo;
import com.ruoyi.project.system.service.IRepairInfoService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 维修信息Controller
 * 
 * @author gallop
 * @date 2023-09-17
 */
@RestController
@RequestMapping("/system/repair")
public class RepairInfoController extends BaseController
{
    @Autowired
    private IRepairInfoService repairInfoService;

    /**
     * 查询维修信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:repair:list')")
    @GetMapping("/list")
    public TableDataInfo list(RepairInfo repairInfo)
    {
        startPage();
        List<RepairInfo> list = repairInfoService.selectRepairInfoList(repairInfo);
        return getDataTable(list);
    }

    /**
     * 导出维修信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:repair:export')")
    @Log(title = "维修信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, RepairInfo repairInfo)
    {
        List<RepairInfo> list = repairInfoService.selectRepairInfoList(repairInfo);
        ExcelUtil<RepairInfo> util = new ExcelUtil<RepairInfo>(RepairInfo.class);
        util.exportExcel(response, list, "维修信息数据");
    }

    /**
     * 获取维修信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:repair:query')")
    @GetMapping(value = "/{repairId}")
    public AjaxResult getInfo(@PathVariable("repairId") Long repairId)
    {
        return success(repairInfoService.selectRepairInfoByRepairId(repairId));
    }

    /**
     * 新增维修信息
     */
    @PreAuthorize("@ss.hasPermi('system:repair:add')")
    @Log(title = "维修信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RepairInfo repairInfo)
    {
        return toAjax(repairInfoService.insertRepairInfo(repairInfo));
    }

    /**
     * 修改维修信息
     */
    @PreAuthorize("@ss.hasPermi('system:repair:edit')")
    @Log(title = "维修信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RepairInfo repairInfo)
    {
        return toAjax(repairInfoService.updateRepairInfo(repairInfo));
    }

    /**
     * 删除维修信息
     */
    @PreAuthorize("@ss.hasPermi('system:repair:remove')")
    @Log(title = "维修信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{repairIds}")
    public AjaxResult remove(@PathVariable Long[] repairIds)
    {
        return toAjax(repairInfoService.deleteRepairInfoByRepairIds(repairIds));
    }
}
