<%@ page contentType="text/html; charset=GBK" language="java"  errorPage="" %>
<%@ page import="com.web.obj.Userother" %>
<%@ page import="com.web.obj.Userinfo" %>
<%@ page import="com.lover.mng.UserVisitMng" %>
<%@ page import="hibernate.db.HbmOperator" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<%@ page import="com.web.bean.QueryRecord" %>
<%@ page import="com.web.bean.QueryResult" %>
<%@ page import="org.apache.commons.beanutils.DynaBean" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="com.web.common.DateTools" %>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date" %>
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
    <script type="text/JavaScript">
        <!--
        function MM_openBrWindow(theURL,winName,features) { //v2.0
            window.open(theURL,winName,features);
        }
        function check()
        {
            if (isNaN(go2to.page.value))
                alert("����ȷ��дת��ҳ����");
            else if (go2to.page.value=="")
            {
                alert("������ת��ҳ����");
            }
            else
                go2to.submit();
        }
        function test()
        {
            if(!confirm('ȷ��ɾ����')) return false;
        }
        //-->
        function turn(pages)
        {

            if (isNaN(pages))
            {
                alert("����ȷ��дת��ҳ����");
                return;
            }
            document.go2to.cpages.value=pages+"";

            document.go2to.submit();
        }
    </script>
</head>
<body class="cm_grzx">
<%@ include file="head.jsp"%>
<%
    Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
    Userother uother = (Userother)session.getAttribute(SysDefine.SESSION_LOGINNAME_OTHER);

    if(loginUser == null)
    {
        out.println("<script language='javascript'>alert('�����οͣ�����Ȩ�޲��������ȵ�¼��ע��');showLogin();</script>");
        return;
    }else{
        String vurl="";
        vurl=request.getRequestURL().toString();
        if (request.getQueryString()!=null){
            vurl+="?"+request.getQueryString();
        }
        UserVisitMng.insertUserVisit(loginUser.getHyid(),vurl);
    }

    String[] delid = request.getParameterValues("delid");
    if(delid != null && delid.length >0)
    {
        String sqlarray[] = new String[delid.length];
        for(int i =0;i < delid.length;i ++)
            sqlarray[i] = "delete from db_qiubo where id="+delid[i] + " and postuserid="+loginUser.getHyid();
        HbmOperator.executeSql(sqlarray);
    }

    String cpages = SysCommonFunc.getStrParameter(request,"cpages");
    int cpage = SysCommonFunc.getNumberFromString(cpages,1);
    String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
    int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);
    int pagesize = 20;
    if(delid != null && delid.length > 0){
        tcount = 0;
        cpage=1;
    }
    Calendar cal = Calendar.getInstance();
    Date csDate = loginUser.getCsdate();
    if(csDate !=null){
    	cal.setTime(loginUser.getCsdate());
    }else{
        cal.add(Calendar.DAY_OF_MONTH, 1);
    }
    
    int start = cal.get(Calendar.YEAR)-5;
    int end = cal.get(Calendar.YEAR)+20;
    String sDate=start+"-01-01";
    String eDate=end+"-12-31";
    Date lastTime=null;
    if (loginUser!=null){
        lastTime=loginUser.getRegtime();
    }
    QueryResult qr = null;
    QueryResult qrall = null;
    Date regtime = loginUser.getRegtime();
    String regdate = DateTools.DateToString(regtime,"yyyy-MM-dd");
  //  String sql = "select q.*,u.LCNAME from Db_Qiubo q join USERINFO u on q.SENDUSERID=u.HYID where q.postuserid = "+loginUser.getHyid() +" and q.sendtime >= sysdate - 90 order by q.id desc";
    //
    String sql = "";
   if("11".equals(loginUser.getSex())){
        sql = "select q.id,q.SENDUSERID,q.SENDUSERNAME,q.SENDTIME,u.LCNAME,q.zt from Db_Qiubo q join USERINFO u on q.SENDUSERID=u.HYID where q.postuserid = "+loginUser.getHyid() +" order by sendtime desc";

   }else{
        sql = "select q.id,q.SENDUSERID,q.SENDUSERNAME,q.SENDTIME,u.LCNAME,q.zt from Db_Qiubo q join USERINFO u on q.SENDUSERID=u.HYID where q.postuserid = "+loginUser.getHyid() +" union all select f.id,f.SENDUSERID,f.SENDUSERNAME ,f.SENDTIME,u.LCNAME , f.id from Db_QiuboFs f join USERINFO u on f.SENDUSERID=u.HYID where u.CSDATE>=to_date('"+sDate+"','YYYY-MM-DD') and u.CSDATE<=to_date('"+eDate+"','YYYY-MM-DD') and u.s1='"+loginUser.getS1()+"' and u.sex='11' and sendtime >=to_date('"+regdate+"','YYYY-MM-DD') order by sendtime desc";
    }
    qr = QueryRecord.queryByDynaResultSet(sql,pagesize,cpage);
    qrall = QueryRecord.queryByDynaResultSet(sql,1000,1);
    int totalPage = qr.pageCount;
    int totalCount = qr.rowCount;
    cpage = qr.pageNum;
    int prepage = cpage-1;
    int nextpage = cpage+1;
    List list = qr.resultList;
    List listall = qrall.resultList;
%>

<%
    String afilepath = SysCommonFunc.getPhotoView();
    String afilepathsmall = SysCommonFunc.getPhotoSmallView();

%>
<div class="wrapper1250 cm_block01">
  <div class="block01">
      <div class="box01"> <span class="tx">
            <%
                if(uother!=null && uother.getUserphoto1()!=null && !"".equals(uother.getUserphoto1())){
                    String left_small_pic ="../"+afilepathsmall+File.separator+uother.getUserphoto1();
            %>
      <img src="<%=left_small_pic%>" alt=""/>
       <%
       }else{
       %>
          <img src="images/nopic2.gif" alt=""/>
       <%
           }
       %>
      </span>
          <p class="zl"><strong><%=grwhqUser.getLcname()%></strong></p>
          <div class="lm_name">
              <h2>���˲���ר��</h2>
          </div>
          <%@ include file="grleft.jsp"%>
      </div>
    <div class="box02">
      <div class="lm_name">
        <h2>�յ����ﲨ���������3���£�</h2>
      </div>
      <div style="clear:both"></div>
        <form name="go2to" method="post" action="grqb.jsp">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <input type="hidden" name="cpages" value="<%=cpage%>" />
          <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
        <tr>
          <td align="center" style="background-color:#f2f4f8;width:75px;"><strong>���</strong></td>
          <td align="center" style="background-color:#f2f4f8;width:160px;"><strong>�����ﲨʱ��</strong></td>
          <td align="center" style="background-color:#f2f4f8;"><strong>�ǳ�</strong></td>
          <td align="center" style="background-color:#f2f4f8;width:120px;"><strong>���ʹ���</strong></td>
        </tr>
            <%
 //'###################
//'# ��ѯ�յ����ﲨ
//'###################


                DynaBean dbl=null;
                String[] tem = new String[listall.size()];
                for(int i=0;i<listall.size();i++){
                    dbl=(DynaBean)listall.get(i);
                    String lcname = dbl.get("lcname").toString();
                    tem[i]= lcname;
                }
                for(int i =0;i < list.size();i ++)
                {
                    dbl=(DynaBean)qr.resultList.get(i);
                    String ascs="�״��ﲨ";
                    String lcname = dbl.get("lcname").toString();
                      int num = 0;

                      for(int j =0;j < tem.length; j++){
                          if(lcname.equals(tem[j])){
                              num = j;
                            }
                      }
                    if(num > (cpage-1)*pagesize+i){
                        ascs="�ٴ��ﲨ";
                    }

                  String time_str =  dbl.get("sendtime").toString();
            %>
        <tr>
          <td align="center"><%=(cpage-1)*pagesize+i+1%></td>
          <td align="center"><%=time_str.substring(0,10)%></td>
          <td align="center"><a href="perinfo.jsp?id=<%=dbl.get("senduserid")%>" target="_blank"><span style="color:#21648f"><strong><%=lcname%></strong></span></a></td>
          <td align="center"><%=ascs%></td>
        </tr>
            <%
                }

            %>
      </table>
        </form>
             <br/>
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
    <div style="clear:both"></div>
  </div>
  <div class="block02">
    <div class="box02">
      <div class="lm_name">
        <h2>ɨ���ά��</h2>
      </div>
      <div class="erweima"><img src="images/weixin_erweima.jpg" alt="" width="120" height="120"/><br/>΢�Ź��ںţ��ƶ�վ��</div>
      <div class="erweima"><img src="images/kf_img.jpg" alt="" width="120"  /><br/>�ͷ��绰</div>
    </div>
  </div>
  <div style="clear:both"></div>
</div>
<%@ include file="bottom.jsp"%>
</body>
<form id="pageform" name="turn" method="Post" action="grqb.jsp" target="_self">
    <input type="hidden" name="cpages" value="<%=cpage%>" />
    <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
</form>

<script>
    function turn(a){
        pageform.cpages.value=a;
        pageform.submit();
    }
</script>
</html>
