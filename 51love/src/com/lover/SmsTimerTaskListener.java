package com.lover;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletRequestAttributeListener;
import javax.servlet.http.*;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;

public class SmsTimerTaskListener implements ServletContextListener{
  private static final long PERIOD_DAY = 24 * 60 * 60 * 1000;
  public SmsTimerTaskListener() {
	  
  }

  public void contextInitialized(ServletContextEvent event)
  {
	//ʱ����
	 
	   
	   Calendar calendar = Calendar.getInstance();
	         
	   /*** ����ÿ��9:00ִ�з��� ***/
	  
	   calendar.set(Calendar.HOUR_OF_DAY, 10);
	   calendar.set(Calendar.MINUTE, 0);
	   calendar.set(Calendar.SECOND, 0);
	   
	   Date date=calendar.getTime(); //��һ��ִ�ж�ʱ�����ʱ��
	    
	   //�����һ��ִ�ж�ʱ�����ʱ�� С�� ��ǰ��ʱ��
	   //��ʱҪ�� ��һ��ִ�ж�ʱ�����ʱ�� ��һ�죬�Ա���������¸�ʱ���ִ�С��������һ�죬���������ִ�С�
	   if (date.before(new Date())) {
	       date = this.addDay(date, 1);
	   }
	    
	   Timer timer = new Timer();
	    
	   SmsTimerTask task = new SmsTimerTask();
	   //����ָ����������ָ����ʱ�俪ʼ�����ظ��Ĺ̶��ӳ�ִ�С�
	   timer.schedule(task,date,PERIOD_DAY);
  }
  
  public void contextDestroyed(ServletContextEvent event)
  {
    
  }
  
  //���ӻ��������
  public Date addDay(Date date, int num) {
   Calendar startDT = Calendar.getInstance();
   startDT.setTime(date);
   startDT.add(Calendar.DAY_OF_MONTH, num);
   return startDT.getTime();
  }
}
