<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<%@ page import="hibernate.db.HbmOperator" %>
<%@ page import="com.web.bean.QueryResult" %>
<%@ page import="com.web.bean.QueryRecord" %>
<%@ page import="com.lover.mng.UserVisitMng" %>
<%@ page import="com.lover.mng.HYRegMng" %>
<%@ page import="com.web.common.DateTools" %>
<%@ page import="com.web.obj.extend.DicList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.web.obj.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.lover.LoverTools" %>
<%@ page import="org.apache.commons.beanutils.DynaBean" %>
<%@ page import="com.lover.mng.UserInfoSendReplyMng" %>
<%@ page import="java.util.Date" %>
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
    <script>
        function selectTagPer(showContent,selfObj){
            // 操作标签
            var tag = document.getElementById("personTab").getElementsByTagName("h2");
            for(var i=0; i<4; i++){
                tag[i].className = "";
            }
            selfObj.className = "current";
            // 操作内容
            for(var i=0; i<5; i++){
                j=document.getElementById("pertagContent"+i);
                j.style.display = "none";
            }

            document.getElementById(showContent).style.display = "block";
            viewLargePic("1");
        }


        function changeClass(a){
            if(a.className!="current"){
                a.className = "current";
            }
        }
        function recoverClass(a){
            if(a.className =="current"){
                a.className = "";
            }
            for(var i=0; i<4; i++){
                var j=document.getElementById("pertagContent"+i);
                if(j.style.display == "block"){
                    var tag = document.getElementById("personTab").getElementsByTagName("h2");
                    tag[i].className = "current";
                }

            }
        }

    </script>
</head>
<body class="cm_grxx">
<%@ include file="head.jsp"%>
<%
    String userid = SysCommonFunc.getStrParameter(request,"id");
    String articleid = SysCommonFunc.getStrParameter(request,"articleid");
    Userarticle uarticle = GRZQMng.getUserArticle(userid.toString(),articleid);
    System.out.println("uarticle =>>>>>>>>> " + uarticle);
    Bcb b = null;
     String con = "";
     List list2 = null;
     if(uarticle != null)
    {
       String hsql = "from Bcb as o where o.id="+uarticle.getContentid();
	     list2 = HbmOperator.list(hsql);
	    b = list2 == null || list2.size()==0 ? null : (Bcb)list2.get(0);
	   
	    if(b != null)
	    {
	        con = SysCommonFunc.getStringFromBlob(b.getContent());
	    }
    }
   

   %>


<div class="wrapper1250 cm_block01">
<div class="block01">
<div class="box01">
    <div class="lm_name" id="personTab">
        <h2  class="current"  onClick="selectTagPer('pertagContent0',this)" onmouseover="changeClass(this)" onmouseout="recoverClass(this)"><a style="cursor:hand">基本资料</a></h2>
        <h2 onClick="selectTagPer('pertagContent1',this)" onmouseover="changeClass(this)" onmouseout="recoverClass(this)"><a style="cursor:hand">影　集 ()</a></h2>
        <h2 id="wjtab" onClick="selectTagPer('pertagContent4',this)" onmouseover="changeClass(this)" onmouseout="recoverClass(this)"><a style="cursor:hand">文　集 ()</a></h2>

        <h2 onClick="javascript:alert('您是普通会员，请升级为白金VIP会员！');window.open('hyzf.htm')" onmouseover="changeClass(this)" onmouseout="recoverClass(this)"><a style="cursor:hand">联系方式</a></h2>

    </div>
</div>


<!--文集内容-->
<div class="box03" id="pertagContent2" style="display:none">
    <div class="tit02">
        <h1><%=loginUser.getLcname()%></h1>的文集
    </div>
    <div class="TextShow">
        <h1 style="height:30px; line-height:20px; text-align:center; font-size:18px; font-family:'微软雅黑'; border-bottom:#CCC 1px dashed"><%=uarticle.getTitle()%></h1>
        <p style="padding:10px 40px; font-size:14px; line-height:30px;"> <%=con%>  </p>

    </div>

    <div style="clear:both;"></div>
</div>
<!--联系方式-->
<div class="box03" id="pertagContent3" style="display:none">
    <div class="tit02">
        <h1><%=hyInfo.getLcname()%></h1>的联系方式</div>
    <%
        boolean isHy = false;
        if(loginUser!=null){
            isHy = GRZQMng.isHy(hyInfo,SysDefine.SYSTEM_HYGL_FRIEND,loginUser);
        }
        //  boolean isHy = GRZQMng.isHy(hyInfo,SysDefine.SYSTEM_HYGL_FRIEND,loginUser);
        Hyset hyset = GRZQMng.getHyset(hyInfo);
        if(hyset == null)
        {
            hyset = new Hyset();
            hyset.setSetbase(new Integer(SysDefine.SYSTEM_HYSET_OPEN_ALL));
            hyset.setSetpic(new Integer(SysDefine.SYSTEM_HYSET_OPEN_ALL));
            hyset.setSettel(new Integer(SysDefine.SYSTEM_HYSET_OPEN_VIP));
            hyset.setSetsjtel(new Integer(SysDefine.SYSTEM_HYSET_OPEN_VIP));
            hyset.setSetqq(new Integer(SysDefine.SYSTEM_HYSET_OPEN_VIP));
            hyset.setSetmail(new Integer(SysDefine.SYSTEM_HYSET_OPEN_VIP));
            hyset.setHyid(hyInfo.getHyid());
            try
            {
                HbmOperator.insert(hyset);
            }catch(Exception e)
            {
                System.out.println(e.getMessage());
            }
        }
        String tel = hyInfo.getTel() == null ? "":hyInfo.getTel();
        if(hyset.getSettel() != null && hyset.getSettel().intValue() == SysDefine.SYSTEM_HYSET_OPEN_FRIEND && !isHy)
            tel = "仅向好友，请赶快联系我吧！";
        String oicq = hyInfo.getOicq() == null ? "":hyInfo.getOicq();
        if(hyset.getSettel() != null && hyset.getSetqq().intValue() == SysDefine.SYSTEM_HYSET_OPEN_FRIEND && !isHy)
            oicq = "仅向好友，请赶快联系我吧！";
        String sjtel = hyInfo.getSjtel() == null ? "":hyInfo.getSjtel();
        if(hyset.getSetsjtel() != null && hyset.getSetsjtel().intValue() == SysDefine.SYSTEM_HYSET_OPEN_FRIEND && !isHy)
            sjtel = "仅向好友，请赶快联系我吧！";
        String email = hyInfo.getEmail() == null ? "":hyInfo.getEmail();
        if(hyset.getSetmail() != null && hyset.getSetmail().intValue() == SysDefine.SYSTEM_HYSET_OPEN_FRIEND && !isHy)
            email = "仅向好友，请赶快联系我吧！";
    %>
    <table width="533" border="0" cellspacing="0" cellpadding="0" style="display:block; margin:auto; margin-top:20px;border:#666666 1px solid;">
        <tr>
            <td style="width:150px; border:#CCC 1px solid;border-bottom:0; background-color:#f7f7f7" align="right"><strong>留言：</strong></td>
            <td style=" border:#CCC 1px solid; text-align:center;border-left:0; border-bottom:0">
                <input type="button" class="BlueBtn" value=" 留 言 "  onClick="MM_openBrWindow1('hyly.jsp?id=<%=hyInfo.getHyid()%>&lcname=<%=hyInfo.getLcname()%>','lianxi','width=617,height=350,scrollbars=yes')"/>
            </td>
        </tr>
        <tr>
            <td style="border:#CCC 1px solid; border-bottom:0; background-color:#f7f7f7" align="right"><strong>手机：</strong></td>
            <td style="font-size:18px;border:#CCC 1px solid; text-align:center;border-left:0; border-bottom:0"><%=sjtel%><span style="color:#F00">（已验证）</span></td>
        </tr>
        <tr>
            <td style="border:#CCC 1px solid; border-bottom:0; background-color:#f7f7f7" align="right"><strong>固定电话：</strong></td>
            <td style="font-size:18px;border:#CCC 1px solid; text-align:center;border-left:0; border-bottom:0"><%=tel%></td>
        </tr>
        <tr>
            <td style="border:#CCC 1px solid; background-color:#f7f7f7" align="right"><strong>E-mail：</strong></td>
            <td style="font-size:18px;border:#CCC 1px solid; text-align:center;border-left:0;"><%=email%></td>
        </tr>
    </table>
    <div style="clear:both"></div>
</div>

<!--文集-->
<div class="box03" id="pertagContent4" style="display:none">
    <div class="tit02">
        <h1><%=hyInfo.getLcname()%></h1>的文集
    </div>
    <ul class="wj">
        <%
            for( int i=0 ;i <  alist.size(); i ++)
            {
                DynaBean db = (DynaBean)alist.get(i);
                String wtype = (String)db.get("wtype");
                wtype = wtype.trim();
                String aid   = db.get("id").toString();
                String wtitle = (String)db.get("title");
                String contentid = db.get("contentid")+"";
                String sLink = "veiwnews.jsp?id="+hyInfo.getHyid() +"&articleid="+aid +"&wjfy=1";
                if(wtype.equals("2"))
                    sLink="disp_bbs-bbsid-"+aid+".htm";
        %>
        <li><%=wtype.equals("1") ? "[个人文集]":"[论坛发帖]" %><a href="<%=sLink%>" target="_self"><%=wtitle%></a></li>
        <%
            }
        %>
        <%
            if(alist.size() ==0)
            {
                for(int i =0;i < 10;i ++)
                {

        %>
        <li><a>暂无此文</a></li>
        <%
                }
            }
        %>
    </ul>
    <div class="Paging">
        <%
            if(cpage == 1)
                out.println("<a href='###'>首    页</a>&nbsp;&nbsp;<a href='###'>上一页</a>&nbsp;&nbsp; ");
            else
            {
                out.println("<a href='javascript:turn(1)'>首    页</a>&nbsp;&nbsp;");
                out.println("<a href='javascript:turn("+prepage+")'>上一页</a>&nbsp;&nbsp;");
            }
            for(int i=0;i<totalPage;i++){
                if((i+1)==cpage){
                    out.println("<a href='javascript:turn("+(i+1)+")' class='Check'>"+(i+1)+"</a>");
                }else{
                    out.println("<a href='javascript:turn("+(i+1)+")'>"+(i+1)+"</a>");
                }
            }

            if(cpage >= totalPage )
                out.println("<a href='###'>下一页</a>&nbsp;&nbsp;<a href='###'>尾页</a>&nbsp;&nbsp; ");
            else
            {
                out.println("<a href='javascript:turn("+nextpage+")'>下一页</a>&nbsp;&nbsp;");
                out.println("<a href='javascript:turn("+totalPage+")'>尾页</a>&nbsp;&nbsp;");
            }
        %>
    </div>
</div>
    <div style="clear:both;"></div>

</div>

<div class="block02">
    <div class="box02">
        <div class="lm_name">
            <h2>相仿异性</h2>
        </div>
        <%@ include file="xfyx.jsp" %>
        <div style="clear:both"></div>
    </div>
</div>
<div style="clear:both"></div>
</div>
<iframe id="perinfoframe" name="perinfoframe" frameborder="0"></iframe>
<%@ include file="bottom.jsp"%>
<form id="pageform" action="perinfo.jsp" target="_self">
    <input name="cpages" type="hidden" value="1">
    <input name="id"  type="hidden" value="<%=userid%>">
    <input name="wjfy" type="hidden"  value="1">
</form>
<script type="text/javascript">
    function viewLargePic(a){
        document.getElementById("largeShow").src ="images/nopic2.gif";
        if(document.getElementById("lager"+a)!=null){
            document.getElementById("largeShow").src="../"+document.getElementById("lager"+a).value;
        }
        if(document.getElementById("largeShow").width>=560){
            document.getElementById("largeShow").width = 560;
        }
    }
    viewLargePic("1");

    function turn(a){
        pageform.cpages.value=a;
        pageform.submit();
    }

    <%
        if("1".equals(wjfy)){
    %>
    var tag = document.getElementById("personTab").getElementsByTagName("h2");
    for(var i=0; i<4; i++){
        tag[i].className = "";
    }
    tag[2].className = "current";
    for(var i=0; i<5; i++){
        j=document.getElementById("pertagContent"+i);
        j.style.display = "none";
    }
    document.getElementById("pertagContent2").style.display = "block";
    <%
      }
    %>


</script>
</body>
</html>
