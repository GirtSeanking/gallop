package com.ruoyi.project.system.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;

import java.util.Date;

/**
 * @ClassName OrderCustomerVo
 * @Description TODO
 * @Author GirtSeanking
 * @Date 2024/1/5 21:14
 **/
public class OrderCustomerVo {

    /** 订单编号 */
    private Long orderId;

    /** 用户账户 */
    private String username;

    /** 车辆编号 */
    private Long carId;

    /** 品牌编号 */
    private Long brandId;

    /** 车型编号 */
    private Long carTypeId;

    /** 门店编号 */
    private Long deptId;

    /** 出租天数 */
    private Long rentalDay;

    /** 订单截止日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date endTime;

    /** 每日价格 */
    private Long priceDay;

    /** 租金总价 */
    private Long priceTotal;

    /** 订单支付状态 （0待支付 1已支付 2取消支付） */
    private String payStatus;

    /** 订单状态（0取消 1出租驳回 2还车驳回 3出租审核中 4还车审核中 5出租中 6完成） */
    private String status;

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Long getCarId() {
        return carId;
    }

    public void setCarId(Long carId) {
        this.carId = carId;
    }

    public Long getBrandId() {
        return brandId;
    }

    public void setBrandId(Long brandId) {
        this.brandId = brandId;
    }

    public Long getCarTypeId() {
        return carTypeId;
    }

    public void setCarTypeId(Long carTypeId) {
        this.carTypeId = carTypeId;
    }

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public Long getRentalDay() {
        return rentalDay;
    }

    public void setRentalDay(Long rentalDay) {
        this.rentalDay = rentalDay;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Long getPriceDay() {
        return priceDay;
    }

    public void setPriceDay(Long priceDay) {
        this.priceDay = priceDay;
    }

    public Long getPriceTotal() {
        return priceTotal;
    }

    public void setPriceTotal(Long priceTotal) {
        this.priceTotal = priceTotal;
    }

    public String getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(String payStatus) {
        this.payStatus = payStatus;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
