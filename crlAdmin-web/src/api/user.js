import request from '@/utils/request'

export function add(data) {
  return request({
    url: 'sys/user/add',
    method: 'post',
    data
  })
}

export function del(id) {
  return request({
    url: 'sys/user/remove/' + id,
    method: 'get'
  })
}

export function edit(data) {
  return request({
    url: 'sys/user/modify',
    method: 'post',
    data
  })
}

export function validPass(pass) {
  return request({
    url: 'api/users/validPass/' + pass,
    method: 'get'
  })
}

export function updatePass(pass) {
  return request({
    url: 'api/users/updatePass/' + pass,
    method: 'get'
  })
}

export function updateEmail(code, data) {
  return request({
    url: 'api/users/updateEmail/' + code,
    method: 'post',
    data
  })
}

