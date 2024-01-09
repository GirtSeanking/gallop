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
import com.ruoyi.project.system.domain.CarTypeInfo;
import com.ruoyi.project.system.service.ICarTypeInfoService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 车型信息Controller
 * 
 * @author gallop
 * @date 2023-09-11
 */
@RestController
@RequestMapping("/system/carType")
public class CarTypeInfoController extends BaseController
{
    @Autowired
    private ICarTypeInfoService carTypeInfoService;

    /**
     * 查询车型信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:carType:list')")
    @GetMapping("/list")
    public TableDataInfo list(CarTypeInfo carTypeInfo)
    {
        startPage();
        List<CarTypeInfo> list = carTypeInfoService.selectCarTypeInfoList(carTypeInfo);
        return getDataTable(list);
    }

    /**
     * 查询所有车型信息列表
     */
    @Anonymous
    @GetMapping("/listAll")
    public AjaxResult listAll(CarTypeInfo carTypeInfo)
    {
        List<CarTypeInfo> list = carTypeInfoService.selectCarTypeInfoList(carTypeInfo);
        return success(list);
    }

    /**
     * 导出车型信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:carType:export')")
    @Log(title = "车型信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CarTypeInfo carTypeInfo)
    {
        List<CarTypeInfo> list = carTypeInfoService.selectCarTypeInfoList(carTypeInfo);
        ExcelUtil<CarTypeInfo> util = new ExcelUtil<CarTypeInfo>(CarTypeInfo.class);
        util.exportExcel(response, list, "车型信息数据");
    }

    /**
     * 获取车型信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:carType:query')")
    @GetMapping(value = "/{carTypeId}")
    public AjaxResult getInfo(@PathVariable("carTypeId") Long carTypeId)
    {
        return success(carTypeInfoService.selectCarTypeInfoByCarTypeId(carTypeId));
    }

    /**
     * 新增车型信息
     */
    @PreAuthorize("@ss.hasPermi('system:carType:add')")
    @Log(title = "车型信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CarTypeInfo carTypeInfo)
    {
        return toAjax(carTypeInfoService.insertCarTypeInfo(carTypeInfo));
    }

    /**
     * 修改车型信息
     */
    @PreAuthorize("@ss.hasPermi('system:carType:edit')")
    @Log(title = "车型信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CarTypeInfo carTypeInfo)
    {
        return toAjax(carTypeInfoService.updateCarTypeInfo(carTypeInfo));
    }

    /**
     * 删除车型信息
     */
    @PreAuthorize("@ss.hasPermi('system:carType:remove')")
    @Log(title = "车型信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{carTypeIds}")
    public AjaxResult remove(@PathVariable Long[] carTypeIds)
    {
        return carTypeInfoService.deleteCarTypeInfoByCarTypeIds(carTypeIds);
    }

    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermi('system:carType:edit')")
    @Log(title = "车型信息", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody CarTypeInfo carTypeInfo)
    {
        carTypeInfo.setUpdateBy(getUsername());
        return toAjax(carTypeInfoService.updateCarTypeStatus(carTypeInfo));
    }
}
