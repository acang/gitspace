<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.servlet.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="com.lover.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.web.bean.*"%>
<%
String afilepath = SysCommonFunc.getPhotoView();
	String afilepathsmall = SysCommonFunc.getPhotoSmallView();
   String sex = SysCommonFunc.getStrParameter(request,"sex");
   if(sex.length() ==0)
     sex = "0";
   String hyzk  = SysCommonFunc.getStrParameter(request,"hyzk");
   if(hyzk.length() ==0)
     hyzk = "0";
   String himg  = SysCommonFunc.getStrParameter(request,"himg");
   if(himg.length() ==0)
     himg = "0";

  String address = SysCommonFunc.getStrParameter(request,"address");
  if(address.length() ==0)
  {
     String uri = request.getRequestURI();
     if(uri.indexOf("beijing") > -1)
       address = "beijing";
     else if(uri.indexOf("guangdong") > -1)
       address = "guangdong";
     else if(uri.indexOf("shanghai") > -1)
       address = "shanghai";
     else if(uri.indexOf("jiangsu") > -1)
       address = "jiangsu";
     else if(uri.indexOf("shandong") > -1)
       address = "shandong";
     else if(uri.indexOf("zhejiang") > -1)
       address = "zhejiang";
     else if(uri.indexOf("hunan") > -1)
       address = "hunan";
     else if(uri.indexOf("henan") > -1)
       address = "henan";
     else if(uri.indexOf("sichuan") > -1)
       address = "sichuan";
     else if(uri.indexOf("hubei") > -1)
       address = "hubei";
     else if(uri.indexOf("hebei") > -1)
       address = "hebei";
     else if(uri.indexOf("liaoning") > -1)
       address = "liaoning";
      else if(uri.indexOf("nanjing") > -1)
       address = "nanjing";
      else if(uri.indexOf("tianjin") > -1)
       address = "tianjin";
       else if(uri.indexOf("chongqing") > -1)
       address = "chongqing";
       else if(uri.indexOf("guangzhou") > -1)
       address = "guangzhou";
       else if(uri.indexOf("shenzhen") > -1)
       address = "shenzhen";
       else if(uri.indexOf("chengdu") > -1)
       address = "chengdu";
       else if(uri.indexOf("wuhan") > -1)
       address = "wuhan";
       else if(uri.indexOf("xian") > -1)
       address = "xian";
       else if(uri.indexOf("zhengzhou") > -1)
       address = "zhengzhou";
       else if(uri.indexOf("suzhou") > -1)
       address = "suzhou";
       else if(uri.indexOf("jinan") > -1)
       address = "jinan";
       else if(uri.indexOf("hangzhou") > -1)
       address = "hangzhou";
       else if(uri.indexOf("changsha") > -1)
       address = "changsha";
       else if(uri.indexOf("qingdao") > -1)
       address = "qingdao";
       else if(uri.indexOf("shijiazhuang") > -1)
       address = "shijiazhuang";
       else if(uri.indexOf("dongguan") > -1)
       address = "dongguan";
       else if(uri.indexOf("haerbin") > -1)
       address = "haerbin";
       else if(uri.indexOf("shenyang") > -1)
       address = "shenyang";
       else if(uri.indexOf("hefei") > -1)
       address = "hefei";
       else if(uri.indexOf("taiyuan") > -1)
       address = "taiyuan";
       else if (uri.indexOf("fuzhou") >-1)
       address = "fuzhou";
       else if (uri.indexOf("dalian")>-1)
       address="dalian";
     
  }



   String address1="";
   String address3="";
   String s2 = "";
    if(address.equals("dalian")){
   	    address1="����";
   	    address3="����";
   	    s2 = "����";
   }
   if(address.equals("beijing"))
   {
   		address1="����";
   		address3="����";
   }
   if(address.equals("shanghai"))
   {
       address1 = "�Ϻ�";
       address3="�Ϻ�";
   }

   if(address.equals("nanjing"))
   {
   		address1="����";
   		address3="����";
   		s2 = "�Ͼ�";
   		
   }
   if(address.equals("tianjin"))
   {
   		address3="���";
   		address1="���";
   		//s2 = "���";
   }
   if(address.equals("chongqing"))
   {
   		address3="����";
   		address1="����";
   		//s2 = "����";
   }
   if(address.equals("fuzhou")){
   		address1="����";
   		address3="����";
   		s2 ="����";
   }
   if(address.equals("guangzhou"))
   {
   		address1="�㶫";
   		address3="�㶫";
   		s2 = "����";
   }
   if(address.equals("shenzhen"))
   {
   		address1="�㶫";
   		address3="�㶫";
   		s2 = "����";
   }
   if(address.equals("chengdu"))
   {	
                address1="�Ĵ�";
   		address3="�Ĵ�";
   		s2 = "�ɶ�";
   }
   if(address.equals("wuhan"))
   {
   		address1="����";
   		address3="����";
   		s2 = "�人";
   }
   if(address.equals("xian"))
   {
   		address1="����";
   		address3="����";
   		s2 = "����";
   }
   if(address.equals("zhengzhou"))
   {
   		address1="����";
   		address3="����";
   		s2 = "֣��";
   }
   if(address.equals("suzhou"))
   {
   		address1="����";
   		address3="����";
   		s2 = "����";
   }
   if(address.equals("jinan"))
   {
   		address1="ɽ��";
   		address3="ɽ��";
   		s2 = "����";
   }
   if(address.equals("hangzhou"))
   {
   		address1="�㽭";
   		address3="�㽭";
   		s2 = "����";
   }
   if(address.equals("changsha"))
   {
   		address1="����";
   		address3="����";
   		s2 = "��ɳ";
   }
   if(address.equals("qingdao"))
   {
   		address1="ɽ��";
   		address3="ɽ��";
   		s2 = "�ൺ";
   }
   if(address.equals("shijiazhuang"))
   {
   		address1="�ӱ�";
   		address3="�ӱ�";
   		s2 = "ʯ��ׯ";
   }
   if(address.equals("dongguan"))
   {
   		address1="�㶫";
   		address3="�㶫";
   		s2 = "��ݸ";
   }
   if(address.equals("haerbin"))
   {
   		address1="������";
   		address3="������";
   		s2 = "������";
   }
   if(address.equals("shenyang"))
   {
   		address1="����";
   		address3="����";
   		s2 = "����";
   }
   if(address.equals("hefei"))
   {
   		address1="����";
   		address3="����";
   		s2 = "�Ϸ�";
   }
   if(address.equals("taiyuan"))
   {
   		address1="ɽ��";
   		address3="ɽ��";
   		s2 = "̫ԭ";
   }
   if(address.equals("shenzhen"))
   {
   		address1="�㶫";
   		address3="�㶫";
                s2 = "����";
   }


   String yx   = SysCommonFunc.getStrParameter(request,"yx");
   if(yx.length() ==0)
     yx = "0";

   String jyyx = SysCommonFunc.getStrParameter(request,"jyyx");
   int jyyxP = SysCommonFunc.getNumberFromString(jyyx,0);
Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
   if(jyyxP!=0 || yx.length() > 1 || !himg.equals("0"))
   {

  if(loginUser == null)
  {
    out.println("<script language='javascript'>alert('�����οͣ�����Ȩ�޲���������ע�ᣡ');window.parent.open('../reg.htm');</script>");
    //return;
	jyyx="";
    yx="0";
    himg="0";
  }
   }

  if(address1.length() ==0){
  	out.println("<script language='javascript'>alert('��ַ�գ�');window.parent.open('../index.htm');</script>");
    return;
  }

   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);


   int pagesize = 10;

   ///�õ��û��б�
   String sql = "from Userinfo as o where o.isdel = 0 and o.isvcation = 1 ";
   //String sql = "select o.hyid,o.lcname,o.csdate,o.sex,o.hyzk,o.yx,o.s1,o.s2,o.jyyx,o.setzt from Userinfo as o where o.isdel = 0 ";


   if(address1.length() > 1)
     sql = sql + " and o.s1= '"+address1+"'";
   if(s2 != null && s2.length() > 1)
     sql = sql + " and o.s2='"+s2+"'";
   if(sex.length() > 1)
      sql = sql + " and o.sex ='"+sex+"'";
   if(hyzk.length() > 1)
      sql = sql + " and o.hyzk = '"+hyzk+"'";

   if(yx.length() > 1)
      sql = sql + " and o.yx = '"+yx+"'";
   if(jyyxP > 0 && jyyxP < 8)
   {
      sql = sql + " and jyyx like '"+LoverTools.getMinJyyx(jyyxP)+"'";
   }
   if(himg.length() > 0 && !himg.equals("0"))
   {
     if(himg.equals("1"))
       sql = sql + " and o.img > 0";
     else if(himg.equals("2"))
       sql = sql + " and o.img = 0";
   }

   if(sex.length() > 1 && sex.equals("11") || address.equals("�Ϻ�") || address.equals("�㶫") || address.equals("���"))
     sql = sql+" order by o.regtime5 desc";
   else
     sql = sql+" order by o.regtime5 desc";




   long start = System.currentTimeMillis();

   QueryResult qr = null;  qr = QueryRecord.queryByHbm(sql,pagesize,cpage);


   long step = System.currentTimeMillis()-start;

   System.out.println("time="+step/1000);
   int totalPage = qr.pageCount;
   int totalCount = qr.rowCount;
   cpage = qr.pageNum;
   int prepage = cpage-1;
   int nextpage = cpage+1;


%>



<link href="./css/style201204.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style>
<script type="text/javascript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>

<script type="text/JavaScript">
<!--

function turn(pages)
{
   if (isNaN(pages))
   {
		 alert("����ȷ��дת��ҳ����");
                return;
   }

   document.go2to.cpages.value=pages+"";
   document.go2to.submit();
   //go2to.page.value
}



//-->
</script>
<table width="910" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#e7f0fa">
      <%
			 int j = 0;
for(j=0;j < qr.resultList.size();j++)
{
   boolean isvery = false;
   Userinfo temp = (Userinfo)qr.resultList.get(j);
   Date cdate11 =  DateTools.stringToDate("2010-08-27");
   isvery = false;
   if(temp.getIsvcation()==1)
   	isvery = true;
   Userother userother = HYRegMng.getUserOtherByHyid(temp.getHyid().toString());
   Date csdate = temp.getCsdate();
   Date cdate  = new Date(System.currentTimeMillis());
   String age = "δ֪";
   if(csdate != null)
     age  = (cdate.getYear()-csdate.getYear())+"";
   String vs1 = (temp.getS1() == null ? "":temp.getS1()) + (temp.getS2() == null ? "":temp.getS2());
   if(vs1.equals("��������"))
     vs1 = "����";
   if(vs1.equals("�Ϻ��Ϻ�"))
     vs1 = "�Ϻ�";
   if(vs1.equals("������"))
     vs1 = "���";
   if(vs1.equals("��������"))
     vs1 = "����";
   if(vs1.equals("������"))
     vs1 = "���";
   if(vs1.equals("���Ű���"))
     vs1 = "����";
   String vjyyx = LoverTools.getJYYXDes(temp);
   String jyzt = LoverTools.getJYZTDes(temp);
  String vhyzk = DicList.getDicValue(SysDefine.DIC_HYZH,temp.getHyzk(),1);
                  
    if(j%2 == 0 && j>0)
   				  {
                   %>
   				  	</tr>
   				  	<%
                  }
   				  if(j%2 == 0)
   				  {
                   %>
   				  	<tr>
   				  	<%
                  }
                   %>
                        <td height="145"><table width="350" border="0" align="left" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="112" align="center"><table border="0" cellspacing="1" cellpadding="4" bgcolor="#ced6df">
                              <tr>
                                <td bgcolor="#e7f0fa"><%
                        if(userother != null && userother.getUserphoto1() != null && userother.getUserphoto1().length() > 0)
                        {
                        %>
           <a href="../perinfo-id-<%=temp.getHyid()%>.htm" target="_blank" class="new_link06"><img src="../<%=afilepathsmall+File.separator+userother.getUserphoto1() %>" width="90" height="120" /></a>
                       <%
                        }else
                        {
                        %>
                          <a href="../perinfo-id-<%=temp.getHyid()%>.htm" target="_blank" class="new_link06"><img src="images/nopic2.gif" width="90" height="120" border="0"></a>
                       <%
                        }
                       %></td>
                              </tr>
                            </table></td>
                            <td width="238" valign="top" style="color:#6b6b6b; line-height:22px"><a href="../perinfo-id-<%=temp.getHyid()%>.htm" target="_blank" class="new_link06">
                            <strong><font color="#41a4e3"><%=temp.getLcname() %></font></strong></a><%if(isvery) {%> - <img src="images/yyz.gif" width="14" height="13" /><font color="#FF0000">����֤</font><%} %><br />
                              <font color="#ff7878"><strong><%=temp.getSex().equals("11") ? "Ů" : "��" %></strong></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= age %>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=vhyzk %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=vs1 %><br />
                              <strong>��������</strong><%=vjyyx%><br />
                              <%
                                 String ly="";
                                  if(userother != null && userother.getJyly() != null && userother.getJyly().length()>50){
                                  	ly = userother.getJyly().substring(0,50);
                                  }else if(userother != null && userother.getJyly() != null && userother.getJyly().length()>0 &&userother.getJyly().length()<=50 ){
                                  	ly = userother.getJyly();
                                  }else{
                                  	ly = "";
                                  }
                                  
                               %>
                              <strong>�������ԣ�</strong><%=ly%></td>
                          </tr>
                        </table>
                          <br />
                          <br />                          <br /></td>
                        <%
                  }
                  if(j%2 == 1)
   				  {
                   %>
   				  	<td height="145"><table width="350" border="0" align="left" cellpadding="0" cellspacing="0"></table><br/>
            <br/></td></tr>
   				  	<%
                  }
                  
                  
                  %>
      
    </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#e7f0fa">
        <tr>
          <td align="center" height="50px"><form name="go2to" method="post" action="area2.jsp">
                            <input type="hidden" name="sex" value="<%=sex%>"/>
                            <input type="hidden" name="address" value="<%=address%>" />
                            <input type="hidden" name="hyzk" value="<%=hyzk%>" />
                            <input type="hidden" name="yx" value="<%=yx%>" />
                            <input type="hidden" name="himg" value="<%=himg%>" />
                            <input type="hidden" name="jyyx" value="<%=jyyx%>" />
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">


ҳ�Σ�<%=cpage%>/<%=totalPage%>ҳ
 <%
int startpage = 0;
if((cpage-5) <=0)
  startpage = 1;
else
  startpage = cpage-5;

if(cpage == 1)
{
  //out.println("��ҳ&nbsp;��һҳ&nbsp; ");
}
else
{
  out.println("<a href='area2-cpages-1-sex-"+sex+"-address-"+address+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx+"-jyyx-"+jyyx+"-tcounts-"+qr.rowCount+".htm'>�� ҳ</a>&nbsp;&nbsp;<a href='area2-cpages-"+prepage+"-sex-"+sex+"-address-"+address+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx+"-jyyx-"+jyyx+"-tcounts-"+qr.rowCount+".htm'>��һҳ</a>&nbsp;&nbsp;");
}

for(int i =startpage;i < startpage+10; i ++)
{
  if(i < totalPage && i != cpage)
     out.println("<a href='area2-cpages-"+i+"-sex-"+sex+"-address-"+address+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx+"-jyyx-"+jyyx+"-tcounts-"+qr.rowCount+".htm'>"+i+"</a>&nbsp;&nbsp;");
  else if(i == cpage)
     out.println("<span style=\"color:#FF0000;font-size:16px\"><strong>"+i+"</strong></span>&nbsp;&nbsp;");
    //out.println("<input  name=\"textfield\" type=\"text\" class=\"input02 page_input\" value=\""+i+"\" onclick=\"javascript:turn('"+i+"')\" readonly />");

     //
}


if(cpage >= totalPage )
{
  //out.println("��һҳ&nbsp;βҳ&nbsp; ");
}
else
{
  out.println("<a href='area2-cpages-"+nextpage+"-sex-"+sex+"-address-"+address+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx+"-jyyx-"+jyyx+"-tcounts-"+qr.rowCount+".htm'>��һҳ</a>&nbsp;&nbsp;<a href='area2-cpages-"+totalPage+"-sex-"+sex+"-address-"+address+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx+"-jyyx-"+jyyx+"-tcounts-"+qr.rowCount+".htm'>βҳ</a>&nbsp;&nbsp;");
}
%>

<font color='000064'> ת����<input type='text' name='turnpage' size=5 maxLength=8 style='font-size: 9pt; color:#00006A; position: relative; height: 18' value="">ҳ</font>&nbsp;<input class=button type='button' value='ȷ ��' onclick=turn(document.go2to.turnpage.value) style='font-family: ����; font-size: 9pt; color: #000073; position: relative; height: 19'>
  &nbsp; ��<%=totalCount%>����Ա &nbsp;
</font>

</form></td>
			     </tr>
    </table></td>
    <td width="160" valign="top" bgcolor="#d6e6f3"><img src="images/search.jpg" width="160" height="24" />
      <table width="154" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#E7F0FA">
        <tr>
          <td width="160" height="110"><table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
            <tbody>
              <tr>
                <td align="left">����Ƭѡ��</td>
              </tr>
              <% 
              	if(address.equals("beijing"))
			   {
			   		s2="����";
			   }
			   if(address.equals("shanghai"))
			   {
			       s2 = "�Ϻ�";
			   }
				if(address.equals("tianjin"))
			   {
			   		s2 = "���";
			   }
				if(address.equals("chongqing"))
			   {
			   		s2 = "����";
			   }
              %>
               <tr>
                <td align="left"><ul>
                  <li <%=himg.equals("0")  ? "style=\"background:#0099CC\"":""%>><a href="area2-address-<%=address+"-as2-"+s2+"-sex-"+sex+"-jyyx-"+jyyx+"-himg-0-hyzk-"+hyzk+"-yx-"+yx%>.htm" <%=himg.equals("0") ? "style=\"color: #FFFFFF\"":""%>>����</a></li>
                  <li <%=himg.equals("1") ? "style=\"background:#0099CC\"":""%>><a href="area2-address-<%=address+"-as2-"+s2+"-sex-"+sex+"-jyyx-"+jyyx+"-himg-1-hyzk-"+hyzk+"-yx-"+yx%>.htm" <%=himg.equals("1") ? "style=\"color: #FFFFFF\"":""%>>��</a></li>
                  <li <%=himg.equals("2") ? "style=\"background:#0099CC\"":""%>><a href="area2-address-<%=address+"-as2-"+s2+"-sex-"+sex+"-jyyx-"+jyyx+"-himg-2-hyzk-"+hyzk+"-yx-"+yx%>.htm" <%=himg.equals("2") ? "style=\"color: #FFFFFF\"":""%>>��</a></li>
                </ul></td>
              </tr>
              <tr>
                <td align="left">���Ա�ѡ��</td>
              </tr>
              <tr>
                <td align="left"><ul>
                  <li <%=sex.equals("0")  ? "style=\"background:#0099CC\"":""%>><a href="area2-address-<%=address+"-sex-"+"0"+"-jyyx-"+jyyx+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx%>.htm" <%=sex.equals("0") ? "style=\"color: #FFFFFF\"":""%>>����</a></li>
                  <li <%=sex.equals("10") ? "style=\"background:#0099CC\"":""%>><a href="area2-address-<%=address+"-sex-"+"10"+"-jyyx-"+jyyx+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx%>.htm" <%=sex.equals("10") ? "style=\"color: #FFFFFF\"":""%>>˧��</a></li>
                  <li <%=sex.equals("11") ? "style=\"background:#0099CC\"":""%>><a href="area2-address-<%=address+"-sex-"+"11"+"-jyyx-"+jyyx+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx%>.htm" <%=sex.equals("11") ? "style=\"color: #FFFFFF\"":""%>>��Ů</a></li>
                </ul></td>
              </tr>
              <tr>
                <td align="left">������״��ѡ��</td>
              </tr>
              <tr>
                <td align="left"><ul>
                  <li <%=hyzk.equals("0")  ? "style=\"background:#0099CC\"":""%>><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+jyyx+"-himg-"+himg+"-himg-"+himg+"-hyzk-"+"0"+"-yx-"+yx%>.htm" <%=hyzk.equals("0") ? "style=\"color: #FFFFFF\"":""%>>����</a></li>
                  <li <%=hyzk.equals("10") ? "style=\"background:#0099CC\"":""%>><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+jyyx+"-himg-"+himg+"-hyzk-"+"10"+"-yx-"+yx%>.htm"  <%=hyzk.equals("10") ? "style=\"color: #FFFFFF\"":""%>>δ��</a></li>
                  <li <%=hyzk.equals("12") ? "style=\"background:#0099CC\"":""%>><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+jyyx+"-himg-"+himg+"-hyzk-"+"12"+"-yx-"+yx%>.htm"  <%=hyzk.equals("12") ? "style=\"color: #FFFFFF\"":""%>>����</a></li>
                  <li <%=hyzk.equals("11") ? "style=\"background:#0099CC\"":""%>><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+jyyx+"-himg-"+himg+"-hyzk-"+"11"+"-yx-"+yx%>.htm" <%=hyzk.equals("11") ? "style=\"color: #FFFFFF\"":""%>>�ѻ�</a></li>
                  
                </ul></td>
              </tr>
              <tr>
                <td align="left">����нѡ��</td>
              </tr>
              <tr>
                <td align="left"><ul>
                  <li <%=yx.equals("0")  ? "style=\"background:#0099CC\"":""%>><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+jyyx+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+"0"%>.htm" <%=yx.equals("0") ? "style=\"color: #FFFFFF\"":""%>>����</a></li>
                </ul></td>
              </tr>
              <tr>
                <td align="left"><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+jyyx+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+"10"%>.htm"   <%=yx.equals("10") ? "style=\"background:#0099CC;color: #FFFFFF\"":""%>>2��Ԫ����</a></td>
              </tr>
              <tr>
                <td align="left"><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+jyyx+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+"11"%>.htm"  <%=yx.equals("11") ? "style=\"background:#0099CC;color: #FFFFFF\"":""%>>2-5��Ԫ</a></td>
              </tr>
              <tr>
                <td align="left"><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+jyyx+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+"12"%>.htm"   <%=yx.equals("12") ? "style=\"background:#0099CC;color: #FFFFFF\"":""%>>5-10��Ԫ</a></td>
              </tr>
              <tr>
                <td align="left"><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+jyyx+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+"13"%>.htm"   <%=yx.equals("13") ? "style=\"background:#0099CC;color: #FFFFFF\"":""%>>10-100��Ԫ </a></td>
              </tr>
              <tr>
                <td align="left"><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+jyyx+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+"14"%>.htm"   <%=yx.equals("14") ? "style=\"background:#0099CC;color: #FFFFFF\"":""%> >100��Ԫ���� </a></td>
              </tr>
              <tr>
                <td align="left">����������ѡ��</td>
              </tr>
              <tr>
                <td align="left"><ul>
                  <li <%=jyyx.equals("")  ? "style=\"background:#0099CC\"":""%>><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+""+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx%>.htm" <%=jyyx.equals("") ? "style=\"color: #FFFFFF\"":""%>>����</a></li>
                </ul></td>
              </tr>
              <tr>
                <td align="left"><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+"1"+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx%>.htm"   <%=jyyx.equals("1") ? "style=\"background:#0099CC;color: #FFFFFF\"":""%>>������</a> 
                <a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+"2"+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx%>.htm"  <%=jyyx.equals("2") ? "style=\"background:#0099CC;color: #FFFFFF\"":""%>>��������</a></td>
              </tr>
              <tr>
                <td align="left"><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+"3"+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx%>.htm"    <%=jyyx.equals("3") ? "style=\"background:#0099CC;color: #FFFFFF\"":""%>>ͬ������</a> 
                <a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+"4"+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx%>.htm"   <%=jyyx.equals("4") ? "style=\"background:#0099CC;color: #FFFFFF\"":""%>>����</a></td>
              </tr>
              <tr>
                <td align="left"><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+"5"+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx%>.htm"   <%=jyyx.equals("5") ? "style=\"background:#0099CC\"":""%>>Eҹ��</a> 
                <a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+"6"+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx%>.htm"  <%=jyyx.equals("6") ? "style=\"background:#0099CC;color: #FFFFFF\"":""%>>���</a></td>
              </tr>
              <tr>
                <td align="left"><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+"7"+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx%>.htm"   <%=jyyx.equals("7") ? "style=\"background:#0099CC;color: #FFFFFF\"":""%>>����</a></td>
              </tr>
              <tr>
                <td align="left">&nbsp;</td>
              </tr>
            </tbody>
          </table></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <script type="text/javascript">
        	function aa(){
        		window.parent.open('../sszx.htm');
        	}
        </script>
          <td align="center"><a  href="#"><img src="images/search1.jpg" width="160" height="55" onclick="aa()"/></a></td>
        </tr>
    </table></td>
  </tr>
</table>