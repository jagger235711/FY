package bean.data;

/**
 * @author Jagger
 * @ClassName Fy_Bean.java
 * @Description ���ŵ�ʵ���࣬���ڴ�����ݿ���fy_inf����Ϣ
 * @createTime 2022/1/11
 */
public class Fy_Bean {

    String[] columnName;           //����
    String[][] tableRecord = null;   //��¼


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
