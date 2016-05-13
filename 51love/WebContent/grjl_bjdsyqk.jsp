<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.lover.mng.UserVisitMng" %>
<%@ page import="hibernate.db.HbmOperator" %>
<%@ page import="com.web.obj.*" %>
<%@ page import="com.web.common.*" %>
<%@ page import="com.common.SysDefine" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.*"%>  
<%@ page import="java.text.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="com.web.bean.*" %>
<%@ page import="org.apache.commons.beanutils.*"%>

<%
    Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
    Userother uother = (Userother)session.getAttribute(SysDefine.SESSION_LOGINNAME_OTHER);
    if(loginUser == null)
    {
        out.println("<script language='javascript'>alert('��¼�ѳ�ʱ�������µ�¼��');history.go(-1);</script>");
        return;
    }

    String cpages = SysCommonFunc.getStrParameter(request, "cpages");
    int cpage = SysCommonFunc.getNumberFromString(cpages,1);
    String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
    int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);
    int pagesize = 20;
    
	String sql = "select recode_time,bjddesc,bjdnumber,tjid from user_bjd_record where hyid='" + loginUser.getHyid() +"' order by recode_time desc";
	
	QueryResult qr = QueryRecord.queryByDynaResultSet(sql,pagesize,cpage);
	int totalPage = qr.pageCount;
   	int totalCount = qr.rowCount;
	cpage = qr.pageNum;
	int prepage = cpage-1;
	int nextpage = cpage+1;
	
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��</title>
<meta name="description" content="51����������վ-�й�������ҵ���Ʒ�ơ����ܹ�ϵ���������¡�����ѵ����ȫ��λ֧������������ʮ����Ӫ��ǧ���Ա���������飬��51���ѿ�ʼ��" />
<meta http-equiv=��Cache-Control�� content=��no-transform�� />
<meta http-equiv=��Cache-Control�� content=��no-siteapp�� />
<meta name="keywords" content="51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/lcmbase.js"></script>
</head>
<body class="cm_grzx">
  <div class="block01">
		<table width="100%" border="1" style="border-color:#fffacd" cellspacing="0" cellpadding="0" >
          <tbody>
            <tr>
				<td width="10%" align="center" style="background-color:#f2f4f8; height: 30px"><strong>���</strong></td>
        		<td width="25%" align="center" style="background-color:#f2f4f8;" ><strong>ʱ��</strong></td>
				<td  align="center" style="background-color:#f2f4f8;" ><strong>����ԭ��</strong></td>
        		<td width="20%" align="center" style="background-color:#f2f4f8;" ><strong>��������λ���ţ�</strong></td>
			</tr>
			<%
		        List list = qr.resultList;
		        if(list == null || list.size()==0)
		        {
		    %>
			<tr>
				<td align="center" colspan="4">û��ʹ�����</td>
			</tr>
			<%
			}else{
				for(int i =0;i < list.size();i ++){
				   DynaBean db = (DynaBean)qr.resultList.get(i);
				
				    DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
				  // String bjddate     = (String)db.get("recode_time");
				 Timestamp bjddate     =   (Timestamp)db.get("recode_time");
				   String bjdzj   = (String)db.get("bjddesc");
				//   String bjdsl   = (String)db.get("bjdnumber");
				String bjdTime = "";
				    try {   
			            //����һ   
			            bjdTime = sdf.format(bjddate);   
			        } catch (Exception e) {   
			            e.printStackTrace();   
        			}  
				   String bjdnumber = "0"; 
				   if(db.get("bjdnumber") !=null ){
				  int bjd =  Integer.parseInt(db.get("bjdnumber").toString());
				   		if(bjd >0){
				   			bjdnumber = "+"+bjd;
				   		}else{
				   			bjdnumber = bjd+"";
				   		}
				   }
				   
			%>
			<tr>
            	<td align="center"><%=(cpage-1)*pagesize+i+1%></td>
            	<td align="center"><%=bjdTime%></td>
            	<td align="center">
            		<%
            			if(db.get("tjid") !=null && !"0".equals(db.get("tjid").toString()) ){
            		 %> 
            		 	<a href="./perinfo-id-<%=db.get("tjid")%>.htm" style='color:blue;text-decoration:underline;cursor:auto;' target="_blank"><%=bjdzj%></a>
            	<%}else{ %>
            		<%=bjdzj%>
            	<%}%>
            	</td>
            <td align="center"><%=bjdnumber%></td>
            </tr>
            <%
				}
				 long bjdAllNum = 0l;
			List listbjd = HbmOperator.list("from UserBjd as o where o.hyid="+loginUser.getHyid());
			    if(listbjd != null && listbjd.size() > 0)
			    {
			        UserBjd ub = (UserBjd)listbjd.get(0);
			        bjdAllNum = ub.getBjdnumber();
			    }
				
			%>
			<tr>
            	<td align="left" colspan="4"><strong>�ϼ�<%=bjdAllNum%>��</strong></td>
            </tr>
			<% 
			}
			%>
          </tbody>
    </table>
    <div class="Paging">
    
	<%
        int startpage = 0;
        if((cpage-5) <=0){
            startpage = 1;
        }else{
            startpage = cpage-5;
        }
        if(cpage == 1)
            out.println("<a href='###'>��    ҳ</a>&nbsp;&nbsp;<a href='###'>��һҳ</a>");
        else
        {
            out.println("<a href='javascript:turn(1)'>��    ҳ</a>");
            out.println("<a href='javascript:turn("+prepage+")'>��һҳ</a>");
        }
        for (int j = startpage; j < startpage + 9; j++) {
            if (j <= totalPage) {
                if (j == cpage) {
                    out.println("<a href='javascript:turn(" + j + ")' class='Check'>" + j + "</a>");
                } else {
                    out.println("<a href='javascript:turn(" + j + ")'>" + j + "</a>");
                }
            }
        }

        if(cpage >= totalPage )
            out.println("<a href='###'>��һҳ</a>&nbsp;&nbsp;<a href='###'>βҳ</a>");
        else
        {
            out.println("<a href='javascript:turn("+nextpage+")'>��һҳ</a>");
            out.println("<a href='javascript:turn("+totalPage+")'>βҳ</a>");
        }

    %>

    <div style="clear:both;"></div>
</div>
</div>
</body>
</html>
