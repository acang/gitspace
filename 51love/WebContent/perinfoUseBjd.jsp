<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.servlet.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.web.bean.QueryRecord" %>
<%@ page import="org.apache.commons.beanutils.DynaBean" %>

<%
  Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
  String isvery = SysCommonFunc.getStrParameter(request,"isvery");
  String userid = SysCommonFunc.getStrParameter(request,"userid");
  String isInfo = SysCommonFunc.getStrParameter(request,"isInfo");

//白金豆是否查看该会员了
boolean isMayView=false;
 //登录会员的白金豆数
 long bjd = 0l;
 long needbjd = 1l;
if(loginUser!=null && userid !=null){    
List listtemp = QueryRecord.queryByDynaResultSet("select * from user_bjd_viewrecord where hyid="+loginUser.getHyid()+" and viewhyid="+userid + "order by id asc",1,1).resultList;
if(listtemp != null && listtemp.size() > 0)
{

   DynaBean db = (DynaBean)listtemp.get(0);
   Date vdate = (Date)db.get("viewdate");
   Date ccdate = new Date(System.currentTimeMillis());

  if((ccdate.getTime()-vdate.getTime()) > 48*60*60*1000){
     isMayView = false;
   }else{
     isMayView = true;
   }
}
  //System.out.println("perinfoBjd.jsp--isMayView:"+isMayView);
 //如果在能看的时间内，就不用再查询白金豆了
 if(!isMayView){

   List listbjd = HbmOperator.list("from UserBjd as o where o.hyid="+loginUser.getHyid());
    if(listbjd != null && listbjd.size() > 0)
    {
        UserBjd ub = (UserBjd)listbjd.get(0);
        bjd = ub.getBjdnumber();
    }
    
    if(isvery !=null && "true".equals(isvery)){
    	needbjd = 2l;
    }
 }  
}
//System.out.println("perinfoBjd.jsp--isvery:"+isvery);
//System.out.println("perinfoBjd.jsp--bjd:"+bjd);
// System.out.println("perinfoBjd.jsp--needbjd:"+needbjd);
	//直接查看
    if(isMayView){
    //	 System.out.println("perinfoBjd.jsp--1111:");
    	if(isInfo !=null && "1".equals(isInfo)){
    		out.println("<script language='javascript'>window.parent.window.selectTagPer('pertagContent3',this,3);</script>");
  		}else{
  			out.println("<script language='javascript'>window.parent.location.href='perinfoSearch-id-"+userid+".htm';</script>");
  		}
    //扣除白金豆，并更新查看记录	
    }else if(loginUser!=null && bjd >= needbjd){
   // System.out.println("perinfoBjd.jsp--2222:");
     Userinfo hyInfo = HYRegMng.getUserinfoByHyid(userid);
    
   // System.out.println("perinfoBjd.jsp------1111111:");
     UserBjdRecord ubr = new UserBjdRecord();
    ubr.setBjddesc("查看("+hyInfo.getLcname()+")");
    ubr.setBjdnumber(0-needbjd);
    ubr.setHyid(loginUser.getHyid().toString());
    ubr.setRecodeTime(new Date(System.currentTimeMillis())); 
	ubr.setTjid(hyInfo.getHyid());
	ubr.setTjtype("");
    ubr.setId(SysCommonFunc.getSequenceIdForOracle("SEQ_WTJD"));
	//System.out.println("perinfoBjd.jsp-------222222222:");
    HbmOperator.insert(ubr);
	//System.out.println("perinfoBjd.jsp-------333333333:");
    HbmOperator.executeSql("update user_bjd set bjdnumber=bjdnumber-"+needbjd+ " where hyid ="+loginUser.getHyid());
	//System.out.println("perinfoBjd.jsp-------44444444:");
    HbmOperator.executeSql("insert into user_bjd_viewrecord (id,hyid,viewhyid,viewdate) values (SEQ_WTJD.NEXTVAL,"+loginUser.getHyid()+","+hyInfo.getHyid()+",sysdate)");
	//System.out.println("perinfoBjd.jsp-------555555555:");
    	if(isInfo !=null && "1".equals(isInfo)){
	//	System.out.println("perinfoBjd.jsp-------666666666666:");
    		out.println("<script language='javascript'>window.parent.window.selectTagPer('pertagContent3',this,3);</script>");
  		}else{
  	//	System.out.println("perinfoBjd.jsp-------777777777777:");
  			out.println("<script language='javascript'>window.parent.location.href='perinfoSearch-id-"+userid+".htm';</script>");
  		}
    }else{
	//System.out.println("perinfoBjd.jsp--3333:");
    	if(isInfo !=null && "1".equals(isInfo)){
    	
  		}else{ 
  			out.println("<script language='javascript'>alert('您是普通会员，请升级白金VIP会员或取得足够的白金豆！');window.parent.open('hyzf.htm');</script>");
  		}
    
    
    }




%>
