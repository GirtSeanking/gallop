package com.ruoyi.project.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.framework.aspectj.lang.annotation.Anonymous;
import com.ruoyi.project.system.domain.SysUser;
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
import com.ruoyi.project.system.domain.BrandInfo;
import com.ruoyi.project.system.service.IBrandInfoService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 品牌信息Controller
 * 
 * @author gallop
 * @date 2023-09-11
 */
@RestController
@RequestMapping("/system/brand")
public class BrandInfoController extends BaseController
{
    @Autowired
    private IBrandInfoService brandInfoService;

    /**
     * 查询品牌信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:brand:list')")
    @GetMapping("/list")
    public TableDataInfo list(BrandInfo brandInfo)
    {
        startPage();
        List<BrandInfo> list = brandInfoService.selectBrandInfoList(brandInfo);
        return getDataTable(list);
    }

    /**
     * 查询所有品牌信息列表
     */
    @Anonymous
    @GetMapping("/listAll")
    public AjaxResult listAll(BrandInfo brandInfo)
    {
        List<BrandInfo> list = brandInfoService.selectBrandInfoList(brandInfo);
        return success(list);
    }

    /**
     * 导出品牌信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:brand:export')")
    @Log(title = "品牌信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BrandInfo brandInfo)
    {
        List<BrandInfo> list = brandInfoService.selectBrandInfoList(brandInfo);
        ExcelUtil<BrandInfo> util = new ExcelUtil<BrandInfo>(BrandInfo.class);
        util.exportExcel(response, list, "品牌信息数据");
    }

    /**
     * 获取品牌信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:brand:query')")
    @GetMapping(value = "/{brandId}")
    public AjaxResult getInfo(@PathVariable("brandId") Long brandId)
    {
        return success(brandInfoService.selectBrandInfoByBrandId(brandId));
    }

    /**
     * 新增品牌信息
     */
    @PreAuthorize("@ss.hasPermi('system:brand:add')")
    @Log(title = "品牌信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BrandInfo brandInfo)
    {
        return toAjax(brandInfoService.insertBrandInfo(brandInfo));
    }

    /**
     * 修改品牌信息
     */
    @PreAuthorize("@ss.hasPermi('system:brand:edit')")
    @Log(title = "品牌信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BrandInfo brandInfo)
    {
        return toAjax(brandInfoService.updateBrandInfo(brandInfo));
    }

    /**
     * 删除品牌信息
     */
    @PreAuthorize("@ss.hasPermi('system:brand:remove')")
    @Log(title = "品牌信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{brandIds}")
    public AjaxResult remove(@PathVariable Long[] brandIds)
    {
        return toAjax(brandInfoService.deleteBrandInfoByBrandIds(brandIds));
    }

    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermi('system:brand:edit')")
    @Log(title = "品牌信息", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody BrandInfo brandInfo)
    {
        brandInfo.setUpdateBy(getUsername());
        return toAjax(brandInfoService.updateBrandStatus(brandInfo));
    }
}
