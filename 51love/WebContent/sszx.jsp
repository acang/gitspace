<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.web.obj.extend.DicList" %>
<%
Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
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
    <script src="js/tom_reg2.js"></script>
</head>
<body class="cm_search_gj">
<%@ include file="head.jsp"%>

<div class="wrapper1250 cm_block01">
  <div class="block01">
    
    <div class="box04">
    <div class="lm_name"><h2>�߼�����</h2></div>
    <form  name="personal" method="post" action="searchjg02.jsp"  target="_blank">
    <div>
        <input type="hidden" name="" value="">
      </div>
      <input type="hidden" name="status" value="searchMoreUsers">
       <table border="0" cellpadding="0" cellspacing="0" class="seach_tab" style="margin-top:30px;margin-left:180px">
          <tr>
        	<td style="width:140px;"><div align="right">�Ա�</div></td>
            <td style="width:140px;"> <select name="sex" size="1" class="border" id="select4">
                <option selected value="0">����</option>
                <%=DicList.getDicListOption(SysDefine.DIC_SEX, "-1")%>
            </select></td>
            <td style="width:100px;"><div align="right">��ס��ַ��</div></td>
            <td>
                <select name="s1" id="s1" onChange="SetCity(this,document.personal.s2)">
                   <option value=""
                        selected>��ѡ��</option><option value=����
                    >����</option> <option value=���>���</option> <option
                    value=�ӱ�>�ӱ�</option> <option value=ɽ��>ɽ��</option> <option
                    value=���ɹ�>���ɹ�</option> <option value=����>����</option> <option
                    value=����>����</option> <option value=������>������</option> <option
                    value=�Ϻ�>�Ϻ�</option> <option value=����>����</option> <option
                    value=�㽭>�㽭</option> <option value=����>����</option> <option
                    value=����>����</option> <option value=����>����</option> <option
                    value=ɽ��>ɽ��</option> <option value=����>����</option> <option
                    value=����>����</option> <option value=����>����</option> <option
                    value=�㶫>�㶫</option> <option value=����>����</option> <option
                    value=����>����</option> <option value=����>����</option> <option
                    value=�Ĵ�>�Ĵ�</option> <option value=����>����</option> <option
                    value=����>����</option> <option value=����>����</option> <option
                    value=����>����</option> <option value=����>����</option> <option
                    value=�ຣ>�ຣ</option> <option value=����>����</option> <option
                    value=�½�>�½�</option>
                     <option value=���>���</option>
                     <option value=����>����</option>
                     <option value=̨��>̨��</option>
                    <option value=����>����</option>
            </select>

                <select name="s2" id="s2">
                    <option value="">��ѡ��</option>
                </select>
            </td>
          </tr>
          <tr>
            <td><div align="right">��������</div></td>
            <td>
                <select name="jyyx" style="width:100px" class="cg_select">
                	<option value="">����</option>
                    <%=DicList.getDicListOption(SysDefine.DIC_JYYX,"-1")%>
                </select>
            </td>
            <td><div align="right">ѧ����</div></td>
            <td>  <select name="whcd" size="1" class="border" id="whcd">
                <option selected value="0">����</option>
                <%=DicList.getDicListOption(SysDefine.DIC_WHCD,"-1")%>
            </select></td>
          </tr>
          <tr>
            <td><div align="right">���䣺</div></td>
            <td>  <select name="agestart" size="1" class="border" id="agestart">
                <%
                    for(int i=16;i < 71;i ++)
                    {
                %>
                <option  value="<%=i%>" <%if(i==16) out.print("selected");%>><%=i%></option>
                <%
                    }
                %>
            </select>
                ��
                <select name="ageend" size="1" class="border" id="ageend">
                    <%
                        for(int i=16;i < 71;i ++)
                        {
                    %>
                    <option  value="<%=i%>" <%if(i==70) out.print("selected");%>><%=i%></option>
                    <%
                        }
                    %>
                </select>
              ��</td>
            <td><div align="right">ְҵ��</div></td>
            <td><select name="zy" size="1" class="border" id="zy">
                <option selected="selected" value="0">����</option>
                <%=DicList.getDicListOption(SysDefine.DIC_ZY,"-1")%>
            </select></td>
          </tr>
          <tr>
          	<td><div align="right">������Ƭ��</div></td>
            <td>  <select name="himg" id="himg">
                    <option selected="selected" value="0">����</option>
                    <option value="1">��</option>
                    <option value="2">��</option>
                </select></td>
            <td><div align="right">�����룺</div></td>
            <td><select name="user_income" style="width:100px" class="cg_select">
                <option value="">����</option>
                <option value="10">2��Ԫ����</option>
                <option value="11">2-5��Ԫ</option>
                <option value="12">5-10��Ԫ</option>
                <option value="13">10-100��Ԫ</option>
                <option value="14">100��Ԫ����</option>
              </select></td>
          </tr>
          <tr>
          <td><div align="right">���</div></td>
            <td><select name="hyzk" size="1" class="border" id="select8">
                <option selected value="0">����</option>
                <%=DicList.getDicListOption(SysDefine.DIC_HYZH,"-1")%>
            </select>
            </td>
            <td><div align="right">����ס����</div></td>
            <td>  <select name="zf" size="1" class="border" id="select5">
                <option selected value="0">����</option>
                <%=DicList.getDicListOption(SysDefine.DIC_ZF,"-1")%>
            </select></td>
          </tr>
          <tr>


              <td><div align="right">��ߣ�</div></td>
              <td>  <select name="sg" size="1" class="border" id="sg">
                  <option selected value="0">����</option>
                  <%=DicList.getDicListOption(SysDefine.DIC_SG,"-1")%>
              </select>
              </td>
              <td><div align="right">Ѫ�ͣ�</div></td>
              <td>  <select name="sx" id="sx">
                  <option selected value="0">����</option>
                  <%=DicList.getDicListOption(SysDefine.DIC_XX,"-1")%>
              </select>
              </td>
          </tr>
          <tr>


              <td><div align="right">���أ�</div></td>
              <td> <select name="tz" size="1" class="border" id="select7">
                  <option selected value="0">����</option>
                  <%=DicList.getDicListOption(SysDefine.DIC_TZ,"-1")%>
              </select></td>
              <td><div align="right">������</div></td>
              <td> <select name="xz" id="xz">
                  <option selected value="0">����</option>
                  <%=DicList.getDicListOption(SysDefine.DIC_XZ,"-1")%>
              </select></td>
          </tr>
          <tr>

            <td><div align="right">��ɫ��</div></td>
            <td> <select name="fs" size="1" class="border" id="fs">
                <option selected value="0">����</option>
                <%=DicList.getDicListOption(SysDefine.DIC_FS,"-1")%>
            </select></td>
              <td><div align="right">��֤��</div></td>
              <td>
              <select name="isvcation" size="1" class="border" id="isvcation">
	              <option selected value="">����</option>
	              <option value="1">����֤</option>
	        	  <option value="0">δ��֤</option>
	       	  </select>
              </td>
          </tr>
      </table>
         <input type="hidden" value="1" name="isvcation">

      <div class="MyBtn" style="clear:both; text-align:left; padding-left:380px;">
      	<input type="button" onclick="tijiaoSerach()" class="btn" value="�ѡ�����" style="width:200px; height:35px; line-height:35px;" />
      </div>
    </form>
      
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
<script type="text/javascript">
    function tijiaoSerach(){
        <%
             if(loginUser == null)
          {
              out.println("alert('�����οͣ����ȵ�¼��ע�ᣡ');showLogin('sszx.jsp','grzq.htm');");
           }else if(loginUser != null && flag == SysDefine.SYSTEM_HY_TYPE_NOR){
           %>
             alert('������ͨ��Ա���������׽�VIP��Ա��');
             window.location.href = "hyzf.htm";
         <%  }else{
        %>
        if(document.getElementById("s1").value==""){
            alert("��ѡ��һ������!");
            return;
        }
        document.personal.submit();
        <%
        }
        %>
    }
</script>
</body>
</html>
