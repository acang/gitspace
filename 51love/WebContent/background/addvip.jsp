<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.servlet.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%@page import="com.web.bean.QueryRecord"%>
<%@page import="org.apache.commons.beanutils.DynaBean"%>
<%
   Admininfo adminLoginInfo = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
   if(adminLoginInfo.getFlag() == null)
   {
      out.println("<script language='javascript'>alert('�Բ�������Ȩ���ӹ���Ա�����ϣ�');history.go(-1);</script>");
      return;
   }
   if(adminLoginInfo.getFlag().intValue() != 10 && adminLoginInfo.getFlag().intValue() != 1 && adminLoginInfo.getFlag().intValue() != 30)
   {
      out.println("<script language='javascript'>history.go(-1);</script>");
      return;
   }
   List plist = ProductMng.getProductList();
   String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");
   String lytime =SysCommonFunc.getStrParameter(request,"lytime");
   String sffs  =  SysCommonFunc.getStrParameter(request,"sffs");
   if(sffs == null || sffs.length() ==0)
      sffs = "1";

   if(bizaction.equals(""))
     bizaction = "01";
   String nbizaction = "";
   if(bizaction.equals("01"))
     nbizaction = "02";
   if(bizaction.equals("02"))
     nbizaction = "03";



   String sqhy = SysCommonFunc.getStrParameter(request,"sqhy");
   String czsj = SysCommonFunc.getStrParameter(request,"czsj");
   String yyxq = SysCommonFunc.getStrParameter(request,"yyxq");
   String product = SysCommonFunc.getStrParameter(request,"product");
   String area = SysCommonFunc.getStrParameter(request,"area");
   String zzsj    = SysCommonFunc.getStrParameter(request,"zzsj");
   String hyid    = SysCommonFunc.getStrParameter(request,"hyid");
   String simplename = SysCommonFunc.getStrParameter(request,"simplename");
   String content =SysCommonFunc.getStrParameter(request,"lycontent");
   Userinfo usqhy = null;
   //String productinfo = "";
   Product p = null;
    System.out.println(bizaction+"---------------"+product);
   if(czsj.length() ==0)
   {
      Date cdate = new Date(System.currentTimeMillis());
      czsj =  DateTools.dateToString(cdate,true);
      request.getSession().setAttribute("cdate",cdate);
   }
   if(bizaction.equals("02"))
   {

      usqhy = HYRegMng.getUserinfoByUsername(sqhy);
      

      if(usqhy == null)
      {
        out.println("<script langauge=javascript>alert('û���ҵ���Ҫ�������û������������룡');history.go(-1)</script>");
        nbizaction = "02";
        return;
      }else
      {
       if(!lytime.equals(""))
      {
          String sql ="select id from kfzx where n_date = to_date('"+lytime+"','YY-MM-dd HH24:mi:ss')";

          System.out.println(sql);
          try
          {
               List list =QueryRecord.query(sql);
               if(list.size()==0)
               {
                    out.println("<script langauge=javascript>alert('������ʱ�䲻��ȷ�����������룡');history.go(-1)</script>");
                     return;
                }
           }catch(Exception e)
           {
      	        out.println("<script langauge=javascript>alert('��������ȷ�����ڸ�ʽ��');history.go(-1)</script>");
                return;
            }
      }


         p = ProductMng.getProduct(product);

         if(p == null)
         {
            out.println("<script langauge=javascript>alert('û���ҵ���Ҫ�����ķ���������ѡ��');</script>");
            nbizaction = "02";
            return;
         }else
         {
            //String datetype = p.getDatetype().intValue() ==1 ? "��":"��";
            String datetype="";
            if (p.getDatetype().intValue()==1){
            	datetype="��";
            }else if (p.getDatetype().intValue()==0){
            	datetype="��";
            }else {
            	datetype="��";
            }
            //productinfo = p.getSqdj()+":���:"+p.getTransamt()+"Ԫ:"+p.getServiceyear()+datetype;
            hyid = usqhy.getHyid().toString();
            if(usqhy.getZzsj() == null)
            {
               Date cdate = new Date(System.currentTimeMillis());
               yyxq = DateTools.dateToString(cdate,false);

               cdate.setDate(cdate.getDate()+1);
               if(p.getDatetype().intValue() ==1)
               {
                 cdate.setYear(cdate.getYear()+p.getServiceyear().intValue());
                 zzsj = DateTools.dateToString(cdate,false);
               }else if (p.getDatetype().intValue() ==0)
               {
                 cdate.setMonth(cdate.getMonth()+p.getServiceyear().intValue());
                 zzsj = DateTools.dateToString(cdate,false);
               }else {
               	 cdate.setDate(cdate.getDate()+p.getServiceyear().intValue()*7);
                 zzsj = DateTools.dateToString(cdate,false);
               }
            }
            else
            {
               Date cdate = new Date(System.currentTimeMillis());
               yyxq = DateTools.dateToString(usqhy.getZzsj(),false);
               if(usqhy.getZzsj().after(cdate))
                cdate = usqhy.getZzsj();
               else
                cdate.setDate(cdate.getDate()+1);
               if(p.getDatetype().intValue() ==1)
               {
                 cdate.setYear(cdate.getYear()+p.getServiceyear().intValue());
                 zzsj = DateTools.dateToString(cdate,false);
               }else if (p.getDatetype().intValue() ==0)
               {
                 cdate.setMonth(cdate.getMonth()+p.getServiceyear().intValue());
                 zzsj = DateTools.dateToString(cdate,false);
               }else {
                 cdate.setDate(cdate.getDate()+p.getServiceyear().intValue()*7);
                 zzsj = DateTools.dateToString(cdate,false);
               }
            }

         }
      }

      if(p.getFlag() ==5)
      {
          zzsj = "";
          yyxq = "";
      }
		
   }
   
   
   if(bizaction.equals("03"))
   {
      String transamt=SysCommonFunc.getStrParameter(request,"transamt");
      try{
      	double a=Double.parseDouble(transamt);
      } catch(Exception e)
      {
 	       out.println("<script langauge=javascript>alert('������ֻ��������ֵ,���������룡');history.go(-1)</script>");
           return;
       }
      p = ProductMng.getProduct(product);
      
      //�жϸ�����ʱ����û����Ƿ��Ѱ����
      String sqll="select l.lyid,k.n_date,l.updatetime from lycart l join kfzx k on l.lyid = k.id where l.hyid = "+hyid+" and k.n_date = to_date('"+lytime+"','YY-MM-DD HH24:mi:ss')";
	  List listl=QueryRecord.query(sqll);
	  if(listl.size()>0)
	  {
	  	  DynaBean dbl=(DynaBean)listl.get(0);
	      out.println("<script langauge=javascript>alert('�������û�����ʱ����շ����ڣ�"+DateTools.dateToString((Date)dbl.get("updatetime"),true)+" �������');history.go(-1)</script>");
          return;
	  }
      
      String s = VIPMng.addVipRecord(request,adminLoginInfo,hyid,zzsj,p,HYRegMng.getUserinfoByHyid(hyid));
      
    if(!lytime.equals(""))
    {
      try
      {
      	Lycart lycart =new Lycart();
        lycart.setHyid(new Long(hyid));
        
      String sql ="select id from kfzx where n_date = to_date('"+lytime+"','YY-MM-dd HH24:mi:ss')";
      DynaBean db=null;
      try
      {
      List list =QueryRecord.query(sql);
      if(list.size()>0)
      {
      	db=(DynaBean)list.get(0);
      }
      }catch(Exception e)
      {
      	out.println("<script langauge=javascript>alert('����������ڣ�');history.go(-1)</script>");
        return;
      }
      
        lycart.setLyid(new Long(String.valueOf(db.get("id"))));
        Date temptime=(Date)session.getAttribute("cdate");
        lycart.setUpdatetime(temptime);
        HbmOperator.insert(lycart);
      }
      catch(Exception e)
      {
      	System.out.println(e.getMessage());
      	out.println("<script language='javascript'>alert('��������');</script>");
        return;
      }
      }
   
      if(s == null)
      {
         lytime="";
         //add by linyu 20151031 for ����ΪVIP�û�������Ƭ����ҳ�����Ա�Ƽ���һ��
          Userother uother = HYRegMng.getUserOtherByHyid(hyid);
         if(uother.getUserphoto1()!=null && !"".equals(uother.getUserphoto1())){
             String type = "9";
             String sql2 = "update userinfo set important = important+1 where  important >90 and  important<120";
             HbmOperator.executeSql(sql2);
             String sql = "update userinfo set important = " + type+"1" + " where  hyid = " +hyid;
             HbmOperator.executeSql(sql);
          }
         
      }else
      {
         out.println("<script langauge=javascript>alert('"+s+"');document.form1.lytime.value='';</script>");
      }
      nbizaction = "02";
    sqhy    = "";
    yyxq    = "";
    product = "";
    zzsj    = "";
    hyid    = "";
   }
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>51love��������</title>
<link href="style/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	scrollbar-3dlight-color:#8CABDE;
	scrollbar-highlight-color:#eeeeee;
	scrollbar-face-color:#E8F1FF;
	scrollbar-arrow-color:#8CABDE;
	scrollbar-shadow-color:#8CABDE;
	scrollbar-darkshadow-color:#eeeeee;
	scrollbar-base-color:#F0F0F0;
	scrollbar-track-color:#F2F7FF;
}
-->
</style>


</head>

<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="./images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
      <tr>
        <td align="center">�շѰ���</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
<form name="form1" method="post" action="addvip.jsp">
  <input type="hidden" name="bizaction" value="<%=nbizaction%>">
  <input type="hidden" name="hyid" value="<%=hyid%>"/>
  <input name="czsj" type="hidden" id="czsj" value="<%=czsj%>" size="20">
  <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
    <tr align="center" >
      <td width="11%" height="31" class="tdc"><strong>����</strong></td>
      <td width="16%" align="left">
      <select name="sffs" id="sffs">
	        <option value="1" <%=sffs.equals("1") ? "selected":""%>>�շ�</option>
	        <option value="0" <%=sffs.equals("0") ? "selected":""%>>���</option>
      </select>
      </td>
      <td width="15%" class="tdc"><strong>������</strong></td>
      <td width="11%" align="left"><input name="czry" type="text" id="czry" value="<%=adminLoginInfo.getAdminname()%>" size="12" readonly=""></td>
      <td class="tdc" width="13%"><strong>�����û���</strong></td>
      <td align="left" width="24%"><input name="sqhy" type="text" id="sqhy" value="<%=sqhy%>" size="12"></td>
      <td width="14%" class="tdc"><strong>����ʱ��</strong></td>
      <td width="16%" align="left"><input name="lytime" type="text" size="20" id="lytime" value="<%=lytime%>">	 </td>
    </tr>

    <tr align="center" >
	  <td width="11%" height="31" class="tdc"><strong>��������</strong></td>
      <td width="16%" align="left">
      	<% 
            String tsdqArray="";
        	for(int i=0;i<SysDefine.tsdqArray.length;i++){
        		tsdqArray+=SysDefine.tsdqArray[i].toString();
        		if (i!=(SysDefine.tsdqArray.length-1)){
        			tsdqArray+=",";
        		}
        	}
        %>
        <input type="hidden" name="tsdqArray" value=<%=tsdqArray %>>
        <input type="hidden" name="tsdqzk" value=<%=SysDefine.tsdqzk %>>
        <input type="hidden" name="ybdqzk" value=<%=SysDefine.ybdqzk %>>
      	<select name="area" onchange="pch()"> 
            <option value="ȫ��" <%=area.equals("ȫ��")? "selected":""%>>ȫ��</option> 
			<option value="����" <%=area.equals("����")? "selected":""%>>����</option> 
			<option value="���" <%=area.equals("���")? "selected":""%>>���</option> 
			<option value="�ӱ�" <%=area.equals("�ӱ�")? "selected":""%>>�ӱ�</option> 
			<option value="ɽ��" <%=area.equals("ɽ��")? "selected":""%>>ɽ��</option> 
			<option value="���ɹ�" <%=area.equals("���ɹ�")? "selected":""%>>���ɹ�</option> 
			<option value="����" <%=area.equals("����")? "selected":""%>>����</option> 
			<option value="����" <%=area.equals("����")? "selected":""%>>����</option> 
			<option value="������" <%=area.equals("������")? "selected":""%>>������</option> 
			<option value="�Ϻ�" <%=area.equals("�Ϻ�")? "selected":""%>>�Ϻ�</option> 
			<option value="����" <%=area.equals("����")? "selected":""%>>����</option> 
			<option value="�㽭" <%=area.equals("�㽭")? "selected":""%>>�㽭</option> 
			<option value="����" <%=area.equals("����")? "selected":""%>>����</option> 
			<option value="����" <%=area.equals("����")? "selected":""%>>����</option> 
			<option value="����" <%=area.equals("����")? "selected":""%>>����</option> 
			<option value="ɽ��" <%=area.equals("ɽ��")? "selected":""%>>ɽ��</option> 
			<option value="����" <%=area.equals("����")? "selected":""%>>����</option> 
			<option value="����" <%=area.equals("����")? "selected":""%>>����</option> 
			<option value="����" <%=area.equals("����")? "selected":""%>>����</option> 
			<option value="�㶫" <%=area.equals("�㶫")? "selected":""%>>�㶫</option> 
			<option value="����" <%=area.equals("����")? "selected":""%>>����</option> 
			<option value="����" <%=area.equals("����")? "selected":""%>>����</option> 
			<option value="����" <%=area.equals("����")? "selected":""%>>����</option> 
			<option value="�Ĵ�" <%=area.equals("�Ĵ�")? "selected":""%>>�Ĵ�</option> 
			<option value="����" <%=area.equals("����")? "selected":""%>>����</option> 
			<option value="����" <%=area.equals("����")? "selected":""%>>����</option> 
			<option value="����" <%=area.equals("����")? "selected":""%>>����</option> 
			<option value="����" <%=area.equals("����")? "selected":""%>>����</option> 
			<option value="����" <%=area.equals("����")? "selected":""%>>����</option> 
			<option value="�ຣ" <%=area.equals("�ຣ")? "selected":""%>>�ຣ</option> 
			<option value="����" <%=area.equals("����")? "selected":""%>>����</option> 
			<option value="�½�" <%=area.equals("�½�")? "selected":""%>>�½�</option> 
			<option value="���" <%=area.equals("���")? "selected":""%>>���</option> 
			<option value="����" <%=area.equals("����")? "selected":""%>>����</option> 
			<option value="̨��" <%=area.equals("̨��")? "selected":""%>>̨��</option> 
			<option value="����" <%=area.equals("����")? "selected":""%>>����</option>
		</select>
      </td>
      <td class="tdc"><strong>������Ŀ</strong></td>
      <td height="31" align="left"><select name="product" id="product" onChange="javascript:pch()">
       <%
       String transamt=SysCommonFunc.getStrParameter(request,"transamt");
       
       for(int i=0;i < plist.size();i ++)
       {
          Product temp = (Product)plist.get(i);
          String se = "";
          if(p != null && p.getId().longValue() == temp.getId().longValue()){
           se = "selected";
           if (transamt.length()==0){
           	transamt=Long.toString(p.getTransamt().longValue());
           }
          }else if(i==0){
            if (transamt.length()==0){
          		transamt=Long.toString(temp.getTransamt().longValue());
            }
          }
       %>
        <option value="<%=temp.getId()%>" <%=se%>><%=temp.getName()+"--"+temp.getTransamt()%></option>
        <%
       }
       %>
      </select></td>
      <td height="30" class="tdc"><strong>������</strong></td>
      <td align="left"><input name="transamt" type="text" id="transamt" value="<%=transamt%>" maxlength="7" size="12">Ԫ ���������֣�</td>
      <td class="tdc"></td>
      <td align="left">
      	
      </td>
    </tr>
	
	 <tr align="center" >
      <td height="31" class="tdc"><strong>�Ƽ��ͷ�</strong></td>
      <td align="left"><input name="simplename" type="text" id="simplename" value="<%=simplename%>" size="20" maxlength="4"></td>
      <td class="tdc"><strong>ԭ��Ч����</strong></td>
      <td height="31" align="left"><input name="yyxq" type="text" id="yyxq" value="<%=yyxq%>" size="12" readonly=""></td>
      <td height="30" class="tdc"><strong>��������</strong></td>
      <td align="left"><input name="zzsj" type="text" id="zzsj" value="<%=zzsj%>" size="12"></td>
      <td class="tdc">&nbsp;</td>
      <td align="left">&nbsp;</td>
    </tr>
    <tr align="center" >
      <td height="30" colspan="8"><input type="submit" name="Submit2"  class="button1" value="�ύ" onClick="return check();">      </td>
    </tr>
  </table>
</form>
<table width="98%" height="300" border="1" align="center" cellpadding="0" cellspacing="0"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse">
  <tr>
    <td align="left" valign="top"><iframe name="vipaddtoday" src="addviptoday.jsp" width="100%" height="100%" scrolling="auto" frameborder="0"></iframe></td>
  </tr>
</table>

</body>
</html>
<script language="JavaScript">
function check()
{
if (checkspace(document.form1.lytime.value))
{
	alert('����������ʱ�䣡');
	document.form1.lytime.focus();
	return false;
}

var transamt=document.form1.transamt.value.replace(/[ ]/g,"");
document.form1.transamt.value=document.form1.transamt.value.replace(/[ ]/g,"");
if (isNaN(transamt)){
	alert('������ֻ��������ֵ,���������룡');
	document.form1.transamt.focus();
	return false;
}


 if(confirm("ȷ��Ҫ����ô��"))
 {
     return true;
 }else
     return false;


}
function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}

function pch()
{
  var  product = document.getElementById("product");
  var productM=product.options[product.selectedIndex].text;
  var index=productM.indexOf("--");
  var transamt=0;
  if (index>=0){
  	transamt=productM.substr(index+2);
  }
  var area=document.form1.area.value;
  var tsdqArray=new Array();
  tsdqArray=document.form1.tsdqArray.value.split(',');
  var tsdqzk=document.form1.tsdqzk.value;
  var ybdqzk=document.form1.ybdqzk.value;
  if (area=="ȫ��"){
	document.getElementById("transamt").value=transamt;
  }else{
    document.getElementById("transamt").value=ybdqzk*transamt;
	for(var i=0;i<tsdqArray.length;i++){
		if (tsdqArray[i]==area){
			document.getElementById("transamt").value=tsdqzk*transamt;
		}
	}
  }
  if(document.form1.bizaction.value == '03');
  {
    document.form1.bizaction.value='02';
    document.form1.submit();
  }

}
</script>

