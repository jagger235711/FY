package org.fkit.hrm.dao.provider;

import org.apache.ibatis.jdbc.SQL;
import org.fkit.hrm.domain.Fy;

import java.util.Map;

import static org.fkit.hrm.util.common.HrmConstants.FYTABLE;

;

/**
 * @author 肖文吉    36750064@qq.com
 * @version V1.0
 * @Description: 部门动态SQL语句提供类
 * <br>网站：<a href="http://www.fkit.org">疯狂Java</a>
 */
public class FyDynaSqlProvider {
    // 分页动态查询
    public String selectWhitParam(final Map<String, Object> params) {
        String sql = new SQL() {
            {
                SELECT("*");
                FROM(FYTABLE);
                if (params.get("fy") != null) {
                    Fy fy = (Fy) params.get("fy");
                    if (fy.getName() != null && !fy.getName().equals("")) {
                        WHERE("  name LIKE CONCAT ('%',#{fy.name},'%') ");
                    }
                }
            }
        }.toString();

        if (params.get("pageModel") != null) {
            sql += " limit #{pageModel.firstLimitParam} , #{pageModel.pageSize}  ";
        }

        return sql;
    }

    // 动态查询总数量
    public String count(final Map<String, Object> params) {
        return new SQL() {
            {
                SELECT("count(*)");
                FROM(FYTABLE);
                if (params.get("fy") != null) {
                    Fy fy = (Fy) params.get("fy");
                    if (fy.getName() != null && !fy.getName().equals("")) {
                        WHERE("  name LIKE CONCAT ('%',#{fy.name},'%') ");
                    }
                }
            }
        }.toString();
    }

    // 动态插入
    public String insertFy(final Fy fy) {

        return new SQL() {
            {
                INSERT_INTO(FYTABLE);
                if (fy.getName() != null && !fy.getName().equals("")) {
                    VALUES("name", "#{name}");
                }
                if (fy.getRemark() != null && !fy.getRemark().equals("")) {
                    VALUES("remark", "#{remark}");
                }
            }
        }.toString();
    }

    // 动态更新
    public String updateFy(final Fy fy) {

        return new SQL() {
            {
                UPDATE(FYTABLE);
                if (fy.getName() != null) {
                    SET(" name = #{name} ");
                }
                if (fy.getRemark() != null) {
                    SET(" remark = #{remark} ");
                }
                WHERE(" id = #{id} ");
            }
        }.toString();
    }


}
