import request from '@/utils/request'

// 查询车型信息列表
export function listCarType(query) {
  return request({
    url: '/system/carType/list',
    method: 'get',
    params: query
  })
}

// 查询所有车型信息列表
export function listAllCarType(query) {
  return request({
    url: '/system/carType/listAll',
    method: 'get',
    params: query
  })
}

// 查询车型信息详细
export function getCarType(carTypeId) {
  return request({
    url: '/system/carType/' + carTypeId,
    method: 'get'
  })
}

// 新增车型信息
export function addCarType(data) {
  return request({
    url: '/system/carType',
    method: 'post',
    data: data
  })
}

// 修改车型信息
export function updateCarType(data) {
  return request({
    url: '/system/carType',
    method: 'put',
    data: data
  })
}

// 删除车型信息
export function delCarType(carTypeId) {
  return request({
    url: '/system/carType/' + carTypeId,
    method: 'delete'
  })
}

// 品牌状态修改
export function changeCarTypeStatus(carTypeId, status) {
  const data = {
    carTypeId,
    status
  }
  return request({
    url: '/system/carType/changeStatus',
    method: 'put',
    data: data
  })
}
