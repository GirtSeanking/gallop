package com.ruoyi.project.system.domain;

import com.ruoyi.framework.aspectj.lang.annotation.Excels;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 车辆信息对象 car_info
 * 
 * @author gallop
 * @date 2023-09-11
 */
public class CarInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 车辆信息编号 */
    private Long carId;

    /** 车辆品牌编号 */
    @Excel(name = "车辆品牌编号")
    private Long brandId;

    /** 车辆车型编号 */
    @Excel(name = "车辆车型编号")
    private Long carTypeId;

    /** 车辆所属门店编号 */
    @Excel(name = "车辆所属门店编号")
    private Long deptId;

    /** 车辆名称 */
    @Excel(name = "车辆名称")
    private String carName;

    /** 车辆简介 */
    @Excel(name = "车辆简介")
    private String carDes;

    /** 车辆图片 */
    @Excel(name = "车辆图片")
    private String carImgs;

    /** 车辆状态（0正常 1停用） */
    @Excel(name = "车辆状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 车辆租金（保留两位小数） */
    @Excel(name = "车辆租金")
    private double rent;

    /** 门店对象 */
    @Excel(name = "门店", targetAttr = "deptName", type = Excel.Type.EXPORT)
    private SysDept dept;

    /** 品牌对象 */
    @Excel(name = "品牌", targetAttr = "brandName", type = Excel.Type.EXPORT)
    private BrandInfo brand;

    /** 车型对象 */
    @Excel(name = "车型", targetAttr = "carTypeName", type = Excel.Type.EXPORT)
    private CarTypeInfo carType;

    public BrandInfo getBrand() {
        return brand;
    }

    public void setBrand(BrandInfo brand) {
        this.brand = brand;
    }

    public CarTypeInfo getCarType() {
        return carType;
    }

    public void setCarType(CarTypeInfo carType) {
        this.carType = carType;
    }

    public double getRent() {
        return rent;
    }

    public void setRent(double rent) {
        this.rent = rent;
    }

    public void setCarId(Long carId)
    {
        this.carId = carId;
    }

    public Long getCarId() 
    {
        return carId;
    }
    public void setBrandId(Long brandId) 
    {
        this.brandId = brandId;
    }

    public Long getBrandId() 
    {
        return brandId;
    }
    public void setCarTypeId(Long carTypeId) 
    {
        this.carTypeId = carTypeId;
    }

    public Long getCarTypeId() 
    {
        return carTypeId;
    }
    public void setCarName(String carName) 
    {
        this.carName = carName;
    }

    public String getCarName() 
    {
        return carName;
    }
    public void setCarDes(String carDes) 
    {
        this.carDes = carDes;
    }

    public String getCarDes() 
    {
        return carDes;
    }
    public void setCarImgs(String carImgs) 
    {
        this.carImgs = carImgs;
    }

    public String getCarImgs() 
    {
        return carImgs;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public SysDept getDept() {
        return dept;
    }

    public void setDept(SysDept dept) {
        this.dept = dept;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("carId", getCarId())
            .append("brandId", getBrandId())
            .append("carTypeId", getCarTypeId())
            .append("deptId", getDeptId())
            .append("carName", getCarName())
            .append("carDes", getCarDes())
            .append("carImgs", getCarImgs())
            .append("status", getStatus())
            .append("rent", getRent())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("dept", getDept())
            .append("brand", getBrand())
            .append("carType", getCarType())
            .toString();
    }
}
