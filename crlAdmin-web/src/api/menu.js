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
    url: 'api/menus/build',
    method: 'get'
  })
}

export function add(data) {
  return request({
    url: 'sys/menu/save',
    method: 'post',
    data
  })
}

export function del(id) {
  return request({
    url: 'sys/menu/delete/' + id,
    method: 'get'
  })
}

export function edit(data) {
  return request({
    url: 'sys/menu/update',
    method: 'post',
    data
  })
}
