<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
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
<body class="cm_hyzf">
<%@ include file="head.jsp"%>
<%
    Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);

    if(loginUser == null)
    {
        out.println("<script language='javascript'>alert('�����οͣ�����Ȩ�޲��������ȵ�¼����');showLogin('index.jsp','hyzf.jsp');</script>");
        return;
    }
%>
<div class="wrapper1250 cm_block01">
   <iframe id="visitFrame" name="visitFrame" width="0" height="0" frameborder="0" src="visitForGRZQ_type.jsp?url=http://www.51lover.org/hyzf.htm" ></iframe>
  <div class="block02">
      <div class="lm_name02">
      <h2>��Ա�ȼ����ʷ�</h2>
    </div>
        
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="hydjjzf">
	<thead>
      <tr>
        <th width="110">��Ա�ȼ�</th>
        <th>Ȩ��</th>
        <th width="80">����</th>
        <th>�۸�</th>
      </tr>
	  </thead>
      <tr>
        <td align="center"><strong>��ͨ��Ա</strong></td>
        <td><span style="line-height:23px;">����ͨ�������鿴��Ա�������ϣ���Ȩ�鿴��Ա��ϸ��ϵ�취</span><br />
         <span style="line-height:23px;"> �ﳤ��չʾ�Լ����ϡ�����֤��Ա��δ��֤��Ա�ֱ�����</span><br/>
          <span style="line-height:23px;">&nbsp;&nbsp;ʹ�����Ͽ������á���������/���������鿴����</span><br/>
          <span style="line-height:23px;">&nbsp;&nbsp;�յ����ﲨ���ҿ���˭����̳������10��Ȩ��</span></td>
        <td align="center">����</td>
        <td width="250" align="center">���</td>
      </tr>

       <tr>
        <td align="center"><strong>VIP��Ա</strong></td>
        <td><span style="line-height:23px;">����ͨ��Ա��ȫ��Ȩ�ޡ���ҳ�Ƽ������գ�<br/>
��ר��߼�������ʮ����������׼����ȫ����Ա<br/>
��鿴ȫ��δ��֤��Ա����ϸ��ϵ�취<br/>
��ȫ��δ��֤��Ա�������ԡ����������������Լ�����ϵ�취</span>
  </td>
        <td align="center"><span style="line-height:23px;">һ����<br />������</span></td>
        <td align="left">
        <span style=" text-decoration:line-through;line-height:23px;">ԭ�ۣ�580Ԫ</span><span style="line-height:23px;">&nbsp;&nbsp;&nbsp;
        �����ۣ�298Ԫ</span><br />
        <span style=" text-decoration:line-through;line-height:23px;">ԭ�ۣ�1280Ԫ</span><span style="line-height:23px;">&nbsp;&nbsp;
        �����ۣ�598Ԫ</span></td>
      </tr>
      <tr>
        <td align="center"><strong>�׽�VIP��Ա</strong></td>
        <td><span style="line-height:23px;">��VIP��Ա��ȫ��Ȩ��<br/>
              �����Ӳ鿴�ڲ���֤��Ա�����л�Ա����ϸ��ϵ�취<br/>
          &nbsp;&nbsp;��ȫ����Ա�������ԡ����������������Լ�����ϵ�취</span></td>
        <td align="center"><span style="line-height:23px;">һ����<br />������</span></td>
        <td align="left">
        <span style=" text-decoration:line-through;line-height:23px;">ԭ�ۣ�980Ԫ</span><span style="line-height:23px;">&nbsp;&nbsp;
        �����ۣ�498Ԫ<br /></span>
       
        <span style=" text-decoration:line-through;line-height:23px;">ԭ�ۣ�1980Ԫ</span><span style="line-height:23px;">&nbsp;&nbsp;
        �����ۣ�998Ԫ</span></td>
      </tr>
      
      <tr>
        <td align="center"><strong>����ѵ��</strong></td>
          <td align="left"> ��4������ʽ����������ϰ��</td>
          <td align="center">    32��Сʱ  </td>
        <td  align="left">
            <span style="text-decoration:line-through;">ԭ�ۣ�16800Ԫ</span><span style="line-height:23px;">&nbsp;&nbsp;�����ۣ�6800Ԫ</span>
             </td>
      </tr>
   <tr>
        <td align="center"><strong>�������</strong></td>
  <td align="center" colspan="3"> 
  <span style="line-height:23px;">ͨ��΢�ŷ������̳�����������VIP��Ա���׽�VIP��ԱȨ�ޣ���鿴��Ա����ʹ����֪��
</span>  </td>
      </tr>
      <tr>
      <td align="center" colspan="4"> 
       <a href="paymoney.jsp"><img src="images/buy.png"></a>
      </td>
      </tr>
    </table>  

  </div>
  <div class="block02t">
        <div class="lm_name">
          <h2>��ͨ��Ա����</h2>
        </div>
        <div class="erweima"><img src="images/weixin_erweima.jpg" alt="" width="120" height="120"/><br/>΢�Ź��ںţ��ƶ�վ��</div>
        <div class="erweima"><img src="images/kf_img.jpg" alt="" width="120"  /><br/>�ͷ��绰</div>
      <div style="clear:both"></div>
    </div>
  
  <div style="clear:both"></div>
</div>
<%@ include file="bottom.jsp"%>
</body>
</html>
