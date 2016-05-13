<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.lover.mng.UserVisitMng" %>
<%@ page import="java.util.List" %>
<%@ page import="hibernate.db.HbmOperator" %>
<%@ page import="com.web.obj.*" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<%@ page import="java.io.File" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>51交友中心-亲密交友 浪漫交友 同城交友 终生伴侣 情商训练 婚恋训练</title>
<meta name="description" content="51交友中心网站-中国交友行业领军品牌。亲密关系、终生伴侣、情商训练，全方位支持您的情感生活。十年运营，千万会员，美满感情，从51交友开始！" />
<meta http-equiv=”Cache-Control” content=”no-transform” />
<meta http-equiv=”Cache-Control” content=”no-siteapp” />
<meta name="keywords" content="51交友中心-亲密交友 浪漫交友 同城交友 终生伴侣 情商训练 婚恋训练" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/lcmbase.js"></script>
</head>
<body class="cm_grzx">
<%@ include file="head.jsp"%>
<%

    Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
    Userother uother = (Userother)session.getAttribute(SysDefine.SESSION_LOGINNAME_OTHER);
    if(loginUser == null)
    {
        out.println("<script language='javascript'>alert('您是游客，您的权限不够，请先登录或注册');showLogin();</script>");
        return;
    }else{
    	if(loginUser.getIsdel()!=null && loginUser.getIsdel()==2){
    		out.println("<script language='javascript'>alert('您还未通过审核，请保持电话申通');window.parent.location.href='grzq.jsp';</script>");
    	}
    	
        String vurl="";
        vurl=request.getRequestURL().toString();
        if (request.getQueryString()!=null){
            vurl+="?"+request.getQueryString();
        }
        UserVisitMng.insertUserVisit(loginUser.getHyid(), vurl);
    }
    List list = HbmOperator.list("from Hyset as o where o.hyid=" + loginUser.getHyid());
    Hyset hyset = null;
    if(list != null && list.size() > 0){
        hyset = (Hyset)list.get(0);
    } else{
        hyset = new Hyset();
    }

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
          <p class="zl"><a href="perinfo.jsp?id=<%=grwhqUser.getHyid()%>"><strong><%=grwhqUser.getLcname()%></strong></a></p>
          <div class="lm_name">
              <h2>个人操作专区</h2>
          </div>
          <%@ include file="grleft.jsp"%>
      </div>
    <div class="box02">
      <div class="lm_name">
        <h2>设置</h2>
      </div>
        <%
            int base = 0;
            int pic = 0;
            int tel = 0;
            int sjtel = 0;
            int qq= 0;
            int email = 0;
            int wx = 0;
            if(hyset.getHyid() != null)
            {
                if(hyset.getSetbase() != null)
                    base = hyset.getSetbase().intValue();
                if(hyset.getSetpic() != null)
                    pic = hyset.getSetpic().intValue();
                if(hyset.getSettel() != null)
                    tel = hyset.getSettel().intValue();
                if(hyset.getSetsjtel() != null)
                    sjtel = hyset.getSetsjtel().intValue();
                if(hyset.getSetqq() != null)
                    qq = hyset.getSetqq().intValue();
                if(hyset.getSetmail() != null)
                    email = hyset.getSetmail().intValue();

                if(hyset.getSetwx() !=null){
                    wx = hyset.getSetwx().intValue();
                }
            }
        %>

        <iframe name="sframe" width="0" height="0"  style="display:none"></iframe>
        <form name="personal" method="post" action="grkfset.jsp" target="sframe">

        <table width="100%" border="0" align="center" cellpadding="4" cellspacing="0" class="reg_tab02">
          <tbody>
            <tr>
              <td width="150" align="right" bgcolor="#D6E6F3" class="bk04"><strong>交友状态：</strong></td>
              <td bgcolor="#FFFFFF" class="bk04">
                  <select id="select6" name="setzt">
                  <option value="<%=SysDefine.SYSTEM_HYSET_HYZT_WAIT%>" <%if(loginUser.getSetzt() != null && loginUser.getSetzt().longValue() == SysDefine.SYSTEM_HYSET_HYZT_WAIT) out.print("selected");%>>等待中</option>
                  <option value="<%=SysDefine.SYSTEM_HYSET_HYZT_NOT_WAIT%>" <%if(loginUser.getSetzt() != null && loginUser.getSetzt().longValue() == SysDefine.SYSTEM_HYSET_HYZT_NOT_WAIT) out.print("selected");%>>暂勿打扰</option>
              </select></td>
            </tr>
            <tr>
              <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>固定电话设定：</strong></td>
              <td bgcolor="#FFFFFF" class="bk04"><select id="select1" name="settel">
                  <option value="<%=SysDefine.SYSTEM_HYSET_OPEN_VIP%>" <%if(tel==SysDefine.SYSTEM_HYSET_OPEN_VIP) out.print("selected");%>>向vip会员开放</option>
                  <option value="<%=SysDefine.SYSTEM_HYSET_OPEN_FRIEND%>" <%if(tel==SysDefine.SYSTEM_HYSET_OPEN_FRIEND) out.print("selected");%>>向好友开放(VIP)</option>
              </select></td>
            </tr>
            <tr>
              <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>手机设定：</strong></td>
              <td bgcolor="#FFFFFF" class="bk04"><select id="select2" name="setsjtel">
                  <option value="<%=SysDefine.SYSTEM_HYSET_OPEN_VIP%>" <%if(sjtel==SysDefine.SYSTEM_HYSET_OPEN_VIP) out.print("selected");%>>向vip会员开放</option>
                  <option value="<%=SysDefine.SYSTEM_HYSET_OPEN_FRIEND%>" <%if(sjtel==SysDefine.SYSTEM_HYSET_OPEN_FRIEND) out.print("selected");%>>向好友开放(VIP)</option>
              </select></td>
            </tr>
            <tr>
              <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>QQ设定：</strong></td>
              <td bgcolor="#FFFFFF" class="bk04"><select id="select3" name="setqq">
                  <option value="<%=SysDefine.SYSTEM_HYSET_OPEN_VIP%>" <%if(qq==SysDefine.SYSTEM_HYSET_OPEN_VIP) out.print("selected");%>>向vip会员开放</option>
                  <option value="<%=SysDefine.SYSTEM_HYSET_OPEN_FRIEND%>" <%if(qq==SysDefine.SYSTEM_HYSET_OPEN_FRIEND) out.print("selected");%>>向好友开放(VIP)</option>
              </select></td>
            </tr>
            <tr>
              <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>E-mail设定：</strong></td>
              <td bgcolor="#FFFFFF" class="bk04">
                  <select id="select4" name="setmail">
                  <option value="<%=SysDefine.SYSTEM_HYSET_OPEN_VIP%>" <%if(email==SysDefine.SYSTEM_HYSET_OPEN_VIP) out.print("selected");%>>向vip会员开放</option>
                  <option value="<%=SysDefine.SYSTEM_HYSET_OPEN_FRIEND%>" <%if(email==SysDefine.SYSTEM_HYSET_OPEN_FRIEND) out.print("selected");%>>向好友开放(VIP)</option>
              </select></td>
            </tr>
            <tr>
                <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>微信设定：</strong></td>
                <td bgcolor="#FFFFFF" class="bk04">
                    <select id="select5" name="setwx">
                    <option value="<%=SysDefine.SYSTEM_HYSET_OPEN_VIP%>" <%if(wx==SysDefine.SYSTEM_HYSET_OPEN_VIP) out.print("selected");%>>向vip会员开放</option>
                    <option value="<%=SysDefine.SYSTEM_HYSET_OPEN_FRIEND%>" <%if(wx==SysDefine.SYSTEM_HYSET_OPEN_FRIEND) out.print("selected");%>>向好友开放(VIP)</option>
                </select></td>
            </tr>

            <%
                int receiveyesno = 0;
                int receivetype = 0;
                List listreceive = HbmOperator.list("from UserReceiveSet as o where o.hyid="+loginUser.getHyid());
                UserReceiveSet userReceiveSet = null;
                if(listreceive != null && listreceive.size() > 0)
                    userReceiveSet = (UserReceiveSet)listreceive.get(0);
                if (userReceiveSet!=null){
                    if (userReceiveSet.getReceiveyesno()!=null){
                        receiveyesno=userReceiveSet.getReceiveyesno().intValue();
                    }
                    if (userReceiveSet.getReceivetype()!=null){
                        receivetype=userReceiveSet.getReceivetype().intValue();
                    }
                }
            %>
            <input id="receiveyesno" name="receiveyesno" type="hidden" value="0">
            <%--<tr>--%>
              <%--<td align="right" bgcolor="#D6E6F3" class="bk04"><strong>网站信息接收：</strong></td>--%>
              <%--<td bgcolor="#FFFFFF" class="bk04"><select id="receiveyesno" name="receiveyesno">--%>
                  <%--<option value="0" <%if(receiveyesno == 0) out.print("selected");%>>接收</option>--%>
                  <%--<option value="1" <%if(receiveyesno == 1) out.print("selected");%>>不接收</option>--%>
              <%--</select></td>--%>
            <%--</tr>--%>

          </tbody>
        </table>
        <div class="MyBtn"><input name="bsendsms" type="submit" id="bsendsms" onclick="javascript:test();" value="  确 认 修 改  " class="btn"></div>
      </form>
    </div>
    <div style="clear:both"></div>
  </div>
  <div class="block02">
    <div class="box02">
      <div class="lm_name">
        <h2>扫描二维码</h2>
      </div>
      <div class="erweima"><img src="images/weixin_erweima.jpg" alt="" width="120" height="120"/><br/>微信公众号（移动站）</div>
      <div class="erweima"><img src="images/kf_img.jpg" alt="" width="120"  /><br/>客服电话</div>
    </div>
  </div>
  <div style="clear:both"></div>
</div>
<%@ include file="bottom.jsp"%>
</body>
</html>
