package com.ruoyi.project.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 车型信息对象 car_type
 * 
 * @author gallop
 * @date 2023-09-11
 */
public class CarTypeInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 车型编号 */
    private Long carTypeId;

    /** 车型名称 */
    @Excel(name = "车型名称")
    private String carTypeName;

    /** 车型状态（0正常 1停用） */
    @Excel(name = "车型状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public void setCarTypeId(Long carTypeId) 
    {
        this.carTypeId = carTypeId;
    }

    public Long getCarTypeId() 
    {
        return carTypeId;
    }
    public void setCarTypeName(String carTypeName) 
    {
        this.carTypeName = carTypeName;
    }

    public String getCarTypeName() 
    {
        return carTypeName;
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
            .append("carTypeId", getCarTypeId())
            .append("carTypeName", getCarTypeName())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
