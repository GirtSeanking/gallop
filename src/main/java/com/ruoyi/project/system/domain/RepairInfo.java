package com.ruoyi.project.system.domain;

import com.ruoyi.framework.aspectj.lang.annotation.Excels;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 维修信息对象 repair_info
 * 
 * @author gallop
 * @date 2023-09-17
 */
public class RepairInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 维修记录编号 */
    private Long repairId;

    /** 车辆编号 */
    @Excel(name = "车辆编号")
    private Long carId;

    /** 维修内容 */
    @Excel(name = "维修内容")
    private String repairContent;

    /** 维修状态（0取消 1维修中 2完成） */
    @Excel(name = "维修状态", readConverterExp = "0=取消,1=维修中,2=完成")
    private String status;

    @Excels({@Excel(name = "车辆名称", targetAttr = "carName"), @Excel(name = "车型", targetAttr = "carTypeName"), @Excel(name = "品牌", targetAttr = "brandName"), @Excel(name = "门店", targetAttr = "deptName")})
    private CarInfo carInfo;

    private Long brandId;

    public Long getBrandId() {
        return brandId;
    }

    public void setBrandId(Long brandId) {
        this.brandId = brandId;
    }

    public CarInfo getCarInfo() {
        return carInfo;
    }

    public void setCarInfo(CarInfo carInfo) {
        this.carInfo = carInfo;
    }

    public void setRepairId(Long repairId)
    {
        this.repairId = repairId;
    }

    public Long getRepairId() 
    {
        return repairId;
    }
    public void setCarId(Long carId) 
    {
        this.carId = carId;
    }

    public Long getCarId() 
    {
        return carId;
    }
    public void setRepairContent(String repairContent) 
    {
        this.repairContent = repairContent;
    }

    public String getRepairContent() 
    {
        return repairContent;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("repairId", getRepairId())
            .append("carId", getCarId())
            .append("repairContent", getRepairContent())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("carInfo", getCarInfo())
            .toString();
    }
}
