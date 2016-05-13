<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.lover.mng.*"%>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>

<%

    String lcname = request.getParameter("lcname");
    String qggx = request.getParameter("qggx");
    String lxqr = request.getParameter("lxqr");
    String jyly = request.getParameter("jyly");
    String sjtel=SysCommonFunc.getStrParameter(request,"sjtel");
    if(sjtel.length()>0){
    	List listt =HbmOperator.list("from Usernamecut");
        for(int i=0;i<listt.size();i++)
        {
        	Usernamecut usernamecut=(Usernamecut)listt.get(i);
        	
        	if(sjtel.indexOf(usernamecut.getUsernamecut())!=-1)
        	{
        		out.println("<script language='javascript'>{window.alert('您的手机无法注册，请联系管理员！');window.top.document.personal.lcname.focus();window.top.document.getElementById('sjtel').style.display ='block';}</script>");
        		return;
        	}
        }
    }
    List list = HbmOperator.list("from Userinfo as o where o.regtime > sysdate-1 and o.httpip = '"+IPTools.getIp(request) + "' and o.isdel=0");
	if(list.size() > 0)
	{
	  Userinfo utemp = (Userinfo)list.get(0);
	 System.out.println("重复注册:"+list.size()+":"+utemp.getLcname() + ":"+utemp.getUsername() + ":"+utemp.getHttpip());
	  out.println("<script language='javascript'>{window.alert('"+"一天之内请不要重复注册!"+"');}</script>");
	return;
	}
    	Sensitive sensitive =null;
        List listt =HbmOperator.list("from Sensitive");
        boolean  a = true;
        for(int i=0;i<listt.size();i++)
        {
        	sensitive=(Sensitive)listt.get(i);
        	
        	if(lcname.indexOf(sensitive.getSensitive())==-1)
        	{
                out.println("<script language='javascript'>{window.top.document.getElementById('lcname1').style.display ='none';}</script>");
        	}
        	if(qggx.indexOf(sensitive.getSensitive())==-1)
        	{
                out.println("<script language='javascript'>{window.top.document.getElementById('qggx1').style.display ='none';}</script>");
        	}
        	if(lxqr.indexOf(sensitive.getSensitive())==-1)
        	{
                out.println("<script language='javascript'>{window.top.document.getElementById('lxqr1').style.display ='none';}</script>");
        	}
        	if(jyly.indexOf(sensitive.getSensitive())==-1)
        	{
                out.println("<script language='javascript'>{window.top.document.getElementById('jyly1').style.display ='none';}</script>");
        	}
        	
        	if(lcname.indexOf(sensitive.getSensitive())!=-1)
        	{
                a = false;
                out.println("<script language='javascript'>{window.alert('"+"（昵称）中含有敏感词“"+sensitive.getSensitive()+"”，请修改！"+"');window.top.document.personal.lcname.focus();window.top.document.getElementById('lcname1').style.display ='block';}</script>");
        		return;
        	}
        	if(qggx.indexOf(sensitive.getSensitive())!=-1)
        	{
                a = false;
                out.println("<script language='javascript'>{window.alert('"+"（情爱关系）中含有敏感词“"+sensitive.getSensitive()+"”，请修改！"+"');window.top.document.personal.qggx.focus();window.top.document.getElementById('qggx1').style.display ='block'}</script>");
        		return;
        	}
        	if(lxqr.indexOf(sensitive.getSensitive())!=-1)
        	{
                a = false;
                out.println("<script language='javascript'>{window.alert('"+"（理想情人）中含有敏感词“"+sensitive.getSensitive()+"”，请修改！"+"');window.top.document.personal.lxqr.focus();window.top.document.getElementById('lxqr1').style.display ='block'}</script>");
        		return;
        	}
        	if(jyly.indexOf(sensitive.getSensitive())!=-1)
        	{
                a = false;
                out.println("<script language='javascript'>{window.alert('"+"（交友留言）中含有敏感词“"+sensitive.getSensitive()+"”，请修改！"+"');window.top.document.personal.jyly.focus();window.top.document.getElementById('jyly1').style.display ='block'}</script>");
        		return;
        	}

        }

    if(a){
        String s = HYRegMng.userReg2NewUser(request);
        if(s == null)
        {
        %>
        <script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F9f77dbe500dc55538bd80add7b45eac4' type='text/javascript'%3E%3C/script%3E"));
</script>
        
        <% 
            session.setAttribute("reg","ok");
		//添加审核
      String tempHyid = SysCommonFunc.getStrParameter(request, "hyid");
        Userinfo tempUserinfo = HYRegMng.getAllUserinfoByHyid(tempHyid);
        if(tempUserinfo!=null){
	        Checkinfo checkinfo = new Checkinfo(2L,tempUserinfo.getHyid(),0L,"会员注册成功",tempUserinfo.getUsername(),tempUserinfo.getLcname(),"",null,new Date(),"0",tempUserinfo.getSex(),tempUserinfo.getCsdate(),null);

	        CheckinfoMng.addCheckInfo(checkinfo);
        }
            out.println("<script language='javascript'>window.alert('您已成功提交资料，请保持手机畅通，网站审核员将会尽快与您进行真实性审核，审核通过后，您的资料才能激活上线！');window.top.location.replace('grzq.jsp');</script>");
            //修改为成功
        }
        else if(s.startsWith("11"))
        {
            out.println("<script language='javascript'>{window.alert('"+s.substring(2)+"');}</script>");
        }else if(s.startsWith("12"))
        {
            String mobile=SysCommonFunc.getStrParameter(request,"sjtel");
            out.println("<script language='javascript'>{window.alert('"+s.substring(2)+"');window.top.location.replace('login.jsp?mobile="+mobile+"');}</script>");
            //   out.println("<script language='javascript'>{window.alert('"+s.substring(2)+"');window.open('login.jsp?mobile="+mobile+"');}</script>");

        }else
        {
            out.println("<script language='javascript'>{window.alert('"+s+"');}</script>");
        }

    }



%>
