<%@ page contentType="text/html; charset=GBK" language="java" errorPage="" %>
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
</head>
<body class="cm_grzx">
<%@ include file="head.jsp"%>
<%
    String afilepath = SysCommonFunc.getPhotoView();
    String afilepathsmall = SysCommonFunc.getPhotoSmallView();
    Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
    Userother uother = (Userother)session.getAttribute(SysDefine.SESSION_LOGINNAME_OTHER);

%>
<div class="wrapper1250 cm_block01">
  <div class="block01">
      <div class="box01"> <span class="tx"><img src="../<%=afilepathsmall+File.separator+uother.getUserphoto1()%>" alt=""/></span>
          <p class="zl"><strong><%=grwhqUser.getLcname()%></strong></p>
          <div class="lm_name">
              <h2>���˲���ר��</h2>
          </div>
          <%@ include file="grleft.jsp"%>
      </div>
    <div class="box02">
      <div class="lm_name">
        <h2>����������</h2>
      </div>
      <div style="clear:both"></div>
      <div class="tab"><span class="current">��������</span><!--<span>����������������</span>��ʱȡ��--><span>�ܽ�Ҳ�ѯ</span></div>
      <div class="mingdan show">
      <div style="line-height:30px; font-size:14px; padding:10px 0;">
      <p>����Ѱ�ҵ���������Ի�飿Ѱ��һ���İ��� �������ʶ��Ŀ�е���������51����������վһ���ܰ�������</p>
      <p> 51����������վ����10��Ļ���,���ѷ�չ��Ϊӵ����700������Ա���վ�����ע���Ա5000�����վ��������20���˴ε��й�AAA������רҵ������վ�������������԰���16�������������ҵ�����Ȥ�����԰��¡����Ľ���Ŀ�ļȿ����Ƕ��ڵ�Eҹ�飬 Ҳ�����ǳ��ڵĻ�����ϵ,�ȿ�������ʵ�������ˣ�Ҳ�����Ƕ��������Ů��...... ����������κ����붼������ʵʵ�֣�</p>
      <p> ���Ƿ񾭳���QQ���������������죿��������������������ѵ���ϸ���ϣ�Ҳ���˽�Է�������Ŀ�ģ����������Ҳʹ���������ġ������������������ 
        ���Ƿ�Ҳȥ���������������ҲΪ�Ƕ��Ļ����١�Ч�ʵ͡����е���������չ���</p>
      <p> ����51����������վ������һ�ж����ˣ�ָ���ᶯ��һ������ѡ�˱��չ����ǰ������������������51����������վ�ﶼ�ܹ��ҵ��������һ�롣</p>
      <p> ����51����������վ�������ҵ���������԰��£��Ӵ���Ҳ����į�ˣ��� </p>
</div>
      </div>
      <div class="mingdan">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td style="width:100px;background-color:#f7f7f7" align="center"><strong>���</strong></td>
          <td align="center" style=" background-color:#f7f7f7"><strong>�ȼ�</strong></td>
          <td align="center" style=" background-color:#f7f7f7"><strong>��̳������</strong></td>
          <td align="center" style=" background-color:#f7f7f7"><strong>��̳����</strong></td>
          <td align="center" style=" background-color:#f7f7f7"><strong>ɾ������</strong></td>
          <td align="center" style=" background-color:#f7f7f7"><strong>�����</strong></td>
        </tr>
        <tr>
          <td align="center">1258</td>
          <td align="center">������</td>
          <td align="center"><a href="2_11.asp">20</a></td>
          <td align="center"><a href="2_12.asp">10</a></td>
          <td align="center"><a href="2_13.asp">0</a></td>
          <td align="center">15</td>
        </tr>
      </table>
      </div>
      <div class="mingdan">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td style=" background-color:#f7f7f7"><strong>���</strong></td>
          <td style=" background-color:#f7f7f7"><strong>�ǳ�</strong></td>
          <td style=" background-color:#f7f7f7"><strong>����</strong></td>
        </tr>
        <tr>
          <td>12589456</td>
          <td>dongbo</td>
          <td>ͨ��</td>
        </tr>
        <tr>
          <td>12589456</td>
          <td>dongbo</td>
          <td>ͨ��</td>
        </tr>
        <tr>
          <td>12589456</td>
          <td>dongbo</td>
          <td>ͨ��</td>
        </tr>
        <tr>
          <td>12589456</td>
          <td>dongbo</td>
          <td>ͨ��</td>
        </tr>
      </table>
      </div>
      <div style="clear:both"></div>
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
</html>
