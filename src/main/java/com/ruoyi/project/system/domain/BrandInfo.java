package com.ruoyi.project.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 品牌信息对象 brand_info
 * 
 * @author gallop
 * @date 2023-09-11
 */
public class BrandInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 品牌编号 */
    private Long brandId;

    /** 品牌名称 */
    @Excel(name = "品牌名称")
    private String brandName;

    /** 品牌简介 */
    @Excel(name = "品牌简介")
    private String brandDes;

    /** 品牌状态（0正常 1停用） */
    @Excel(name = "品牌状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public void setBrandId(Long brandId) 
    {
        this.brandId = brandId;
    }

    public Long getBrandId() 
    {
        return brandId;
    }
    public void setBrandName(String brandName) 
    {
        this.brandName = brandName;
    }

    public String getBrandName() 
    {
        return brandName;
    }
    public void setBrandDes(String brandDes) 
    {
        this.brandDes = brandDes;
    }

    public String getBrandDes() 
    {
        return brandDes;
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
            .append("brandId", getBrandId())
            .append("brandName", getBrandName())
            .append("brandDes", getBrandDes())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
