<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.web.obj.Userother" %>
<%@ page import="com.lover.mng.UserVisitMng" %>
<%@ page import="com.lover.mng.GRZQMng" %>
<%@ page import="com.lover.mng.OpLogMng" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<%@ page import="java.io.File" %>
<%@ page import="com.web.obj.Userarticle" %>
<%@ page import="java.util.List" %>
<%@ page import="com.web.obj.Userinfo" %>
<%@ page import="com.web.bean.QueryResult" %>
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
    <style type="text/css">
        .upload_bg { position:fixed; top:0px; left:0; width:100%; height:100%; background:#999; opacity:0.7; display:none;}
        .upload_box { position:fixed; top:60%; left:50%; margin-top:-200px; margin-left:-195px; width:390px; height:150px;background:#fff; display:none;}
        .upload_box .lm_name {width:100%; height:30px; border-bottom:1px solid #ccc; background:#f5f5f5;}
        .upload_box .lm_name h2 { font: bold 20px/50px "΢���ź�"; text-indent:20px;}
        .upload_box .block01 { width:390px; height:150px; float:left}
        .upload_box .block01 .tab { height:40px; border-bottom:1px solid #ddd; margin-top:20px; text-align:center}
        .upload_box .block01 .tab span { display:inline-block;padding:0 25px; height:40px; font:16px/40px "΢���ź�"; color:#333; cursor:pointer;}
        .upload_box .block01 .tab span.current { background:#21648f; color:#fff;}
        .upload_box .block01 table { display:none;}
        .upload_box .block01 table.show { display:block;}
        .upload_box .block01 table td { height:50px; font-size:14px;}
        .upload_box .block01 table td .txt01 { width:230px; height:30px; line-height:30px; font-size:14px}
        .upload_box .block01 table td .btn { width:230px; height:40px; background:#21648f; border-radius:5px; border:none; text-align:center; font:16px/40px "΢���ź�"; color:#fff; cursor:pointer;}
        .upload_box .block01 table td .btn:hover { background:#2d719c;}
        .upload_box .block01 table td .xym_btn { display:inline-block; height:30px; border:1px solid #ddd; background:#f5f5f5; font:14px/30px "����"; padding:0 15px; cursor:pointer;}
        .upload_box .close_btn { position:absolute; top:0px; right:0px; width:50px; height:30px; font:18px/30px Arial, Helvetica, sans-serif; text-align:center; color:#999; cursor:pointer;}
    </style>
    <script type="text/JavaScript">
        <!--
        function MM_openBrWindow(theURL,winName,features) { //v2.0
            window.open(theURL,winName,features);
        }
        function test()
        {
            if(!confirm('ȷ��ɾ����ͼƬ��')) return false;
        }

        function uploadCheck()
        {

            var fileext;
            var my_value;
            my_value=document.form1.file1.value;

            fileext=my_value.substr(my_value.length-3,3);
            fileext=fileext.toUpperCase();
            if ((fileext != "GIF") && (fileext != "JPG") )
            {
                alert("����ѡ��gif��jpgͼƬ�ļ�!");
                return false;
            }
        }
        //-->
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
        UserVisitMng.insertUserVisit(loginUser.getHyid(), vurl);
    }
    if(request.getParameter("bj") != null)
    {
        GRZQMng.userRemovePhotoA(request, session);
        ///ɾ����Ƭ��־
        OpLogMng.addOpLog(loginUser, null, request, OpLogMng.OP_LOG_U_R_PHOTO);
    }

    String cpages = SysCommonFunc.getStrParameter(request, "cpages");
    int cpage = SysCommonFunc.getNumberFromString(cpages,1);
    String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
    int totalPage  = SysCommonFunc.getNumberFromString(tcounts,0);
    int pagesize = 8;
    String upload = SysCommonFunc.getStrParameter(request,"upload");

%>

<%
    String afilepath = SysCommonFunc.getPhotoView();
    String afilepathsmall = SysCommonFunc.getPhotoSmallView();

%>
<div class="wrapper1250 cm_block01"> 
<div class="upload_bg" id="showUploadBgDiv"></div>
<div class="upload_box" id="showUploadDiv">
    <div class="lm_name"><div class="close_btn" onClick="hiddenDiv()">�ر�</div></div>
    <div class="block01">
        <form name="form1" method="post" action="upload_pic_do.jsp" enctype="multipart/form-data" onSubmit="return uploadCheck();" target="cf">
            <input type="hidden" name="add" value="add" />
            <table width="380" border="0" cellspacing="0" cellpadding="0" style="margin-top:8px;" class="show">
            <tr>
                <td width="200" align="left">&nbsp;&nbsp;&nbsp;ѡ����Ƭ�ļ���
        <input type="file" name="file1" style="HEIGHT: 22px; WIDTH: 200px">
     </td>

            </tr>
            <tr>

                <td align="center"><input  name="Submit" type="submit" class=BlueSubmitButton  value="�ϴ�"></td>
            </tr>


        </table>
        </form>
        <iframe style="display:none" width="0" height="0" name="cf">
        </iframe>

    </div>

</div>

    <div class="block01">
        <div class="box01"><span class="tx">
              <%
                  if(uother!=null && uother.getUserphoto1()!=null && !"".equals(uother.getUserphoto1())
                		  &&new File("E:\\web\\lover51\\upload\\hyimgsmall\\"+uother.getUserphoto1()).exists()){
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
            
            <p class="zl"><a href="perinfo.jsp?id=<%=grwhqUser.getHyid()%>"><strong><%=grwhqUser.getLcname()%></strong></a></p>
            <div class="lm_name">
                <h2>���˲���ר��</h2>
            </div>
            <%@ include file="grleft.jsp"%>
        </div>
        <div class="box02">
            <div class="lm_name">
                <h2>Ӱ������</h2>
            </div>
            <form id="form2" name="form2" method="post" action="">
                <div class="Photo">
                    <ul>
                        <li>

                            <%
                                if(uother!=null && uother.getUserphoto1() != null && uother.getUserphoto1().length() > 0
                                		&&new File("E:\\web\\lover51\\upload\\hyimg\\"+uother.getUserphoto1()).exists())
                                {
                            %>
                            <a href="../<%=afilepath+File.separator+uother.getUserphoto1()%>" target="_blank"><img src="../<%=afilepathsmall+File.separator+uother.getUserphoto1()%>" width="96" height="110" border="0" style="border:1px #ced6df solid" /></a>
                            <%
                            }
                            else
                            {
                            %>
                            <img src='images/nopic2.gif' width='96' height='110'>
                            <%
                                }
                            %>
                            <a href="gryj.jsp?bj=1" onClick="return test();">ɾ��</a>
                        </li>
                        <li>
                            <%
                                if(uother!=null && uother.getUserphoto2() != null && uother.getUserphoto2().length() > 0
                                		&&new File("E:\\web\\lover51\\upload\\hyimg\\"+uother.getUserphoto2()).exists())
                                {
                            %>
                            <a href="../<%=afilepath+File.separator+uother.getUserphoto2()%>" target="_blank"><img src="../<%=afilepathsmall+File.separator+uother.getUserphoto2()%>" width="96" height="110" border="0" style="border:1px #ced6df solid" /></a>
                            <%
                            }
                            else
                            {
                            %>
                            <img src='images/nopic2.gif' width='96' height='110'>
                            <%
                                }
                            %>
                            <a href="gryj.jsp?bj=2" onClick="return test();">ɾ��</a>
                        </li>
                        <li>
                            <%
                                if(uother!=null && uother.getUserphoto3() != null && uother.getUserphoto3().length() > 0)
                                {
                            %>
                            <a href="../<%=afilepath+File.separator+uother.getUserphoto3()%>" target="_blank"><img src="../<%=afilepathsmall+File.separator+uother.getUserphoto3()%>" width="96" height="110" border="0" style="border:1px #ced6df solid" /></a>
                            <%
                            }
                            else
                            {
                            %>
                            <img src='images/nopic2.gif' width='96' height='110'>
                            <%
                                }
                            %>
                            <a href="gryj.jsp?bj=3" onClick="return test();">ɾ��</a>
                        </li>
                        <li>
                            <%
                                if(uother!=null && uother.getUserphoto4() != null && uother.getUserphoto4().length() > 0)
                                {
                            %>
                            <a href="../<%=afilepath+File.separator+uother.getUserphoto4()%>" target="_blank"><img src="../<%=afilepathsmall+File.separator+uother.getUserphoto4()%>" width="96" height="110" border="0" style="border:1px #ced6df solid" /></a>
                            <%
                            }
                            else
                            {
                            %>
                            <img src='images/nopic2.gif' width='96' height='110'>
                            <%
                                }
                            %>
                            <a href="gryj.jsp?bj=4" onClick="return test();">ɾ��</a>
                        </li>
                        <li>
                            <%
                                if(uother!=null && uother.getUserphoto5() != null && uother.getUserphoto5().length() > 0)
                                {
                            %>
                            <a href="../<%=afilepath+File.separator+uother.getUserphoto5()%>" target="_blank"><img src="../<%=afilepathsmall+File.separator+uother.getUserphoto5()%>" width="96" height="110" border="0" style="border:1px #ced6df solid" /></a>
                            <%
                            }
                            else
                            {
                            %>
                            <img src='images/nopic2.gif' width='96' height='110'>
                            <%
                                }
                            %>
                            <a href="gryj.jsp?bj=5" onClick="return test();">ɾ��</a>
                        </li>
                    </ul>
                    <div class="MyBtn" style="line-height:30px;clear:both;padding:0">
                        <!--����ϴ���ť�������ڣ���ַup_photo.asp-->
                        <input type="button" name="Submit3" value="  �� �� �� Ƭ  "  class="btn" onClick="showUpload()"/><br/>
                        <%--<a href="upload_pic2.jsp" target="_blank"><img src="images/btn_sczp.gif" width="94" height="28" border="0" /></a>--%>

                        <span style="color:#F60; font-size:14px">(��ܰ��ʾ����Ƭ��С����30-200K����jpg��gif��ʽ��)</span>
                    </div>
                </div>
                <div class="lm_name">
                    <h2 style="float:left">�ļ�����</h2>


                    <div style="float:right"><a href='uploadarticle/upload_wj1.jsp' target="_blank"><img src="images/scwj.jpg"/></a> </div>
                    <!--�����ť��תҳ�棬��ַ2_14.asp-->
                </div>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="80" align="center" style="background-color:#f7f7f7"><strong>���</strong></td>
                        <td align="center" style="background-color:#f7f7f7"><strong>����</strong></td>
                        <td width="120" align="center" style="background-color:#f7f7f7"><strong>����</strong></td>
                    </tr>
                    <%
                        Long userId = loginUser.getHyid();
                        int prepage =cpage-1;
                        int nextpage =cpage+1;
                         QueryResult qr = GRZQMng.getUserArticleListPage(userId,cpage,pagesize);
                        totalPage = qr.pageCount;
                        List articleList = qr.resultList;
                        if(articleList!=null && articleList.size()>0){
                       for( int i = 0 ;i < articleList.size(); i ++)
                        {
                            boolean haveArticle=false;
                            Userarticle uarticle = null;
                            if(articleList != null && i < articleList.size())
                            {
                                haveArticle=true;
                                uarticle=(Userarticle)articleList.get(i);
                            }
                    %>
                    <tr>
                        <td align="center"><%=(cpage-1)*pagesize+i+1%></td>
                        <td align="center">
                        <%
                            if(haveArticle)
                            {
                        %>
                            ��<a href="veiwnews.jsp?id=<%=userId+"&articleid="+uarticle.getId()%>&wjfy=1" target="_blank"><%=uarticle.getTitle()%></a>
                            <%
                                }else
                                {
                                    out.println("���޴���");
                                }
                            %>
                        </td>
                        <td align="center">
                            <%
                                if(haveArticle)
                                {
                            %>
                            <a href='uploadarticle/upload_wj2.jsp?articleid=<%=uarticle.getId()%>' target="_blank"><img src="images/mod.jpg"></a>
                            <%
                            }else
                            {
                            %>
                            <img src="images/mod.jpg">
                            <%
                                }
                                if(haveArticle)
                                {
                           %>
                            <%--<input type="button" name="button" value="ɾ��" onclick="javascript:wiondow.open('uploadarticle/upload_wj1.jsp?delid=<%=uarticle.getId()%>&cid=<%=uarticle.getContentid()%>')" class="BlueBtn"/>--%>
                            <a href="uploadarticle/upload_wj1.jsp?delid=<%=uarticle.getId()%>&cid=<%=uarticle.getContentid()%>" target="gryjframe"><img src="images/del.png"></a>

                            <%
                            }else
                            {
                            %>
                            <img src="images/del.png">
                            <%
                                }
                            %>
                        </td>
                    </tr>
                    <%
                           }
                        }
                    %>
                  </table>
                    </form>
            <div class="Paging">
                <%
                   if(cpage == 1){
                        out.println("<a href='###'>��    ҳ</a>&nbsp;&nbsp;<a href='###'>��һҳ</a>&nbsp;&nbsp; ");
                    }else
                    {
                        out.println("<a href='javascript:turn(1)'>��    ҳ</a>&nbsp;&nbsp;");
                        out.println("<a href='javascript:turn("+prepage+")'>��һҳ</a>&nbsp;&nbsp;");
                    }
                    for(int i=0;i<totalPage;i++){
                        if((i+1)==cpage){
                            out.println("<a href='javascript:turn("+(i+1)+")' class='Check'>"+(i+1)+"</a>");
                        }else{
                            out.println("<a href='javascript:turn("+(i+1)+")'>"+(i+1)+"</a>");
                        }
                    }
                   if(cpage >= totalPage ){
                        out.println("<a href='###'>��һҳ</a>&nbsp;&nbsp;<a href='###'>βҳ</a>&nbsp;&nbsp; ");
                    }else
                    {
                        out.println("<a href='javascript:turn("+nextpage+")'>��һҳ</a>&nbsp;&nbsp;");
                        out.println("<a href='javascript:turn("+totalPage+")'>βҳ</a>&nbsp;&nbsp;");
                    }
                %>
            </div>
        </div>
        <div style="clear:both;"></div>
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
<form id="pageform" action="gryj.jsp" target="_self">
    <input name="cpages" type="hidden" value="1">
</form>
     <iframe id="gryjframe" name="gryjframe" width="0" height="0" frameborder="0"></iframe>
<%@ include file="bottom.jsp"%>
</body>
<script>
    function showUpload(){
        document.getElementById("showUploadDiv").style.display="block";
        document.getElementById("showUploadBgDiv").style.display="block";

    }
    function hiddenDiv(){
        document.getElementById("showUploadDiv").style.display="none";
        document.getElementById("showUploadBgDiv").style.display="none";
    }
    function turn(a){
        pageform.cpages.value=a;
        pageform.submit();
    }
    <%
       if("1".equals(upload)){
   %>
    window.setTimeout(reloadhtml ,1000);

    <%
    }
    %>

    function reloadhtml(){
        window.location.refresh();
    }
</script>
</html>
