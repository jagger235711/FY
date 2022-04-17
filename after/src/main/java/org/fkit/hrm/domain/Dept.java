package org.fkit.hrm.domain;


public class Dept implements java.io.Serializable {

    private Integer id;        // id
    private String name;    // 部门名称
    private String remark;    // 详细描述

    // 无参数构造器
    public Dept() {
        super();
    }

    public Integer getId() {
        return this.id;
    }

    // setter和getter方法
    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRemark() {
        return this.remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Dept [id=" + id + ", name=" + name + ", remark=" + remark + "]";
    }

}