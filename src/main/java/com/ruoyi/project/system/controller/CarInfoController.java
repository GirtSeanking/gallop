package com.ruoyi.project.system.controller;

import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.framework.aspectj.lang.annotation.Anonymous;
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
import com.ruoyi.project.system.domain.CarInfo;
import com.ruoyi.project.system.service.ICarInfoService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 车辆信息Controller
 *
 * @author gallop
 * @date 2023-09-11
 */
@RestController
@RequestMapping("/system/carInfo")
public class CarInfoController extends BaseController
{
    @Autowired
    private ICarInfoService carInfoService;

    /**
     * 查询车辆信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:carInfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(CarInfo carInfo)
    {
        startPage();
        List<CarInfo> list = carInfoService.selectCarInfoList(carInfo);
        return getDataTable(list);
    }

    /**
     * 查询车辆信息列表
     */
    @Anonymous
    @PostMapping("/listForCustomer")
    public TableDataInfo listForCustomer(@RequestBody CarInfo carInfo)
    {
        startPage();
        List<CarInfo> list = carInfoService.selectCarInfoListForCustomer(carInfo);
        return getDataTable(list);
    }

    /**
     * 导出车辆信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:carInfo:export')")
    @Log(title = "车辆信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CarInfo carInfo)
    {
        List<CarInfo> list = carInfoService.selectCarInfoList(carInfo);
        ExcelUtil<CarInfo> util = new ExcelUtil<CarInfo>(CarInfo.class);
        util.exportExcel(response, list, "车辆信息数据");
    }

    /**
     * 获取车辆信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:carInfo:query')")
    @GetMapping(value = "/{carId}")
    public AjaxResult getInfo(@PathVariable("carId") Long carId)
    {
        return success(carInfoService.selectCarInfoByCarId(carId));
    }

    /**
     * 新增车辆信息
     */
    @PreAuthorize("@ss.hasPermi('system:carInfo:add')")
    @Log(title = "车辆信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CarInfo carInfo)
    {
        return toAjax(carInfoService.insertCarInfo(carInfo));
    }

    /**
     * 修改车辆信息
     */
    @PreAuthorize("@ss.hasPermi('system:carInfo:edit')")
    @Log(title = "车辆信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CarInfo carInfo)
    {
        return toAjax(carInfoService.updateCarInfo(carInfo));
    }

    /**
     * 删除车辆信息
     */
    @PreAuthorize("@ss.hasPermi('system:carInfo:remove')")
    @Log(title = "车辆信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{carIds}")
    public AjaxResult remove(@PathVariable Long[] carIds)
    {
        return toAjax(carInfoService.deleteCarInfoByCarIds(carIds));
    }
}
