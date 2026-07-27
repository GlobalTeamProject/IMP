package test;

import java.sql.Connection;
import java.sql.DriverManager;

public class dbtest {
    public static void main(String[] args) {
        String url = "jdbc:oracle:thin:@localhost:1521:orcl"; // 본인 SID/서비스명으로 수정
        String user = "scott";     
        String password = "tigger"; 
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection(url, user, password);
            System.out.println("연결 성공! " + conn);
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
