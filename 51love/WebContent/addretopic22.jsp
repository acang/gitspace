<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="java.io.File" %>
<%
    Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
  //  Userother uother = HYRegMng.getUserOtherByHyid(loginUser.getHyid().toString());
    String afilepathsmall = SysCommonFunc.getPhotoSmallView();
    String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");
    String bbsid = SysCommonFunc.getStrParameter(request,"bbsid");
    String isfb   = SysCommonFunc.getStrParameter(request,"isfb");
    String content = SysCommonFunc.getStrParameter(request,"content");
    if(bizaction.equals("01"))
    {
        if(loginUser == null)
        {
            out.println("<script language='javascript'>alert('�����οͣ�����Ȩ�޲��������ȵ�¼��ע��');parent.showLogin('disp_bbs.jsp?bbsid="+bbsid+"','disp_bbs.jsp?bbsid="+bbsid+"');</script>");
            return;
        }

        String mailreg = "[\\w\\.\\-]+@([\\w\\-]+\\.)+[\\w\\-]+";
        String preg    = "\\d{6,}";

        String s = null;
        if(content == null)
            content = "";
        String tempc=content.replaceAll("<p>","");
        tempc = tempc.replaceAll("</p>","");
        if(tempc == null || tempc.length() < 10)
        {

            s = "���������10���֣�";
        }
        else
        {
            java.util.regex.Pattern pattern1 = java.util.regex.Pattern.compile(mailreg,java.util.regex.Pattern.CASE_INSENSITIVE);
            java.util.regex.Pattern pattern2 = java.util.regex.Pattern.compile(preg,java.util.regex.Pattern.CASE_INSENSITIVE);
            if(pattern1.matcher(content).matches() || pattern2.matcher(content).matches()){
                s = "��������������ϵ��ʽ����������д";
            }else{
                s = BBSMng.userAddReTopic(request,loginUser,content,bbsid);
            }


        }


        if(s == null)
        {
            out.println("<script langauge=javascript>alert('���ͳɹ�');</script>");
            out.println("<script langauge=javascript>parent.location.reload();</script>");
            isfb = "isfb";
            content = "";
        }
        else
            out.println("<script langauge=javascript>alert('"+s+"��');</script>");

    }

%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��</title>
    <meta name="description" content="51��������-�D�й�AAA��������ཻ����վ����Ա�鲼�������ѣ��㶫���ѣ��Ϻ����ѣ����ս��ѵ�ȫ������ʡ�С�51���������Ƚ�רҵ����ݳ�ֵ,�ѻ���400������н��ѻ�Ա��" />
    <meta http-equiv=��Cache-Control�� content=��no-transform�� />
    <meta http-equiv=��Cache-Control�� content=��no-siteapp�� />
    <meta name="keywords" content="51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/lcmbase.js"></script>
    <script type='text/javascript' src='/dwr/interface/service.js'></script>
    <script type='text/javascript' src='/dwr/engine.js'></script>

    <script language="javascript">
        function check()
        {
            var con = document.getElementById("content").value;
            if(con.indexOf("www.") >= 0 ||con.indexOf(".net") >= 0
                    ||con.indexOf(".cn") >= 0 || con.indexOf(".com") >= 0
                    || con.indexOf("ftp://") >= 0 || con.indexOf("http://") >= 0
                    || con.indexOf(".org") >= 0 || con.indexOf("<a href") >= 0)
            {
                alert("�����벻Ҫ����ַ���ӣ�");
                return false;
            }

            isfb = document.form1.isfb.value;
            if(!(isfb == ""))
            {
                alert("�벻Ҫ�ظ�����!");
                return false;
            }
            return true;
        }
        function tijiao(){
          //  document.form1.submit();
            service.addReTopic("1","2","3",addtopicBack);

        }

        function addtopicBack(data){
            var obj = parent.document.getElementById("bbs_re_area");
            obj.innerHTML ="<div class='block01' style='padding:0;'>"+
                    "<div class='box01'><span class='tx'>"+
                    "<a href='./perinfo-id-<%//=loginUser.getHyid()%>.htm' target='_blank'  style='color: #21648f' >"+
                    "<img src='../<%//afilepathsmall+File.separator+uother.getUserphoto1()%>' width='130' height='150' border='0'>"+

                    "</a></span>"+
                    "<ul><li><strong>�� �� �ˣ�<a href='./perinfo-id-<%//=loginUser.getHyid()%>.htm' target=_blank  style='color: #21648f' ><%//=loginUser.getLcname()%></a>   </strong></li>"+
                    "<li><strong>��̳�ȼ���</strong></li>"+
                    "<li><strong>�𡡡��ң�</strong>1111���</li>"+
                    "<li><strong>����ʱ�䣺</strong></li>"+
                    "<li><strong>�� �� �ˣ�<span style='color:#21648f' >222222</span></strong></li>"+
                    "</ul></div>"+
                    "<div class='box02'> "+
                    "<div class='lm_name02'><span style='float:left; font-size:14px'>&nbsp;&nbsp;&nbsp;�ظ�ʱ�䣺</span></div>"+
                    "<div class='content' style='font-size:16px;'><%=content%></div>"+
                    "</div><div style='clear:both'></div></div>"+obj.innerHTML;
        }
    </script>
    
</head>
<body class="cm_bbsxq">
<div class="wrapper1250 cm_block01" style="margin-top:0px; margin-bottom: 1px ">
<div class="block02" style="width:890px; margin:8px 0; margin-left:210px;vertical-align: middle">
    <div class="lm_name" style="background-color:#568cb6">
        <h2>��Ա�ظ�</h2>
    </div>
    <form name="form1" method="post" action="addretopic22.jsp" onSubmit=" return check();">
        <input type="hidden" name="bizaction" value="01">
        <input type="hidden" name="bbsid" value="<%=bbsid%>">
        <input type="hidden" name="isfb" value="<%=isfb%>"/>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" >

            <tr>
                <td><textarea id="content" name="content" cols="" rows="" style="width:884px; height:100px;"></textarea></td>
            </tr>
            <tr>
                <td align="center">
                    <a href="javascript:tijiao()" style="background-color:#21648f; height:30px; line-height:30px;
                        text-align:center; color:#FFF; width:100px; display:inline-block">�� ��</a></td>
            </tr>

        </table>
    </form>
</div>
</div>

</body>
</html>
