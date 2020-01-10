package cn.littleterry.modules.tools;

import cn.littleterry.modules.tools.sql.SQLUtils;
import com.alibaba.druid.util.JdbcConstants;

/**
 * @author terry
 * @since 22/07/2019
 */
public class SqlTest {
    public static void main(String[] args) {
        String sql= ""
                         + "insert into tar select * from boss_table bo, ("
                             + "select a.f1, ff from emp_table a "
                             + "inner, join log_table b "
                             + "on a.f2 = b.f3"
                             + ") f "
                             + "where bo.f4 = f.f5 "
                             + "group by bo.f6 , f.f7 having count(bo.f8) > 0 "
                             + "order by bo.f9, f.f10;"
                             + "select func(f) from test1; "
                             + "";
                 String dbType = JdbcConstants.POSTGRESQL;
        //String formatSql = SQLUtils.format(sql,dbType);
        //System.out.println(formatSql);
        String stmtList = SQLUtils.parseSql(sql, dbType);


    }
}
