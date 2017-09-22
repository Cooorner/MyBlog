package liujiawei.sqloperate;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCallback;
import org.springframework.jdbc.core.PreparedStatementCreator;

import com.mysql.jdbc.PreparedStatement;

public class SqlOperate {

	private DataSource datasource;  
	private JdbcTemplate jdbcTemplateObject;
	
	public void setdatasource(DataSource ds) {
		// TODO Auto-generated method stub
		this.datasource = ds;  
        this.jdbcTemplateObject = new JdbcTemplate(datasource);
	}
	
	/*
	 * 执行sql语句
	 */
	public String executeSql(String sqlstr) {
		String[] resultStr=new String[1];
		resultStr[0]+="操作："+sqlstr;
		int count = jdbcTemplateObject.execute(new PreparedStatementCreator(){
			@Override
			public java.sql.PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
				// TODO Auto-generated method stub				
				return conn.prepareStatement(sqlstr);
			}}, new PreparedStatementCallback<Integer>(){
				@Override
				public Integer doInPreparedStatement(java.sql.PreparedStatement pstmt)
						throws SQLException, DataAccessException {
					pstmt.execute();  
					ResultSet rs = pstmt.getResultSet();
					resultStr[0]+="结果：";
					while(rs.next()){
						resultStr[0]+=rs.getInt(1);
					}
			        return 1;
				}});
		return resultStr[0];
	}
	
}
