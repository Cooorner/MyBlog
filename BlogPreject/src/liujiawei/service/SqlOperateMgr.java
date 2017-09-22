package liujiawei.service;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import liujiawei.sqloperate.SqlOperate;


public class SqlOperateMgr {

	private static SqlOperateMgr instance=null;
	
	ApplicationContext context =null;
	SqlOperate sqlOperate=null;
	
	private SqlOperateMgr() {		
		 context = new ClassPathXmlApplicationContext("Beans.xml");
		 sqlOperate = (SqlOperate)context.getBean("SqlOperate");
	}
	
	public static SqlOperateMgr getInstance() {
		if(instance==null){
			instance=new SqlOperateMgr();			
		}
		return instance;
	}
	
	/*
	 * 执行sql语句
	 */
	public String excuteSql(String sqlstr) {
		return sqlOperate.executeSql(sqlstr);
	}
	
}
