import request from '@/utils/request'

// 查询车辆信息列表
export function listCarInfo(query) {
  return request({
    url: '/system/carInfo/list',
    method: 'get',
    params: query
  })
}

// 查询车辆信息详细
export function getCarInfo(carId) {
  return request({
    url: '/system/carInfo/' + carId,
    method: 'get'
  })
}

// 新增车辆信息
export function addCarInfo(data) {
  return request({
    url: '/system/carInfo',
    method: 'post',
    data: data
  })
}

// 修改车辆信息
export function updateCarInfo(data) {
  return request({
    url: '/system/carInfo',
    method: 'put',
    data: data
  })
}

// 删除车辆信息
export function delCarInfo(carId) {
  return request({
    url: '/system/carInfo/' + carId,
    method: 'delete'
  })
}
