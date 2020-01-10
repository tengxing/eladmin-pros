package cn.littleterry.modules.tools.sql;

import cn.littleterry.util.StringUtils;
import com.baomidou.mybatisplus.extension.api.R;
import org.springframework.jdbc.core.namedparam.ParsedSql;
import org.springframework.validation.ValidationUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.ParseException;
import java.text.ParsePosition;

/**
 * @author terry
 * @since 22/07/2019
 */
@RestController
@RequestMapping("/sql")
public class SqlController {

    @GetMapping(value = "/parseSql")
    public R parseSql(String sql,String dbType){
        String errorSql = SQLUtils.parseSql(sql,dbType);
        if (StringUtils.isEmpty(errorSql)){
            //ok
            return R.ok(null);
        }
        return R.failed(errorSql);
    }
}
