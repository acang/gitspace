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
<div class="wrapper1250 cm_block01">
  
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
        <td>����ͨ�������鿴��Ա�������ϣ���Ȩ�鿴��Ա��ϸ��ϵ�취<br />
          �ﳤ��չʾ�Լ����ϡ�����֤��Ա��δ��֤��Ա�ֱ�����<br/>
          &nbsp;&nbsp;ʹ�����Ͽ������á���������/����������ѻظ�����<br/>
          &nbsp;&nbsp;�յ����ﲨ���ҿ���˭����̳������10��Ȩ��</td>
        <td align="center">����</td>
        <td width="200" align="center">���</td>
      </tr>
      <tr>
        <td align="center"><strong>�׽�VIP��Ա</strong></td>
        <td>����ͨ��Ա��ȫ��Ȩ�ޡ���ҳ�Ƽ������գ�<br/>
            ��ר��߼�������ʮ����������׼����ȫ����Ա<br/>
          ��鿴ȫ������֤��Ա��δ��֤��Ա����ϸ��ϵ�취<br />
          &nbsp;&nbsp;��ȫ����Ա�������ԡ����������������Լ�����ϵ�취</td>
        <td align="center">������<br />������<br />һ����</td>
        <td align="center">
        <span style=" text-decoration:line-through;">ԭ�ۣ�1580Ԫ</span>&nbsp;
        �Żݼۣ�1280Ԫ<br />
        <span style=" text-decoration:line-through;">ԭ�ۣ�1280Ԫ</span>&nbsp;
        �Żݼۣ�980Ԫ<br />
        <span style=" text-decoration:line-through;">ԭ�ۣ�880Ԫ</span>&nbsp;&nbsp;
        �Żݼۣ�580Ԫ</td>
      </tr>
      <tr>
        <td align="center"><strong>֧����ʽ</strong></td>
        <td colspan="3">
        
<div style="text-align:center; padding-top:20px;">
<a href="paymemory.jsp" target="_blank" class="zfbzf_btn">����֧��</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="payLast.jsp" target="_blank" class="zfbzf_btn">����֧��</a>
</div>

<br />
<strong>˵����</strong>����֧����ʹ������֧�����п�����,ͨ���й���������֧��ƽ̨ͬ����ͨ��<br />&nbsp;&nbsp;&nbsp;&nbsp;<strong>&nbsp;&nbsp;</strong>���м�֧����֧���������й�ũҵ���л�֧��������1���������ڿ�ͨ��</td>
      </tr>

        <%--<tr>--%>
            <%--<td align="center" bgcolor="#FFFFFF" class="style02"><strong>�������</strong></td>--%>
            <%--<td colspan="6" align="left" bgcolor="#FFFFFF" style="padding-left:10px;">--%>
                <%--1) �Ƽ���Աע�ᣬ����ѻ�ð׽𶹣����ڲ鿴��Ա��ϸ��ϵ�취�������������½���������ר��<a href="grzqbjd.jsp" target="_blank">��Ա�Ƽ�</a>��Ŀ��<br />--%>
                <%--2) ��̳����������õĽ�ҿɶһ���Ӧ�İ׽�VIP��ԱȨ�ޣ���һ�ü������취��鿴��Ա������Ŀ�е�<a href="http://www.51lover.org/bbs/disp_bbs-bbsid-33080.htm" target="_blank">51����������̳ʹ�ù���</a>��</td>--%>
        <%--</tr>--%>
        <tr>
            <td colspan="7" align="center" bgcolor="#FFFFFF" class="tit08">*ע:VIP��Ա�������Զ���Ϊ��ͨ��Ա��</td>
        </tr>
      <%--<tr>--%>
        <%--<td align="center"><strong>����ѵ��</strong></td>--%>
        <%--<td colspan="3"> 4����������ʽ��ϰ��   32��Сʱ    ԭ�ۣ�16800Ԫ �Żݼ�6800Ԫ</td>--%>
      <%--</tr>--%>
      <%--<tr>--%>
        <%--<td colspan="4" align="center"><input type="button" class="zfbzf_btn" value="��Ҫ����"></td>--%>
      <%--</tr>--%>
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
