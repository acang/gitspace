<%@ page contentType="text/html; charset=gbk" %>
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
<%@ page import="com.web.bean.*"%>
<%@ page import="org.apache.commons.beanutils.*"%>
<%
String rown = request.getParameter("rown");
String sql = "select o.hyid,lcname,lasttime,o.userphoto1,o.userphoto2,o.userphoto3,o.userphoto4,o.userphoto5 from userinfo u  left join userother o on (u.hyid=o.hyid) where u.lasttime < to_date('2007-01-01','YYYY-MM-DD') AND U.ISDEL=0 AND SEX = '11' AND IMG > 0";
List list = null;
if(rown != null && rown.length() > 0)
{
   QueryResult qr = QueryRecord.queryByDynaResultSet(sql,Integer.parseInt(rown),1);
   list =  qr.resultList;
   out.println("处理："+list.size()+"<br>");
   out.println("总共："+qr.rowCount);
   for(int i = 0; i < list.size();i ++)
   {
       DynaBean db = (DynaBean)list.get(i);
       String hyid = db.get("hyid").toString();
       Vector v = new Vector();
       MutSeaObject mso = new MutSeaObject();
       sql = "update userinfo set img = 0 where hyid="+hyid;
       mso.setSqlSea(sql,mso.SEA_SQL_UPDATE);
       v.add(mso);

       mso = new MutSeaObject();
       sql = "update userother set userphoto1 ='',userphoto2='',userphoto3='',userphoto4='',userphoto5='' where hyid="+hyid;
       mso.setSqlSea(sql,mso.SEA_SQL_UPDATE);
       v.add(mso);

       if(db.get("userphoto1") != null)
       {
          mso = new MutSeaObject();
          sql = "insert into rphoto values (SEQ_RPHOTO.nextval,'"+db.get("userphoto1")+"')";
          mso.setSqlSea(sql,mso.SEA_SQL_INSERT);
          v.add(mso);
       }

       if(db.get("userphoto2") != null)
       {
          mso = new MutSeaObject();
          sql = "insert into rphoto values (SEQ_RPHOTO.nextval,'"+db.get("userphoto2")+"')";
          mso.setSqlSea(sql,mso.SEA_SQL_INSERT);
          v.add(mso);
       }

       if(db.get("userphoto3") != null)
       {
          mso = new MutSeaObject();
          sql = "insert into rphoto values (SEQ_RPHOTO.nextval,'"+db.get("userphoto3")+"')";
          mso.setSqlSea(sql,mso.SEA_SQL_INSERT);
          v.add(mso);
       }

       if(db.get("userphoto4") != null)
       {
          mso = new MutSeaObject();
          sql = "insert into rphoto values (SEQ_RPHOTO.nextval,'"+db.get("userphoto4")+"')";
          mso.setSqlSea(sql,mso.SEA_SQL_INSERT);
          v.add(mso);
       }


       if(db.get("userphoto5") != null)
       {
          mso = new MutSeaObject();
          sql = "insert into rphoto values (SEQ_RPHOTO.nextval,'"+db.get("userphoto5")+"')";
          mso.setSqlSea(sql,mso.SEA_SQL_INSERT);
          v.add(mso);
       }
       HbmOperator.SeaMutData(v);


   }

}

//List list =  QueryRecord.qu

%>


<form id="form1" name="form1" method="post" action="">
  <input name="rown" type="text" id="rown" />
  <input type="submit" name="Submit" value="提交" />
</form>

