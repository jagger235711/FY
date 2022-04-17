package org.fkit.hrm.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.fkit.hrm.dao.provider.FyDynaSqlProvider;
import org.fkit.hrm.domain.Fy;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

import static org.fkit.hrm.util.common.HrmConstants.FYTABLE;


@Repository
public interface FyDao {

    // 动态查询
    @SelectProvider(type = FyDynaSqlProvider.class, method = "selectWhitParam")
    List<Fy> selectByPage(Map<String, Object> params);

    @SelectProvider(type = FyDynaSqlProvider.class, method = "count")
    Integer count(Map<String, Object> params);

    @Select("select * from " + FYTABLE + " ")
    List<Fy> selectAllFy();

    @Select("select * from " + FYTABLE + " where ID = #{id}")
    Fy selectById(int id);

    // 根据id删除非遗
    @Delete(" delete from " + FYTABLE + " where id = #{id} ")
    void deleteById(Integer id);

    // 动态插入非遗
    @SelectProvider(type = FyDynaSqlProvider.class, method = "insertFy")
    void save(Fy fy);

    // 动态修改非遗
    @SelectProvider(type = FyDynaSqlProvider.class, method = "updateFy")
    void update(Fy fy);
}
