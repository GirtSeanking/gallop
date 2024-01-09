package com.ruoyi.project.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 订单信息对象 order_info
 *
 * @author gallop
 * @date 2023-09-12
 */
public class OrderInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 订单编号 */
    private Long orderId;

    /** 车辆编号 */
    @Excel(name = "用户编号")
    private Long userId;

    /** 车辆编号 */
    @Excel(name = "车辆编号")
    private Long carId;

    /** 品牌编号 */
    @Excel(name = "品牌编号")
    private Long brandId;

    /** 车型编号 */
    @Excel(name = "车型编号")
    private Long carTypeId;

    /** 门店编号 */
    @Excel(name = "门店编号")
    private Long deptId;

    /** 出租天数 */
    @Excel(name = "出租天数")
    private Long rentalDay;

    /** 订单截止日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "订单截止日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endTime;

    /** 每日价格 */
    @Excel(name = "每日价格")
    private Long priceDay;

    /** 租金总价 */
    @Excel(name = "租金总价")
    private Long priceTotal;

    /** 订单支付状态 （0待支付 1已支付 2取消支付） */
    @Excel(name = "订单支付状态 ", readConverterExp = "0=待支付,1=已支付,2=取消支付")
    private String payStatus;

    /** 订单状态（0取消 1出租驳回 2还车驳回 3出租审核中 4还车审核中 5出租中 6完成） */
    @Excel(name = "订单状态", readConverterExp = "0=取消,1=出租驳回,2=还车驳回,3=出租审核中,4=还车审核中,5=出租中,6=完成")
    private String status;

    @Excel(name = "车辆名称", targetAttr = "carName")
    private CarInfo carInfo;

    @Excel(name = "受理门店", targetAttr = "deptName")
    private SysDept dept;

    @Excel(name = "车辆车型", targetAttr = "carTypeName")
    private CarTypeInfo carType;

    @Excel(name = "车辆品牌", targetAttr = "brandName")
    private BrandInfo brand;

    @Excel(name = "用户昵称", targetAttr = "nickName")
    private SysUser user;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public SysUser getUser() {
        return user;
    }

    public void setUser(SysUser user) {
        this.user = user;
    }

    public void setOrderId(Long orderId)
    {
        this.orderId = orderId;
    }

    public Long getOrderId()
    {
        return orderId;
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
    public void setDeptId(Long deptId)
    {
        this.deptId = deptId;
    }

    public Long getDeptId()
    {
        return deptId;
    }
    public void setRentalDay(Long rentalDay)
    {
        this.rentalDay = rentalDay;
    }

    public Long getRentalDay()
    {
        return rentalDay;
    }
    public void setEndTime(Date endTime)
    {
        this.endTime = endTime;
    }

    public Date getEndTime()
    {
        return endTime;
    }
    public void setPriceDay(Long priceDay)
    {
        this.priceDay = priceDay;
    }

    public Long getPriceDay()
    {
        return priceDay;
    }
    public void setPriceTotal(Long priceTotal)
    {
        this.priceTotal = priceTotal;
    }

    public Long getPriceTotal()
    {
        return priceTotal;
    }
    public void setPayStatus(String payStatus)
    {
        this.payStatus = payStatus;
    }

    public String getPayStatus()
    {
        return payStatus;
    }
    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus()
    {
        return status;
    }

    public CarInfo getCarInfo() {
        return carInfo;
    }

    public void setCarInfo(CarInfo carInfo) {
        this.carInfo = carInfo;
    }

    public SysDept getDept() {
        return dept;
    }

    public void setDept(SysDept dept) {
        this.dept = dept;
    }

    public CarTypeInfo getCarType() {
        return carType;
    }

    public void setCarType(CarTypeInfo carType) {
        this.carType = carType;
    }

    public BrandInfo getBrand() {
        return brand;
    }

    public void setBrand(BrandInfo brand) {
        this.brand = brand;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("orderId", getOrderId())
            .append("carId", getCarId())
            .append("brandId", getBrandId())
            .append("cartTypeId", getCarTypeId())
            .append("deptId", getDeptId())
            .append("rentalDay", getRentalDay())
            .append("endTime", getEndTime())
            .append("priceDay", getPriceDay())
            .append("priceTotal", getPriceTotal())
            .append("payStatus", getPayStatus())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("carInfo", getCarInfo())
            .append("dept", getDept())
            .append("carType", getCarType())
            .append("brand", getBrand())
            .toString();
    }
}
