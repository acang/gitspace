<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.servlet.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="com.lover.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.web.bean.*"%>
<%@page import="java.text.*"%>
<%@ page import="com.web.bean.*"%>
<%@ page import="org.apache.commons.beanutils.*"%>
<%@ page import="java.math.*"%>
<%

   String qbname = SysCommonFunc.getStrParameter(request,"qbname");
   Userinfo hyinfo = HYRegMng.getUserinfoByUsername(qbname);
   if(hyinfo == null)
   {
     out.println("<script language='javascript'>alert('û�д��û���������');window.close();</script>");
     return;
   }
   
   //�жϽ����Ƿ��Ѳ��뷢�ͱ�
   String sql="";
   //String cdate = DateTools.dateToString(new Date(System.currentTimeMillis()),false);
   //sql="select id from db_qiubofs where SENDUSERID="+hyinfo.getHyid()+" and SENDTIME>=to_date((to_char(sysdate,'yyyy-MM-dd') || ' 00:00:00'),'YYYY-MM-DD HH24:MI:SS') and SENDTIME<=sysdate";
   //List plist = null;
   //plist=QueryRecord.query(sql);
   //if (plist.size()>0){
   		//out.println("<script language='javascript'>alert('���û������Ѵ����ﲨ���ͱ��У����������룡');window.close();</script>");
   		//return;
   //}
   
   //��Ա��ҳ��ʾʱ���Ϊ��ǰ
   HbmOperator.executeSql("update userinfo set regtime2=sysdate,regtime5=sysdate where hyid = "+hyinfo.getHyid());

   //���뷢�ͱ�
   sql = "insert into db_qiubofs (ID,SENDUSERID,SENDUSERNAME,SENDTIME) values (SEQ_QIUBOFS.NEXTVAL,"+hyinfo.getHyid()+",'"+hyinfo.getUsername().trim()+"',sysdate)";
   
   //add by gaojianhong for �����ﲨʱ���û��ﲨ���е���������1��ֱ�Ӳ����µļ�¼ start
   //ȡ���ﲨƥ��ĵ�¼ʱ��Ϊ2��ǰ���л�Ա
   if (hyinfo.getSex().equals("11")){
   		//һ��ǰ����
   		Calendar calendar = Calendar.getInstance();
	    calendar.add(Calendar.YEAR,-1); //�õ�һ��ǰ
	    Date date = calendar.getTime();
	    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	    String day=df.format(date);
	    //Ů��Ա����
		Calendar cal = Calendar.getInstance();
		cal.setTime(hyinfo.getCsdate());
		int start = cal.get(Calendar.YEAR)-15;
		int end = cal.get(Calendar.YEAR)+4;
		String sDate=start+"-01-01";
		String eDate=end+"-12-31";
		String sql1 = "select u.hyid from Userinfo u where u.lastTime >= to_date('"+day+"','YYYY-MM-DD') ";
   		sql1 = sql1 + " and u.CSDATE>=to_date('"+sDate+"','YYYY-MM-DD') and u.CSDATE<=to_date('"+eDate+"','YYYY-MM-DD') and u.s1='"+hyinfo.getS1()+"' and u.sex='10' and u.isdel=0";
   		//List list=HbmOperator.list(sql1);
   		List list = QueryRecord.query(sql1);
   		int qiubo_number=0;
   		UserQiuboMng userQiuboMng=new UserQiuboMng();
   		String sex="��";
   		Long hyid=Long.valueOf(0);
   		for(int i=0;i<list.size();i++){
   			DynaBean dbl=new LazyDynaBean();
   			dbl=(DynaBean)list.get(i);
   			qiubo_number=0;
   			hyid=Long.parseLong(((BigDecimal)dbl.get("hyid")).toString());
	        Userqiubo userqiubo=userQiuboMng.getUserqiubo(((BigDecimal)dbl.get("hyid")).toString());
	        if (userqiubo!=null){
	        	qiubo_number=userqiubo.getQiubo_number()+1;
	        	userqiubo.setQiubo_number(qiubo_number);
	        	HbmOperator.update(userqiubo);
	        }else{
	        	qiubo_number=userQiuboMng.getUserqiubo_number(hyid)+1;
	        	userQiuboMng.insertUserqiubo(hyid, qiubo_number);
	        }
	        sex="��";
        	if (hyinfo.getSex().equals("11"))
        		sex="��";
	        userQiuboMng.sendqiubowarn(hyid, hyinfo.getLcname(),sex, qiubo_number);
   		}
   }
   
   //add by gaojianhong for �����ﲨʱ���û��ﲨ���е���������1��ֱ�Ӳ����µļ�¼ end

    //System.out.println(sql);
    try
    {
       HbmOperator.executeSql(sql);
       out.println("<script language='javascript'>alert('���Ѿ��ɹ����ﲨ���ͱ��д�����û���');window.close();</script>");
    }catch(Exception ee)
    {
       System.out.println(ee.getMessage());
       out.println("<script language='javascript'>alert('���ﲨ���ͱ��д����û�ʧ�ܣ�');window.close();</script>");
    }

%>
