<%@ page contentType="text/html; charset=GBK" language="java"  errorPage="" %>
<%@ page import="com.web.bean.QueryRecord" %>
<%@ page import="com.web.bean.QueryResult" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<%@ page import="hibernate.db.HbmOperator" %>
<%@ page import="com.lover.mng.BBSMng" %>
<%@ page import="com.lover.mng.HYRegMng" %>
<%@ page import="com.lover.mng.UserVisitMng" %>
<%@ page import="com.web.obj.*" %>
<%@ page import="com.lover.mng.BCBMng" %>
<%@ page import="com.common.SysDefine" %>
<%@ page import="com.web.common.DateTools" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="org.apache.commons.beanutils.DynaBean" %>
<%@ page import="java.io.File" %>
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
<body class="cm_bbsxq">
<%@ include file="head.jsp"%>
<%
    String bbsid = SysCommonFunc.getStrParameter(request,"bbsid");
    if(SysCommonFunc.getNumberFromString(bbsid,0)==0)
    {
        System.out.println("sqlע��"+bbsid);
        return;
    }
    Long loginId = 0L;
    Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
    if (loginUser!=null){
        loginId = loginUser.getHyid();
        String vurl="";
        vurl=request.getRequestURL().toString();
        if (request.getQueryString()!=null){
            vurl+="?"+request.getQueryString();
        }
        UserVisitMng.insertUserVisit(loginUser.getHyid(), vurl);
    }

    Bb topicBb = BBSMng.getBBSById(bbsid);
    Bcb bcb = null;
    String content = "";
    String lanmu_name = "";
    if(topicBb != null && topicBb.getContent() != null)
    {
        bcb = BCBMng.getBcbFromid(topicBb.getContent().toString());
        content = SysCommonFunc.getStringFromBlob(bcb.getContent());
        Long sortid = topicBb.getSortid();

        if(13 == sortid){
            lanmu_name = "���Ѷ�̬";
        }
        if(3 == sortid){
            lanmu_name = "���ѹ���";
        }
        if(7 == sortid){
            lanmu_name = "���ѹ���";
        }
        if(9 == sortid){
            lanmu_name = "�ҵĹ���";
        }
    }
    Bbsuser buser = BBSMng.getBbsuserByHyid(topicBb.getUserId().toString());
    Userother uother = null;
    if(buser != null)
        uother = HYRegMng.getUserOtherByHyid(buser.getHyid().toString());
    if(buser == null)
        buser = new Bbsuser();
    if(uother == null)
        uother = new Userother();

    Bbssort bsort = BBSMng.getBbssort(topicBb.getSortid().toString());

    try
    {
        HbmOperator.executeSql("update bbs set hits = hits+1 where id = " + topicBb.getId());
    }catch(Exception e){}

/*   delete by linyu at 20150914 for ִ��Ч��̫�͡����ݿ�CPUռ��100% 
    String sql = "select b.id,b.author,b.user_id,b.s_time,b.re_id,b.commend,b.zan,bu.grade,bu.moneys,bu.moneynew,bc.content,u.Userphoto1," +
            "ui.regtime  from bbs b  left join bbsuser bu on (b.user_id = bu.hyid) left join bcb bc on (b.content = bc.id) " +
            "left join Userother u on b.user_id=u.hyid " +
            "left join Userinfo ui on b.user_id=ui.hyid "+
            " where b.ischeck='0' and (b.re_id ="+ bbsid + "  or b.commend ="+ bbsid +") order by b.id desc";
            
             */
     
       String sql = "select * from ( select b.id,b.author,b.user_id,b.s_time,b.re_id,b.commend,b.zan,bu.grade,bu.moneys,bc.content,u.Userphoto1," +
            "ui.regtime,bu.moneynew  from bbs b  left join bbsuser bu on (b.user_id = bu.hyid) left join bcb bc on (b.content = bc.id) " +
            "left join Userother u on b.user_id=u.hyid " +
            "left join Userinfo ui on b.user_id=ui.hyid "+
            " where b.ischeck='0' and  b.re_id ="+ bbsid   ;        
        sql +=  "union all  select b.id,b.author,b.user_id,b.s_time,b.re_id,b.commend,b.zan,bu.grade,bu.moneys,bc.content,u.Userphoto1," +
            "ui.regtime,bu.moneynew  from bbs b  left join bbsuser bu on (b.user_id = bu.hyid) left join bcb bc on (b.content = bc.id) " +
            "left join Userother u on b.user_id=u.hyid " +
            "left join Userinfo ui on b.user_id=ui.hyid "+
            " where b.ischeck='0' and  b.commend ="+ bbsid +" ) order by  id desc ";   
                       
    String cpages = SysCommonFunc.getStrParameter(request,"cpages");
    int cpage = SysCommonFunc.getNumberFromString(cpages, 1);
    int pagesize = 10;
    QueryResult qr = null;
    qr = QueryRecord.queryByDynaResultSet(sql, pagesize, cpage);
    int totalPage = qr.pageCount;
    int totalCount = qr.rowCount;
    cpage = qr.pageNum;
    int prepage = cpage-1;
    int nextpage = cpage+1;

%>


<%
    String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");
    String isfb   = SysCommonFunc.getStrParameter(request,"isfb");
    if(bizaction.equals("01"))
    {
        if(loginUser == null)
        {
            out.println("<script language='javascript'>alert('�����οͣ�����Ȩ�޲��������ȵ�½!��');showLogin();</script>");
            return;
        }


        String mailreg = "[\\w\\.\\-]+@([\\w\\-]+\\.)+[\\w\\-]+";
        String preg    = "\\d{6,}";

        String s = null;
        if(content == null)
            content = "";
        String tempc=content.replaceAll("<p>","");
        tempc = tempc.replaceAll("</p>","");
        //System.out.println(tempc);
        if(tempc == null || tempc.length() < 10)
        {

            s = "���������10���֣�";
        }
        else
        {
            java.util.regex.Pattern pattern1 = java.util.regex.Pattern.compile(mailreg,java.util.regex.Pattern.CASE_INSENSITIVE);
            java.util.regex.Pattern pattern2 = java.util.regex.Pattern.compile(preg,java.util.regex.Pattern.CASE_INSENSITIVE);
            if(pattern1.matcher(content).matches() || pattern2.matcher(content).matches())
                s = "��������������ϵ��ʽ����������д";
            else
                s = BBSMng.userAddReTopic(request,loginUser,content,bbsid);

        }


        if(s == null)
        {
            out.println("<script langauge=javascript>alert('���ͳɹ�');</script>");
            out.println("<script langauge=javascript>parent.location.reload();</script>");
            isfb = "isfb";
            content = "";
        }
        else{
            out.println("<script langauge=javascript>alert('"+s+"��');</script>");
        }


    }

%>

<div class="wrapper1250 cm_block01" style="margin-top:8px;">
    <div class="box01" style="background-color:#f7f7f7; padding-left:15px; width:1085px;font-size:14px; height:40px; line-height:40px; margin-bottom:8px;">
        <span style=" float:left"><a href="#" style="font-size:14px">
            <strong>��Ա����</strong></a>&nbsp;&gt;&nbsp;
            <a href="#" style="font-size:14px"><strong><%=lanmu_name%></strong></a>&nbsp;&gt;&nbsp;
            <strong><%=topicBb.getTitle()%></strong></span></div>
    <div class="block01">
        <%
            String afilepathsmall = SysCommonFunc.getPhotoSmallView();

        %>


    </div>



    <iframe src="addretopic22.jsp?bbsid=<%=topicBb.getId()%>"  width="100%" height="205" frameborder="0" scrolling="no"></iframe>

    <div style="clear:both"></div>
        <%
           Date now= new Date();
            Calendar cal = Calendar.getInstance();
        cal.setTime(now);
        cal.add(Calendar.DATE,-7);
        for(int i=0;i < qr.resultList.size();i ++)
        {
            DynaBean db = (DynaBean)qr.resultList.get(i);
            uother = HYRegMng.getUserOtherByHyid(db.get("user_id").toString());
            uother.getUserphoto1();

    %>
    <div class="block01" style="padding:0;">
        <div class="box01">
            <span class="tx">

                 <%
                     if(uother.getUserphoto1() != null)
                     {
                 %>

         <a href="./perinfo-id-<%=db.get("user_id")%>.htm" target=_blank  style="color: #21648f" >
             <img src="../<%=afilepathsmall+File.separator+uother.getUserphoto1()%>" width="130" height="150" border="0">
         </a>
                 <%
                     }
                 %>

            </span>
            <ul>
                <%
                    if(!"749693".equals(db.get("user_id").toString())){
                %>
                <li><strong>�� �� �ˣ�<a href="./perinfo-id-<%=db.get("user_id")%>.htm" target=_blank  style="color: #21648f" ><%=db.get("author")%></a>   </strong></li>
                <li><strong>��̳�ȼ���</strong>
                    <%=BBSMng.getGradeDes(SysCommonFunc.getNumberFromString(db.get("moneys") + "", 0))%>
                </li>
                <%
                            int moneytotal = 0;
                    System.out.println(db.get("moneys"));
                              if(db.get("moneys")!=null){
                                  moneytotal += Integer.parseInt(db.get("moneys").toString());
                              }
                    System.out.println(db.get("moneynew"));
                         if(db.get("moneynew")!=null){
                        moneytotal += Integer.parseInt(db.get("moneynew").toString());
                      }

                %>
                <li><strong>�𡡡��ң�</strong><%=moneytotal%> ���</li>
                <li><strong>����ʱ�䣺</strong><%=db.get("regtime")%></li>
                <%
                }else{
                %>
                <strong>�� �� �ˣ�<span  style="color: #21648f" ><%=db.get("author")%></span>   </strong>
                <%
                    }
                %>



            </ul>
        </div>
        <div class="box02">

            <%
                if(!db.get("re_id").toString().equals(bbsid.toString()))
                {
            %>
            <%
            }else{
            %>
            <div class="lm_name02">
                <span style=" float:left; font-size:14px">&nbsp;&nbsp;&nbsp;�ظ�ʱ�䣺
                        <%
                            if (!((Date)db.get("s_time")).after(cal.getTime())){%>
              		     2��ǰ�ظ�
              		  <%} else {%>
              		     <%=DateTools.dateToString((Date)db.get("s_time"),true)%>
              		  <% }%>
                </span>
                <a href="javascript:dianZan(<%=db.get("id")%>,<%=db.get("user_id")%>,<%=loginId%>)" style="float:right; display:block;height:30px;
                 background:url(skin/zan.jpg) 40px 0 no-repeat; margin:5px 0; line-height:30px; font-size:16px; margin-right:80px;">
                    ����&nbsp;&nbsp;&nbsp;&nbsp;<strong style="color:#F00; font-size:18px">(<%=db.get("zan")==null?"0":db.get("zan")%>)</strong></a>
            </div>
            <div class="content" style="font-size:16px;"><%=SysCommonFunc.getStringFromBlob((java.sql.Blob)db.get("content"))%></div>
            <%
                }
            %>
        </div>
        <div style="clear:both"></div>
    </div>
        <%

        }
    %>
    <div class="Paging" style="height:60px; margin-top:30px;"><%
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

    <div style="clear:both"></div>

    <%@ include file="bottom.jsp"%>
</body>

<form id="pageform" name="pageform"  method="Post" action="disp_bbs.jsp" target="_self">
    <input type="hidden" name="cpages" value="<%=cpage%>" />
    <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
    <input type="hidden" name="bbsid" value="<%=bbsid%>">
</form>

<form id="zanForm" name="zanForm" name="turn" method="Post" action="zan_do.jsp" target="zanIframe">
    <input type="hidden" name="bbsReId" value="">
    <input type="hidden" name="bbsid" value="<%=bbsid%>">
    <input type="hidden" name="userId" value="">
    <input type="hidden" name="selfId" value="">
</form>
<iframe name="zanIframe" width="0" height="0" frameborder="0"></iframe>
<script>
    function turn(a){
        document.pageform.cpages.value=a;
        document.pageform.submit();
    }

    function dianZan(a,b,c){
        if(c==0){
            alert("�����οͣ����ȵ�½��ע�ᣡ");
            showLogin();
        }
        document.zanForm.bbsReId.value = a;
        document.zanForm.userId.value = b;
        document.zanForm.selfId.value = c;
        document.zanForm.submit();

    }
</script>


</html>
