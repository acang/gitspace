<%@ page contentType="text/html; charset=gbk" %>

<%@ page import="com.lover.mng.FriendMng" %>
<%@ page import="com.web.obj.Friend" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<link href="../style/css.css" rel="stylesheet" type="text/css">
<script language=javascript src="../../script/common.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="../../commonlib/calendar/calendar-win2k-cold-1.css" title="win2k-cold-1" />
<script type="text/javascript" src="../../commonlib/calendar/calendar.js"></script>

<!-- language for the calendar -->
<script type="text/javascript" src="../../commonlib/calendar/lang/calendar-zh.js"></script>

<!-- the following script defines the Calendar.setup helper function, which makes
adding a calendar a matter of 1 or 2 lines of code. -->
<script type="text/javascript" src="../../commonlib/calendar/calendar-setup.js"></script>
<script language="JavaScript">
    function check(sform)
    {

        if (sform.bianhao.value.length==0)
        {
            alert('排序不能为空');
            sform.bianhao.focus();
            return false;
        }
        if (sform.netname.value.length==0)
        {
            alert('友情链接的网站名称不能为空');
            sform.netname.focus();
            return false;
        }
        if (sform.nethttp.value.length==0)
        {
            alert('友情链接的网址不能为空');
            sform.nethttp.focus();
            return false;
        }
//        if (sform.netlogo.value.length==0)
//        {
//            alert('友情链接的logo网址不能为空');
//            sform.netlogo.focus();
//            return false;
//        }
        return true;
    }



</script>
<%
    String mid = SysCommonFunc.getStrParameter(request, "mid");
    String state = SysCommonFunc.getStrParameter(request, "state");
    Friend mfr = new Friend();
    if(mid.length() > 0)
    {
         mfr = FriendMng.getFriend("from Friend as o where o.id=" + mid);
    }
        String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");
        if(bizaction.equals("01"))
        {
            String s = FriendMng.addFriend(request);
            if(s == null)
            {
                out.println("<script language='javascript'>alert('您已经成功添加了友情链接！');window.location.href='friend.jsp?state="+state+"'</script>");
            }
            else
            {
                out.println("<script language='javascript'>alert('"+s+"');window.location.href='friend.jsp'</script>");
            }
        }
        if(bizaction.equals("02"))
        {
            String s = FriendMng.modFriend(request);
            if(s == null)
            {
                out.println("<script language='javascript'>alert('您已经成功修改了友情链接！');window.location.href='friend.jsp?state="+state+"'</script>");
            }
            else
            {
                out.println("<script language='javascript'>alert('"+s+"');window.location.href='friend.jsp?state="+state+"'</script>");
            }
        }

%>
<html>
<head> </head>
<body>
<form name="form2" method="post" action="friendEdit.jsp" onSubmit="return check(document.form2);">
    <input type="hidden" name="bizaction" value="<%=mfr.getId()==null?"01":"02"%>"/>
    <input type="hidden" name="id" value="<%=mfr.getId()%>"/>
    <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"    bordercolor="D8D8D8" class="txt" style="border-collapse:collapse">


        <tr>
            <td align="center" ><strong>网站名称：</strong></td>
            <td align="left" ><input name="netname" type="text" id="netname" value="<%=mfr.getNetname()==null?"":mfr.getNetname()%>" size="50">      </td>
        </tr>
        <tr>
            <td align="center" ><strong>网站logo：</strong></td>
            <td align="left" >
                <input name="netlogo" type="hidden" id="netlogo"
                       value="<%=mfr.getNetlogo()==null?"":mfr.getNetlogo()%>" size="50">
                <%
                    if(mfr.getNetlogo()!=null){
                %>
                <img src="../newwebpage/linkpic/<%= mfr.getNetlogo()%>" width="125" height="45" border="0">
                <%}else{%>
                无
                <%}%>

            </td>
        </tr>
        <tr>
            <td align="center" ><strong>网　　址：</strong></td>
            <td align="left" ><input name="nethttp" type="text" id="nethttp" value="<%=mfr.getNethttp()==null?"":mfr.getNethttp()%>" size="50"></td>
        </tr>
        <tr>
            <td align="center" ><strong>网站介绍：</strong></td>
            <td align="left" ><input name="memo" type="text" id="memo" value="<%=mfr.getMemo()==null?"":mfr.getMemo()%>" size="80"></td>
        </tr>
        <tr>
            <td align="center" ><strong>联系人：</strong></td>
            <td align="left" ><input name="man" type="text" id="man" value="<%=mfr.getMan()==null?"":mfr.getMan()%>" size="30"></td>
        </tr>
        <tr>
            <td align="center" ><strong>联系电话：</strong></td>
            <td align="left" ><input name="tel" type="text" id="tel" value="<%=mfr.getTel()==null?"":mfr.getTel()%>" size="30"></td>
        </tr>
        <tr>
            <td align="center" ><strong>提交时间：</strong></td>
            <td align="left" ><input name="applydate" type="text" id="applydate" value="<%=mfr.getApplydate()==null?"":mfr.getApplydate()%>" size="30">
                <img src="../../commonlib/calendar/img.gif" width="20" height="14" id="endt">
                <script type="text/javascript">
                    Calendar.setup({
                        inputField     :    "applydate",      // id of the input field
                        ifFormat       :    "%Y-%m-%d",       // format of the input field
                        showsTime      :    false,            // will display a time selector
                        button         :    "endt",   // trigger for the calendar (button ID)
                        singleClick    :    true,           // double-click mode
                        step           :    1                // show all years in drop-down boxes (instead of every other year as default)
                    });
                </script>
            </td>
        </tr>
        <tr>
            <td align="center" ><strong>链接方式：</strong></td>
            <td align="left" >  <select name="type" id="type">
                <option value="0">文字</option>
                <option value="1">图片</option>
            </select>
              </td>
        </tr>
        <tr>
            <td width="20%" align="center" ><strong>排序：</strong></td>
            <td width="80%" align="left" ><input name="bianhao" type="text" id="bianhao" value="<%=mfr.getBianhao()==null?"":mfr.getBianhao()%>" size="50">      </td>
        </tr>
        <tr>
            <td align="center" ><strong>状态：</strong></td>
            <td align="left" >
                <select name="state" id="state">
                    <option value="0">申请</option>
                    <option value="1">启用</option>
                    <option value="2">停用</option>
                </select>
               </td>
        </tr>
        <tr>
            <td colspan="2" align="center" ><input name="Submit2" type="submit"  class="button1" value="保存"></td>
        </tr>


    </table>
</form>
</body>

</html>
