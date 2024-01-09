package com.ruoyi.project.system.service.impl;

import java.util.Date;
import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.framework.aspectj.lang.annotation.DataScope;
import com.ruoyi.project.system.domain.CarInfo;
import com.ruoyi.project.system.domain.SysUser;
import com.ruoyi.project.system.domain.vo.OrderCustomerVo;
import com.ruoyi.project.system.service.ICarInfoService;
import com.ruoyi.project.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.mapper.OrderInfoMapper;
import com.ruoyi.project.system.domain.OrderInfo;
import com.ruoyi.project.system.service.IOrderInfoService;

/**
 * 订单信息Service业务层处理
 *
 * @author gallop
 * @date 2023-09-12
 */
@Service
public class OrderInfoServiceImpl implements IOrderInfoService
{
    @Autowired
    private OrderInfoMapper orderInfoMapper;

    @Autowired
    private ICarInfoService carInfoService;

    @Autowired
    private ISysUserService userService;

    /**
     * 查询订单信息
     *
     * @param orderId 订单信息主键
     * @return 订单信息
     */
    @Override
    public OrderInfo selectOrderInfoByOrderId(Long orderId)
    {
        return orderInfoMapper.selectOrderInfoByOrderId(orderId);
    }

    /**
     * 查询订单信息列表
     *
     * @param orderInfo 订单信息
     * @return 订单信息
     */
    @Override
    @DataScope(deptAlias = "d")
    public List<OrderInfo> selectOrderInfoList(OrderInfo orderInfo)
    {
        return orderInfoMapper.selectOrderInfoList(orderInfo);
    }

    /**
     * 新增订单信息
     *
     * @param orderInfo 订单信息
     * @return 结果
     */
    @Override
    public int insertOrderInfo(OrderInfo orderInfo)
    {
        orderInfo.setCreateTime(DateUtils.getNowDate());
        CarInfo carInfo = carInfoService.selectCarInfoByCarId(orderInfo.getCarId());
        carInfo.setCarId(orderInfo.getCarId());
        carInfo.setStatus("3");
        carInfoService.updateCarInfo(carInfo);
        return orderInfoMapper.insertOrderInfo(orderInfo);
    }

    /**
     * 修改订单信息
     *
     * @param orderInfo 订单信息
     * @return 结果
     */
    @Override
    public int updateOrderInfo(OrderInfo orderInfo)
    {
        orderInfo.setUpdateTime(DateUtils.getNowDate());
        return orderInfoMapper.updateOrderInfo(orderInfo);
    }

    /**
     * 批量删除订单信息
     *
     * @param orderIds 需要删除的订单信息主键
     * @return 结果
     */
    @Override
    public int deleteOrderInfoByOrderIds(Long[] orderIds)
    {
        return orderInfoMapper.deleteOrderInfoByOrderIds(orderIds);
    }

    /**
     * 删除订单信息信息
     *
     * @param orderId 订单信息主键
     * @return 结果
     */
    @Override
    public int deleteOrderInfoByOrderId(Long orderId)
    {
        return orderInfoMapper.deleteOrderInfoByOrderId(orderId);
    }

    @Override
    public int customerAddOrder(OrderCustomerVo orderCustomerVo) {
        OrderInfo orderInfo = new OrderInfo();
        SysUser user = userService.selectUserByUserName(orderCustomerVo.getUsername());
        orderInfo.setUserId(user.getUserId());
        orderInfo.setCarId(orderCustomerVo.getCarId());
        orderInfo.setBrandId(orderCustomerVo.getBrandId());
        orderInfo.setCarTypeId(orderCustomerVo.getCarTypeId());
        orderInfo.setDeptId(orderCustomerVo.getDeptId());
        orderInfo.setRentalDay(orderCustomerVo.getRentalDay());
        orderInfo.setEndTime(orderCustomerVo.getEndTime());
        orderInfo.setPriceDay(orderCustomerVo.getPriceDay());
        orderInfo.setPriceTotal(orderCustomerVo.getPriceTotal());
        orderInfo.setPayStatus(orderCustomerVo.getPayStatus());
        orderInfo.setStatus(orderCustomerVo.getStatus());
        orderInfo.setCreateBy(user.getUserName());
        orderInfo.setCreateTime(new Date());
        orderInfo.setUpdateBy(user.getUserName());
        orderInfo.setUpdateTime(new Date());
        int row = orderInfoMapper.insertOrderInfo(orderInfo);
        CarInfo carInfo = carInfoService.selectCarInfoByCarId(orderInfo.getCarId());
        carInfo.setCarId(orderInfo.getCarId());
        carInfo.setStatus("3");
        carInfoService.updateCarInfo(carInfo);
        return row;
    }

    @Override
    public List<OrderInfo> customerOrders(OrderCustomerVo orderCustomerVo) {
        SysUser user = userService.selectUserByUserName(orderCustomerVo.getUsername());
        OrderInfo orderInfo = new OrderInfo();
        orderInfo.setUserId(user.getUserId());
        List<OrderInfo> orderInfoList = orderInfoMapper.selectOrderInfoList(orderInfo);
        return orderInfoList;
    }

    @Override
    public int customerUpdateOrder(OrderCustomerVo orderCustomerVo) {
        OrderInfo orderInfo = new OrderInfo();
        orderInfo.setOrderId(orderCustomerVo.getOrderId());
        orderInfo.setStatus(orderCustomerVo.getStatus());
        orderInfo.setUpdateBy(orderCustomerVo.getUsername());
        orderInfo.setUpdateTime(new Date());
        return orderInfoMapper.updateOrderInfo(orderInfo);
    }
}
