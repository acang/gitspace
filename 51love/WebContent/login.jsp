<%
    String login = System.currentTimeMillis()+"";
    session.setAttribute("login",login);
    session.setAttribute("sp",login);
%>
<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <title>51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��</title>
    <meta name="description" content="51����������վ-�й�������ҵ���Ʒ�ơ����ܹ�ϵ���������¡�����ѵ����ȫ��λ֧������������ʮ����Ӫ��ǧ���Ա���������飬��51���ѿ�ʼ��" />
    <meta http-equiv=��Cache-Control�� content=��no-transform�� />
    <meta http-equiv=��Cache-Control�� content=��no-siteapp�� />
    <meta name="keywords" content="51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/lcmbase.js"></script>
    
    <script language="JavaScript">
        function validate(){
            if (checkspace(document.pt.username.value)){
                alert('����д�����û���!');
                document.pt.username.focus();
                return false;
            }
            if (checkspace(document.pt.password.value)){
                alert('����д��������!');
                document.pt.password.focus();
                return false;
            }
            if (checkspace(document.pt.imager.value)){
                alert('����д��֤��!');
                document.pt.imager.focus();
                return false;
            }
            return true;
        }

        function validatesj()
        {
            if (checkspace(document.sj.sjtel.value)){
                alert('����д�����ֻ����롣�ƶ�����ͨ�������ֻ�������ѻ�ȡУ����!');
                document.sj.sjtel.focus();
                return false;
            }

            var reg = /^1[3|4|5|7|8]\d{9}$/;
            if(!reg.test(document.sj.sjtel.value))
            {
                alert("�ֻ����벻��ȷ!");
                return false;
            }

            if (checkspace(document.sj.verycode.value)){
                alert('����д���Ķ�����֤��');
                document.sj.verycode.focus();
                return false;
            }

            return true;
        }

        function checkspace(checkstr) {
            var str = '';
            for(i = 0; i < checkstr.length; i++) {
                str = str + ' ';
            }
            return (str == checkstr);
        }

        function sendSms()
        {
            if (checkspace(document.sj.sjtel.value)){
                alert('����д�����ֻ����롣�ƶ�����ͨ�������ֻ�������ѻ�ȡУ����!');

                document.sj.sjtel.focus();
                return;
            }

            var reg = /^1[3|4|5|7|8]\d{9}$/;
            if(!reg.test(document.sj.sjtel.value))
            {
                alert("�ֻ����벻��ȷ!");
                return;
            }else{
                /*if(confirm('��ȷ������У������')){
                 document.csendsms.sjtel.value =  document.sj.sjtel.value;
                 document.csendsms.submit();

                 }*/
                document.csendsmsval.sjtel.value =  document.sj.sjtel.value;
                document.csendsmsval.submit();
            }
        }

        function callback(msg){
            if (msg="33"){
                document.csendsms.sjtel.value =  document.sj.sjtel.value;
                document.csendsms.submit();
            }
        }

        function selectTag(showContent,selfObj){
            // ������ǩ
            var tag = document.getElementsByName("loginTab");
            var taglength = tag.length;
            for(i=0; i<taglength; i++){
                tag[i].className = "";
            }
            selfObj.className = "current";
            // ��������
            for(var i=0; i<2; i++){
                j=document.getElementById("tagContent"+i);
                j.style.display = "none";
            }
            document.getElementById(showContent).style.display = "block";
        }
    </script>

</head>
<body>
<div class="login_bg"></div>
<div class="login_box">
    <div class="block01">
        <div class="tab">
            <%String mobile= SysCommonFunc.getStrParameter(request, "mobile");
                if (mobile==null || mobile.equals("")){
            %>
            <span name="loginTab" class="current" onMouseOver="selectTag('tagContent0',this)">��ͨ��¼</span>
            <span name="loginTab"  onMouseOver="selectTag('tagContent1',this)">���ŵ�¼</span>
            <%}else{%>
            <span name="loginTab"  onMouseOver="selectTag('tagContent0',this)">��ͨ��¼</span>
            <span name="loginTab"  class="current" onMouseOver="selectTag('tagContent1',this)">���ŵ�¼</span>
            <% }%>
        </div>
        <form name="pt" method="post" action="./checkuser.jsp" onSubmit="return validate();" target="cname">
            <input type="hidden" name="isauto" value="" />
            <input type="hidden" name="login" value="<%=login %>" />

            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:8px;" class="show" id="tagContent0">
                <tr>
                    <td width="200" align="right"><strong>�û�����</strong></td>
                    <td>
                        <input name="username" type="text" class="txt01" value=""  style="width:300px;" />
                    </td>
                </tr>
                <tr>
                    <td align="right"><strong>���룺</strong></td>
                    <td>
                        <input type="password" name="password"  class="txt01" style="width:300px;" />
                    </td>
                </tr>
                <tr>
                    <td align="right"><strong>��֤�룺</strong></td>
                    <td>
                        <input type="text" name="imager"  class="txt01" maxlength="4" style="width:80px; margin-right:15px;" />
                        <img src="images/imager.jsp" width="50" height="17" align="bottom">
                    </td>
                </tr>
                <tr>
                    <td align="right">&nbsp;</td>
                    <td><input name="" type="submit" class="btn" value="������¼" /></td>
                </tr>
                <tr>
                    <td align="right">&nbsp;</td>
                    <td>��<a title="51��������_332�����е�רҵ����ƽ̨" href="forget.htm" target="_blank">�һ�����</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a title="51��������_332�����е�רҵ����ƽ̨" href="./reg.htm" target="_blank">�û�ע��</a>��</td>
                </tr>
            </table>
        </form>


        <form name="sj" method="post" action="./checksjlogin.jsp" onSubmit="return validatesj();" target="cname">

            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:8px;" id="tagContent1">
                <tr>
                    <td width="200" align="right"><strong>�ֻ��ţ�</strong></td>
                    <td>
                        <input type="text" name="sjtel"  class="txt01"  style="width:300px;"  maxlength="11" value="<%=mobile %>" />
                    </td>
                </tr>
                <tr>
                    <td align="right">&nbsp;</td>
                    <td><span class="xym_btn"><a href="javascript:void(0);" onclick="sendSms();">��ѻ�ȡЧ����</a></span></td>
                </tr>
                <tr>
                    <td align="right"><strong>Ч���룺</strong></td>
                    <td>
                        <input type="text" name="verycode"  class="txt01" style="width:300px;"/>
                    </td>
                </tr>
                <tr>
                    <td align="right">&nbsp;</td>
                    <td><input name="" type="submit" class="btn" value="������¼" /></td>
                </tr>
                <tr>
                    <td align="right">&nbsp;</td>
                    <td>
                        <a title="51��������_332�����е�רҵ����ƽ̨" href="forget.htm" target="_blank">�һ�����</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a title="51��������_332�����е�רҵ����ƽ̨" href="./reg.htm" target="_blank">ע���»�Ա</a>
                    </td>
                </tr>
            </table>
        </form>

    </div>
    <div class="block02">
        <div class="erweima"><img src="images/weixin_erweima.jpg" alt="" width="120" height="120"/><br/>΢�Ź��ںţ��ƶ�վ��</div>
        <div class="erweima"><img src="images/kf_img.jpg" alt="" width="120"  /><br/>�ͷ��绰</div>
    </div>
</div>
</body>
</html>

<form name="csendsmsval" action="sendsmsloginval.jsp" method="post" target="cname">
    <input name="sp" value="<%=login%>" type="hidden"/>
    <input name="sjtel" value="" type="hidden"/>
</form>
<form name="csendsms" action="sendsmslogin.jsp" method="post" target="cname">
    <input name="sp" value="<%=login%>" type="hidden"/>
    <input name="sjtel" value="" type="hidden"/>
</form>
<iframe name="cname" id="cname" src="" height="0" width="0">
</iframe>
