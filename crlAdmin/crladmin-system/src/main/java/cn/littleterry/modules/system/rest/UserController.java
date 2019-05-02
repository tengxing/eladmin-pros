package cn.littleterry.modules.system.rest;

import cn.littleterry.aop.log.Log;
import cn.littleterry.config.DataScope;
import cn.littleterry.exception.BadRequestException;
import cn.littleterry.modules.system.domain.User;
import cn.littleterry.modules.system.service.DeptService;
import cn.littleterry.modules.system.service.UserService;
import cn.littleterry.modules.system.service.dto.UserDTO;
import cn.littleterry.modules.system.service.query.UserQueryService;
import cn.littleterry.util.EncryptUtils;
import cn.littleterry.util.PageUtil;
import cn.littleterry.util.SecurityContextHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * @author terry
 * @date 2018-11-23
 */
@RestController
@RequestMapping("api")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserQueryService userQueryService;

    @Autowired
    private DataScope dataScope;

    @Autowired
    private DeptService deptService;

    private static final String ENTITY_NAME = "user";

    @Log("查询用户")
    @GetMapping(value = "/users")
    @PreAuthorize("hasAnyRole('ADMIN','USER_ALL','USER_SELECT')")
    public ResponseEntity getUsers(UserDTO userDTO, Pageable pageable){
        Set<Long> deptSet = new HashSet<>();
        Set<Long> result = new HashSet<>();

        if (!ObjectUtils.isEmpty(userDTO.getDeptId())) {
            deptSet.add(userDTO.getDeptId());
            deptSet.addAll(dataScope.getDeptChildren(deptService.findByPid(userDTO.getDeptId())));
        }

        // 数据权限
        Set<Long> deptIds = dataScope.getDeptIds();

        // 查询条件不为空并且数据权限不为空则取交集
        if (!CollectionUtils.isEmpty(deptIds) && !CollectionUtils.isEmpty(deptSet)){

            // 取交集
            result.addAll(deptSet);
            result.retainAll(deptIds);

            // 若无交集，则代表无数据权限
            if(result.size() == 0){
                return new ResponseEntity(PageUtil.toPage(null,0),HttpStatus.OK);
            } else return new ResponseEntity(userQueryService.queryAll(userDTO,result,pageable),HttpStatus.OK);
        // 否则取并集
        } else {
            result.addAll(deptSet);
            result.addAll(deptIds);
            return new ResponseEntity(userQueryService.queryAll(userDTO,result,pageable),HttpStatus.OK);
        }
    }

    @Log("新增用户")
    @PostMapping(value = "/users")
    @PreAuthorize("hasAnyRole('ADMIN','USER_ALL','USER_CREATE')")
    public ResponseEntity create(@Validated @RequestBody User resources){
        if (resources.getId() != null) {
            throw new BadRequestException("A new "+ ENTITY_NAME +" cannot already have an ID");
        }
        return new ResponseEntity(userService.create(resources),HttpStatus.CREATED);
    }

    @Log("修改用户")
    @PutMapping(value = "/users")
    @PreAuthorize("hasAnyRole('ADMIN','USER_ALL','USER_EDIT')")
    public ResponseEntity update(@Validated(User.Update.class) @RequestBody User resources){
        userService.update(resources);
        return new ResponseEntity(HttpStatus.NO_CONTENT);
    }

    @Log("删除用户")
    @DeleteMapping(value = "/users/{id}")
    @PreAuthorize("hasAnyRole('ADMIN','USER_ALL','USER_DELETE')")
    public ResponseEntity delete(@PathVariable Long id){
        userService.delete(id);
        return new ResponseEntity(HttpStatus.OK);
    }

    /**
     * 验证密码
     * @param pass
     * @return
     */
    @GetMapping(value = "/users/validPass/{pass}")
    public ResponseEntity validPass(@PathVariable String pass){
        UserDetails userDetails = SecurityContextHolder.getUserDetails();
        Map map = new HashMap();
        map.put("status",200);
        if(!userDetails.getPassword().equals(EncryptUtils.encryptPassword(pass))){
           map.put("status",400);
        }
        return new ResponseEntity(map,HttpStatus.OK);
    }

    /**
     * 修改密码
     * @param pass
     * @return
     */
    @GetMapping(value = "/users/updatePass/{pass}")
    public ResponseEntity updatePass(@PathVariable String pass){
        UserDetails userDetails = SecurityContextHolder.getUserDetails();
        if(userDetails.getPassword().equals(EncryptUtils.encryptPassword(pass))){
            throw new BadRequestException("新密码不能与旧密码相同");
        }
        userService.updatePass(userDetails.getUsername(),EncryptUtils.encryptPassword(pass));
        return new ResponseEntity(HttpStatus.OK);
    }

}
