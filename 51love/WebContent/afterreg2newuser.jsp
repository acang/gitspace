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
        		out.println("<script language='javascript'>{window.alert('�����ֻ��޷�ע�ᣬ����ϵ����Ա��');window.top.document.personal.lcname.focus();window.top.document.getElementById('sjtel').style.display ='block';}</script>");
        		return;
        	}
        }
    }
    List list = HbmOperator.list("from Userinfo as o where o.regtime > sysdate-1 and o.httpip = '"+IPTools.getIp(request) + "' and o.isdel=0");
	if(list.size() > 0)
	{
	  Userinfo utemp = (Userinfo)list.get(0);
	 System.out.println("�ظ�ע��:"+list.size()+":"+utemp.getLcname() + ":"+utemp.getUsername() + ":"+utemp.getHttpip());
	  out.println("<script language='javascript'>{window.alert('"+"һ��֮���벻Ҫ�ظ�ע��!"+"');}</script>");
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
                out.println("<script language='javascript'>{window.alert('"+"���ǳƣ��к������дʡ�"+sensitive.getSensitive()+"�������޸ģ�"+"');window.top.document.personal.lcname.focus();window.top.document.getElementById('lcname1').style.display ='block';}</script>");
        		return;
        	}
        	if(qggx.indexOf(sensitive.getSensitive())!=-1)
        	{
                a = false;
                out.println("<script language='javascript'>{window.alert('"+"���鰮��ϵ���к������дʡ�"+sensitive.getSensitive()+"�������޸ģ�"+"');window.top.document.personal.qggx.focus();window.top.document.getElementById('qggx1').style.display ='block'}</script>");
        		return;
        	}
        	if(lxqr.indexOf(sensitive.getSensitive())!=-1)
        	{
                a = false;
                out.println("<script language='javascript'>{window.alert('"+"���������ˣ��к������дʡ�"+sensitive.getSensitive()+"�������޸ģ�"+"');window.top.document.personal.lxqr.focus();window.top.document.getElementById('lxqr1').style.display ='block'}</script>");
        		return;
        	}
        	if(jyly.indexOf(sensitive.getSensitive())!=-1)
        	{
                a = false;
                out.println("<script language='javascript'>{window.alert('"+"���������ԣ��к������дʡ�"+sensitive.getSensitive()+"�������޸ģ�"+"');window.top.document.personal.jyly.focus();window.top.document.getElementById('jyly1').style.display ='block'}</script>");
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
		//������
      String tempHyid = SysCommonFunc.getStrParameter(request, "hyid");
        Userinfo tempUserinfo = HYRegMng.getAllUserinfoByHyid(tempHyid);
        if(tempUserinfo!=null){
	        Checkinfo checkinfo = new Checkinfo(2L,tempUserinfo.getHyid(),0L,"��Աע��ɹ�",tempUserinfo.getUsername(),tempUserinfo.getLcname(),"",null,new Date(),"0",tempUserinfo.getSex(),tempUserinfo.getCsdate(),null);

	        CheckinfoMng.addCheckInfo(checkinfo);
        }
            out.println("<script language='javascript'>window.alert('���ѳɹ��ύ���ϣ��뱣���ֻ���ͨ����վ���Ա���ᾡ������������ʵ����ˣ����ͨ�����������ϲ��ܼ������ߣ�');window.top.location.replace('grzq.jsp');</script>");
            //�޸�Ϊ�ɹ�
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
