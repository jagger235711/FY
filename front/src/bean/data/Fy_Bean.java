package bean.data;

/**
 * @author Jagger
 * @ClassName Fy_Bean.java
 * @Description 非遗的实体类，用于存放数据库中fy_inf的信息
 * @createTime 2022/1/11
 */
public class Fy_Bean {

    String[] columnName;           //列名
    String[][] tableRecord = null;   //记录


    public Fy_Bean() {
        tableRecord = new String[1][1];
        columnName = new String[1];
    }

    public String[][] getTableRecord() {
        return tableRecord;
    }

    public void setTableRecord(String[][] s) {
        tableRecord = s;
    }

    public String[] getColumnName() {
        return columnName;
    }

    public void setColumnName(String[] s) {
        columnName = s;
    }
}
