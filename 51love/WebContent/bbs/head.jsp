<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.common.SysDefine" %>
<%@ page import="com.web.obj.Userinfo" %>
<%@ page import="com.web.obj.Wtjd" %>
<%@ page import="com.web.obj.extend.DicList" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<%@ page import="com.lover.mng.WTJDMng" %>
<style>
    html,body{ height:100%; margin:0; padding:0}
.mask{height:100%; width:100%; position:fixed; _position:absolute; top:0; z-index:99; }
.opacity{ opacity:0.3; filter: alpha(opacity=30); background-color:#000; }
.logincontent{height:100%; width:100%; position:fixed; _position:absolute; top:0; z-index:100; }


    .divlogin_bg { z-index:98; position:fixed; top:0px; left:0; width:100%; height:100%; background:#999;
        opacity:0.7;  filter:alpha(opacity=70);  display:none;}
    .divlogin_box {z-index:99;position:fixed; top:50%; left:50%; margin-top:-200px; width:550px; height:380px;background:#fff; display:none;}
    .divlogin_box .lm_name {width:100%; height:30px; border-bottom:1px solid #ccc; background:#f5f5f5;}
    .divlogin_box .lm_name h2 { font: bold 20px/50px "΢���ź�"; text-indent:20px;}
    .divlogin_box .block01 { width:550px; height:380px; float:left}
    .divlogin_box .block01 .tab { height:40px; border-bottom:1px solid #ddd; margin-top:20px; text-align:center}
    .divlogin_box .block01 .tab span { display:inline-block;padding:0 25px; height:40px; font:16px/40px "΢���ź�"; color:#333; cursor:pointer;}
    .divlogin_box .block01 .tab span.current { background:#21648f; color:#fff;}
    .divlogin_box .block01 table { display:none;}
    .divlogin_box .block01 table.show { display:block;}
    .divlogin_box .block01 table td { height:50px; font-size:14px;}
    .divlogin_box .block01 table td .txt01 { width:230px; height:30px; line-height:30px; font-size:14px}
    .divlogin_box .block01 table td .btn { width:230px; height:40px; background:#21648f; border-radius:5px; border:none; text-align:center; font:16px/40px "΢���ź�"; color:#fff; cursor:pointer;}
    .divlogin_box .block01 table td .btn:hover { background:#2d719c;}
    .divlogin_box .block01 table td .xym_btn { display:inline-block; height:30px; border:1px solid #ddd; background:#f5f5f5; font:14px/30px "����"; padding:0 15px; cursor:pointer;}
    .divlogin_box .close_btn { position:absolute; top:0px; right:0px; width:50px; height:30px; font:18px/30px Arial, Helvetica, sans-serif; text-align:center; color:#999; cursor:pointer;}
.topbar .tels { float:right; width:215px; height:25px;  }
</style>


    <%
         //�ж��û�����
        Userinfo grwhqUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
        int flag = 0;
        if(grwhqUser != null && grwhqUser.getFlag() != null && grwhqUser.getFlag().intValue() == SysDefine.SYSTEM_HY_TYPE_vip)
            flag = SysDefine.SYSTEM_HY_TYPE_vip;
            //vip��Ա
        else if (grwhqUser != null && grwhqUser.getFlag() != null && grwhqUser.getFlag().intValue() == SysDefine.SYSTEM_HY_TYPE_nvip)
            flag = SysDefine.SYSTEM_HY_TYPE_nvip;
        else if(grwhqUser != null)
            flag = SysDefine.SYSTEM_HY_TYPE_NOR;

        String memberGrade = "";
        if(flag == SysDefine.SYSTEM_HY_TYPE_NOR)
        {
            memberGrade = "��ͨ��Ա";
        }
        if(flag == SysDefine.SYSTEM_HY_TYPE_vip)
        {
            memberGrade = "�׽�VIP";
        }
        String login2 = System.currentTimeMillis()+"";
        session.setAttribute("login",login2);
        session.setAttribute("sp",login2);
    %>
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?9f77dbe500dc55538bd80add7b45eac4";
  var s = document.getElementsByTagName("script")[0];
  s.parentNode.insertBefore(hm, s);
})();
</script>
 
<div class="topbar_bg">
    <div class="wrapper1250 topbar"><a
            href=#
            onClick="this.style.behavior='url(#default#homepage)';
this.setHomePage(document.location.host);event.returnValue=false;"
    class="baise">��Ϊ��ҳ</a> | <a
            href="Javascript:window.external.addFavorite(document.location.href,document.title)"
            class="baise">�����ղ�</a> |
         <%
            if(grwhqUser==null){
         %>

        <a href="../reg.jsp" class="huangse">[���ע��]</a>
        <a href="javascript:showLogin('index.jsp','index.jsp')" class="huangse top_login_btn">[��¼]</a>
        <%
            }else{
        %>
                <span ><a class="huangse"><strong><%=grwhqUser.getLcname()%></strong></a>[<%=memberGrade%>]</span> ����!��ӭ����51��������&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="../logout.jsp" class="huangse top_login_btn">�˳���½</a>
        <%
            }
        %>
        <p><span class="wap"><a href="../map.jsp" class="baise">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��վ��ͼ</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tels">�ͷ��绰��<front style="color:#F3EA0C;font-weight:bold;">400-880-1856</front></span></p>
    </div>
</div>
<div class="head_bg">
    <div class="wrapper1250 head">
        <div class="logo"><a href="index.jsp"></a></div>
    </div>
</div>
<div class="nav_bg">
    <div class="wrapper1250 nav">
        <ul>
            <li><a href="../index.jsp" class="current">��ҳ</a></li>
            <li><a href="../aboutus.jsp">��������</a></li>
            <li><a href="../grzq.htm">����ר��</a></li>
            <li><a href="../sszx.htm">�߼�����</a></li>
            <li><a href="index.htm">��Ա����</a></li>
            <li><a href="../train.jsp">����ѵ��</a></li>
            <li><a href="../hyzf.htm">��Ա�ʷ�</a></li>
            <li><a href="../guider.jsp">ʹ��ָ��</a></li>
            <li><a href="../kfzx.htm">��ϵ����</a></li>
        </ul>
    </div>
</div>
<div class="wrapper1250 notice_box"><strong>��51�������Ĺ��桿</strong>

    <div class="marquee_box">
        <%
            Wtjd wtjd = WTJDMng.getGgNews();
            if (wtjd!=null){
                if (wtjd.getStime() != null) {
        %>

        <marquee onmouseover="this.stop();" onmouseout="this.start();" scrolldelay="2" scrollamount="2"><a href="./gonggao-id-<%=wtjd.getId()%>.htm"
                                                                                                           target="_blank"><%=wtjd.getAsk()%></a>
        </marquee>
        <%
                } }
        %>
    </div>
</div>

<div class="wrapper1250 search_box"><span class="txt01">Ѱ�������Ta ��</span>
    <form id="youkeSearch" name="form2" action="../searchjg02.jsp" method="post"  target="_self">
        <!-- <input type="hidden" value="1" name="isvcation"> -->
        <label>�Ա�
            <select id="sex"  name="sex"> <option value="0" selected="">����</option> <option value="10">��</option>
                <option value="11">Ů</option></select>

        </label>
        <label>���<select name="hyzk" size="1" class="border" id="select8">
            <option selected value="0">����</option>
            <%=DicList.getDicListOption(SysDefine.DIC_HYZH, "-1")%>
        </select></label>
        <label>������
            <select id="province" name="s1">
                <option value=""
                        selected>��ѡ��</option>
                <option value=����>����</option> <option value=���>���</option> <option
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
                    value=�½�>�½�</option> <option value=���>���</option> <option
                    value=����>����</option> <option value=̨��>̨��</option> <option
                    value=����>����</option>
            </select>
        </label>
        <label>��Ƭ��
            <select name="himg" id="himg">
                <option selected="selected" value="0">����</option>
                <option value="1">��</option>
                <option value="2">��</option>
            </select>
        </label>
        <label>��֤��
           <select name="isvcation" size="1" class="border" id="isvcation">
	              <option selected value="">����</option>
	              <option value="1">����֤</option>
	        	  <option value="0">δ��֤</option>
	       	  </select>
        </label>	
        <label>
            <!-- <input type="hidden" value="1" name="isvcation" id="isvcation"> -->
            <input type="button" onclick="searchtijiao()" name="Submit" value="��������" class="ljss_btn" />
        </label>
        <label><a href="../sszx.jsp" class="gjss">�߼�����</a></label>
    </form>
</div>

<div class="divlogin_bg" id="divlogin_bgDiv"></div>
<div class="divlogin_box" id="divlogin_boxDiv">
    <div class="lm_name"><div class="close_btn" onClick="hiddenloginDiv()">�ر�</div></div>
    <%--<div class="close_btn"  onClick="hiddenloginDiv()">�ر�</div>--%>
    <div class="block01">
        <div class="tab">
            <%
                String mobile= SysCommonFunc.getStrParameter(request, "mobile");
                if (mobile==null || mobile.equals("")){
            %>
            <span id="loginTab0" class="current" onClick="logselectTag('tagContent0','loginTab0')">��ͨ��¼</span>
            <span id="loginTab1" onClick="logselectTag('tagContent1','loginTab1')">���ŵ�¼</span>
            <%}else{%>
            <span id="loginTab0" onClick="logselectTag('tagContent0','loginTab0')">��ͨ��¼</span>
            <span id="loginTab1" class="current" onClick="logselectTag('tagContent1','loginTab1')">���ŵ�¼</span>
            <% }%>
        </div>
        <form name="pt" id="pt" method="post" action="../checkuser.jsp" onSubmit="return logvalidate();" target="cname">
            <input type="hidden" name="isauto" value="" />
            <input type="hidden" name="login" value="<%=login2%>" />
            <input type="hidden" id="goToUrl" name="goToUrl" value="grzq.jsp" />
            <table width="450" border="0" cellspacing="0" cellpadding="0" style="margin-top:8px;" class="show" id="tagContent0">
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
                        <img src="../images/imager.jsp" width="50" height="17" align="bottom" onclick="this.src='../images/imager.jsp?d='+Math.random();">
                    </td>
                </tr>
                <tr>
                    <td align="right">&nbsp;</td>
                    <td><input name="" type="button" class="btn" value="������¼" onClick="webLogin()"/></td>
                </tr>
                <tr>
                    <td align="right">&nbsp;</td>
                    <td>��<a title="51��������_332�����е�רҵ����ƽ̨" href="../forget.htm" target="_blank">�һ�����</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a title="51��������_332�����е�רҵ����ƽ̨" href="../reg.htm" target="_blank">�û�ע��</a>��
                    </td>
                </tr>
            </table>
        </form>


        <form name="sj" method="post" action="../checksjlogin.jsp" onSubmit="return logvalidatesj();" target="cname">
            <input type="hidden" id="goToUrl2"  name="goToUrl" value="grzq.jsp" />
            <table width="450" border="0" cellspacing="0" cellpadding="0" style="margin-top:8px;" id="tagContent1">
                <tr>
                    <td width="200" align="right"><strong>�ֻ��ţ�</strong></td>
                    <td>
                        <input type="text" name="sjtel"  class="txt01"  style="width:300px;"  maxlength="11" value="<%=mobile%>" />
                    </td>
                </tr>
                <tr>
                    <td align="right">&nbsp;</td>
                    <td><span class="xym_btn"><a href="javascript:void(0);" onclick="logsendSms();">��ѻ�ȡУ����</a></span></td>
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
                        <a title="51��������_332�����е�רҵ����ƽ̨" href="../forget.htm" target="_blank">�һ�����</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a title="51��������_332�����е�רҵ����ƽ̨" href="../reg.htm" target="_blank">ע���»�Ա</a>
                    </td>
                </tr>
            </table>
        </form>

    </div>

</div>


<form name="csendsmsval" action="../sendsmsloginval.jsp" method="post" target="cname">
    <input name="sp" value="<%=login2%>" type="hidden"/>
    <input name="sjtel" value="" type="hidden"/>
</form>
<form name="csendsms" action="../sendsmslogin.jsp" method="post" target="cname">
    <input name="sp" value="<%=login2%>" type="hidden"/>
    <input name="sjtel" value="" type="hidden"/>
</form>
<iframe name="cname" id="cname" src="" height="0" width="0">
</iframe>

</div>

<script type="text/javascript" src="../js/lcmbase.js"></script>
<script language="JavaScript">
    function logvalidate(){
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

    function logvalidatesj()
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

    function logsendSms()
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

    function logselectTag(showContent,a){

        // ������ǩ
        for(i=0; i<2; i++){
            var tag = document.getElementById("loginTab"+i);
            tag.className = "";
        }
        document.getElementById(a).className = "current";
        // ��������
        for(var i=0; i<2; i++){
            j=document.getElementById("tagContent"+i);
            j.style.display = "none";
        }
        document.getElementById(showContent).style.display = "block";
    }


    function webLogin(){
        this.pt.submit();
    }

    function searchtijiao(){
              if(document.getElementById("province").value==""){
                  alert("��ѡ��һ������!");
                  return;
              }
           document.getElementById("youkeSearch").submit();
    }
        var closepage = "../index.jsp";
        var loginInPage = "../grzq.jsp";
    function showLogin(a,b){
        var screenwidth  = document.body.clientWidth;
        document.getElementById("divlogin_bgDiv").style.display="block";
        document.getElementById("divlogin_boxDiv").style.display="block";
        document.getElementById("divlogin_boxDiv").style.left  = (screenwidth-550)/2+"px";
        if(a!=""){
            closepage = a;
        }
        if(b!=""){
            loginInPage = b;
        }
        document.getElementById("goToUrl").value= b ;
        document.getElementById("goToUrl2").value= b ;
    }
    function hiddenloginDiv(){
        document.getElementById("divlogin_bgDiv").style.display="none";
        document.getElementById("divlogin_boxDiv").style.display="none";
           if("searchjg02.jsp" != closepage){
               window.location.href= closepage;
           }

    }
</script>


