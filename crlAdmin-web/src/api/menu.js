import request from '@/utils/request'

// 获取所有的菜单树
export function getMenusTree() {
  return request({
    url: 'sys/menu/tree',
    method: 'get'
  })
}

export function buildMenus() {
  return request({
    url: 'sys/menu/build',
    method: 'get'
  })
}

export function add(data) {
  return request({
    url: 'sys/menu/add',
    method: 'post',
    data
  })
}

export function del(id) {
  return request({
    url: 'sys/menu/remove/' + id,
    method: 'get'
  })
}

export function edit(data) {
  return request({
    url: 'sys/menu/modify',
    method: 'post',
    data
  })
}
