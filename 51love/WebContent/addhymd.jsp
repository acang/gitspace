<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="hibernate.db.HbmOperator" %>


<%
  Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
  Userother uother = (Userother)session.getAttribute(SysDefine.SESSION_LOGINNAME_OTHER);
if(loginUser == null)
{
  out.println("<script language='javascript'>alert('�����οͣ����ȵ�¼��ע��');location.replace('login.jsp');</script>");
  return;
}
String action = SysCommonFunc.getStrParameter(request,"bizaction");
String hyid   = SysCommonFunc.getStrParameter(request,"hyid");

if(SysCommonFunc.getNumberFromString(hyid,0)==0)
{
      out.println("<script language='javascript'>alert('��ѡ��Ҫ��ӵĺ���');window.close();</script>");

   System.out.println("sqlע��"+hyid);
   return;
}

if(action.equals("1")) //���Ӻ���
{
   if(hyid.length()==0)
   {
      out.println("<script language='javascript'>alert('��ѡ��Ҫ��ӵĺ���');window.close();</script>");
      return;
   }
   if(hyid.equals(loginUser.getHyid().longValue()+""))
   {
      out.println("<script language='javascript'>alert('�Բ����Լ����ܰ��Լ���Ϊ����!');window.close();</script>");
      return;
   }
   String s = GRZQMng.addHy(loginUser,hyid);
  /**    2015.11.11ȡ���л�Ա��Ů�����޸������������ʱ��Ϊ��ǰ����Ϊ�л�Ա���ﲨ�ĵ�һ��Ů��Ա�����������ʱ���Ϊ��ǰ
    Userinfo us = HYRegMng.getAllUserinfoByHyid(hyid);
     if("10".equals(loginUser.getSex()) && "11".equals(us.getSex())){
         Boolean a = GRZQMng.isAddHy(loginUser);
          if(!a){
             //�������Ϊ����ʱ��Աregtime5ʱ��Ϊ��ǰ��2015��7��7�գ��򿭽�����
             String sqlstr = "update userinfo set Regtime5 = sysdate where hyid="+hyid;
             HbmOperator.executeSql(sqlstr);
         }
         
     }
**/


   if(s == null)
   {
     out.println("<script language='javascript'>alert('���Ѿ��ɹ����˻�Ա��Ϊ���ѣ�');window.close();</script>");
     return;
   }else
   {
      out.println("<script language='javascript'>alert('"+s+"');window.close();</script>");
      return;
   }
}
%>
<%
if(action.equals("2")) //���Ӻ���
{
   if(hyid.length()==0)
   {
      out.println("<script language='javascript'>alert('��ѡ��Ҫ����������Ļ�Ա��);window.close();</script>");
      return;
   }
   if(hyid.equals(loginUser.getHyid().longValue()+""))
   {
      out.println("<script language='javascript'>alert('�Բ����Լ����ܰ��Լ����뵽��������');window.close();</script>");
      return;
   }
   String s = GRZQMng.addToBlack(loginUser,hyid);
   if(s == null)
   {
     out.println("<script language='javascript'>alert('���Ѿ��ɹ����˻�Ա���뵽��������');window.close();</script>");
     return;
   }else
   {
      out.println("<script language='javascript'>alert('"+s+"');window.close();</script>");
      return;
   }
}
out.println("<script language='javascript'>alert('ѡ���������');window.close();</script>");
%>

