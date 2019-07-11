import request from '@/utils/request'

// 获取所有的Role
export function getAll() {
  return request({
    url: 'sys/role/all',
    method: 'get'
  })
}

export function add(data) {
  return request({
    url: 'sys/role/add',
    method: 'post',
    data
  })
}

export function get(id) {
  return request({
    url: 'sys/role/info/' + id,
    method: 'get'
  })
}

export function del(id) {
  return request({
    url: 'sys/role/remove/' + id,
    method: 'get'
  })
}

export function edit(data) {
  return request({
    url: 'sys/role/modify',
    method: 'post',
    data
  })
}

export function editPermission(data) {
  return request({
    url: 'sys/role/updatePermission',
    method: 'post',
    data
  })
}

export function editMenu(data) {
  return request({
    url: 'sys/role/updateMenu',
    method: 'post',
    data
  })
}
