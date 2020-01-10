package cn.littleterry.modules.tools.sql;

import com.alibaba.druid.sql.ast.SQLStatement;
import com.alibaba.druid.sql.parser.ParserException;
import com.alibaba.druid.sql.parser.SQLParserUtils;
import com.alibaba.druid.sql.parser.SQLStatementParser;
import com.alibaba.druid.sql.parser.Token;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

/**
 * @author terry
 * @since 22/07/2019
 */
public class SQLUtils {
    static Logger logger = LoggerFactory.getLogger(SQLUtils.class);
    public static String parseSql(String sql, String dbType) {
        String errorSql = null;
        try {
            SQLStatementParser parser = SQLParserUtils.createSQLStatementParser(sql, dbType);
            List<SQLStatement> stmtList = parser.parseStatementList();
            if (parser.getLexer().token() != Token.EOF) {
                logger.info("syntax error : {}", sql);
                errorSql =  sql;
            }
        }catch (ParserException e){
            logger.info("syntax error : {}", sql);
            errorSql =  sql;
        }

        return errorSql;
    }
}
