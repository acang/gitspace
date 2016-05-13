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
   	    address1="辽宁";
   	    address3="辽宁";
   	    s2 = "大连";
   }
   if(address.equals("beijing"))
   {
   		address1="北京";
   		address3="北京";
   }
   if(address.equals("shanghai"))
   {
       address1 = "上海";
       address3="上海";
   }

   if(address.equals("nanjing"))
   {
   		address1="江苏";
   		address3="江苏";
   		s2 = "南京";
   		
   }
   if(address.equals("tianjin"))
   {
   		address3="天津";
   		address1="天津";
   		//s2 = "天津";
   }
   if(address.equals("chongqing"))
   {
   		address3="重庆";
   		address1="重庆";
   		//s2 = "重庆";
   }
   if(address.equals("fuzhou")){
   		address1="福建";
   		address3="福建";
   		s2 ="福州";
   }
   if(address.equals("guangzhou"))
   {
   		address1="广东";
   		address3="广东";
   		s2 = "广州";
   }
   if(address.equals("shenzhen"))
   {
   		address1="广东";
   		address3="广东";
   		s2 = "深圳";
   }
   if(address.equals("chengdu"))
   {	
                address1="四川";
   		address3="四川";
   		s2 = "成都";
   }
   if(address.equals("wuhan"))
   {
   		address1="湖北";
   		address3="湖北";
   		s2 = "武汉";
   }
   if(address.equals("xian"))
   {
   		address1="陕西";
   		address3="陕西";
   		s2 = "西安";
   }
   if(address.equals("zhengzhou"))
   {
   		address1="河南";
   		address3="陕西";
   		s2 = "郑州";
   }
   if(address.equals("suzhou"))
   {
   		address1="江苏";
   		address3="江苏";
   		s2 = "苏州";
   }
   if(address.equals("jinan"))
   {
   		address1="山东";
   		address3="山东";
   		s2 = "济南";
   }
   if(address.equals("hangzhou"))
   {
   		address1="浙江";
   		address3="浙江";
   		s2 = "杭州";
   }
   if(address.equals("changsha"))
   {
   		address1="湖南";
   		address3="湖南";
   		s2 = "长沙";
   }
   if(address.equals("qingdao"))
   {
   		address1="山东";
   		address3="山东";
   		s2 = "青岛";
   }
   if(address.equals("shijiazhuang"))
   {
   		address1="河北";
   		address3="河北";
   		s2 = "石家庄";
   }
   if(address.equals("dongguan"))
   {
   		address1="广东";
   		address3="广东";
   		s2 = "东莞";
   }
   if(address.equals("haerbin"))
   {
   		address1="黑龙江";
   		address3="黑龙江";
   		s2 = "哈尔滨";
   }
   if(address.equals("shenyang"))
   {
   		address1="辽宁";
   		address3="辽宁";
   		s2 = "沈阳";
   }
   if(address.equals("hefei"))
   {
   		address1="安徽";
   		address3="安徽";
   		s2 = "合肥";
   }
   if(address.equals("taiyuan"))
   {
   		address1="山西";
   		address3="山西";
   		s2 = "太原";
   }
   if(address.equals("shenzhen"))
   {
   		address1="广东";
   		address3="广东";
                s2 = "深圳";
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
    out.println("<script language='javascript'>alert('您是游客，您的权限不够，请先注册！');window.parent.open('../reg.htm');</script>");
    //return;
	jyyx="";
    yx="0";
    himg="0";
  }
   }

  if(address1.length() ==0){
  	out.println("<script language='javascript'>alert('地址空！');window.parent.open('../index.htm');</script>");
    return;
  }

   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);


   int pagesize = 10;

   ///得到用户列表
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

   if(sex.length() > 1 && sex.equals("11") || address.equals("上海") || address.equals("广东") || address.equals("天津"))
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
		 alert("请正确填写转到页数！");
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
   String age = "未知";
   if(csdate != null)
     age  = (cdate.getYear()-csdate.getYear())+"";
   String vs1 = (temp.getS1() == null ? "":temp.getS1()) + (temp.getS2() == null ? "":temp.getS2());
   if(vs1.equals("北京北京"))
     vs1 = "北京";
   if(vs1.equals("上海上海"))
     vs1 = "上海";
   if(vs1.equals("天津天津"))
     vs1 = "天津";
   if(vs1.equals("重庆重庆"))
     vs1 = "重庆";
   if(vs1.equals("香港香港"))
     vs1 = "香港";
   if(vs1.equals("澳门澳门"))
     vs1 = "澳门";
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
                            <strong><font color="#41a4e3"><%=temp.getLcname() %></font></strong></a><%if(isvery) {%> - <img src="images/yyz.gif" width="14" height="13" /><font color="#FF0000">已验证</font><%} %><br />
                              <font color="#ff7878"><strong><%=temp.getSex().equals("11") ? "女" : "男" %></strong></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= age %>岁&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=vhyzk %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=vs1 %><br />
                              <strong>交友意向：</strong><%=vjyyx%><br />
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
                              <strong>交友留言：</strong><%=ly%></td>
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


页次：<%=cpage%>/<%=totalPage%>页
 <%
int startpage = 0;
if((cpage-5) <=0)
  startpage = 1;
else
  startpage = cpage-5;

if(cpage == 1)
{
  //out.println("首页&nbsp;上一页&nbsp; ");
}
else
{
  out.println("<a href='area2-cpages-1-sex-"+sex+"-address-"+address+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx+"-jyyx-"+jyyx+"-tcounts-"+qr.rowCount+".htm'>首 页</a>&nbsp;&nbsp;<a href='area2-cpages-"+prepage+"-sex-"+sex+"-address-"+address+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx+"-jyyx-"+jyyx+"-tcounts-"+qr.rowCount+".htm'>上一页</a>&nbsp;&nbsp;");
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
  //out.println("下一页&nbsp;尾页&nbsp; ");
}
else
{
  out.println("<a href='area2-cpages-"+nextpage+"-sex-"+sex+"-address-"+address+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx+"-jyyx-"+jyyx+"-tcounts-"+qr.rowCount+".htm'>下一页</a>&nbsp;&nbsp;<a href='area2-cpages-"+totalPage+"-sex-"+sex+"-address-"+address+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx+"-jyyx-"+jyyx+"-tcounts-"+qr.rowCount+".htm'>尾页</a>&nbsp;&nbsp;");
}
%>

<font color='000064'> 转到第<input type='text' name='turnpage' size=5 maxLength=8 style='font-size: 9pt; color:#00006A; position: relative; height: 18' value="">页</font>&nbsp;<input class=button type='button' value='确 定' onclick=turn(document.go2to.turnpage.value) style='font-family: 宋体; font-size: 9pt; color: #000073; position: relative; height: 19'>
  &nbsp; 共<%=totalCount%>个会员 &nbsp;
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
                <td align="left">按照片选择：</td>
              </tr>
              <% 
              	if(address.equals("beijing"))
			   {
			   		s2="北京";
			   }
			   if(address.equals("shanghai"))
			   {
			       s2 = "上海";
			   }
				if(address.equals("tianjin"))
			   {
			   		s2 = "天津";
			   }
				if(address.equals("chongqing"))
			   {
			   		s2 = "重庆";
			   }
              %>
               <tr>
                <td align="left"><ul>
                  <li <%=himg.equals("0")  ? "style=\"background:#0099CC\"":""%>><a href="area2-address-<%=address+"-as2-"+s2+"-sex-"+sex+"-jyyx-"+jyyx+"-himg-0-hyzk-"+hyzk+"-yx-"+yx%>.htm" <%=himg.equals("0") ? "style=\"color: #FFFFFF\"":""%>>不限</a></li>
                  <li <%=himg.equals("1") ? "style=\"background:#0099CC\"":""%>><a href="area2-address-<%=address+"-as2-"+s2+"-sex-"+sex+"-jyyx-"+jyyx+"-himg-1-hyzk-"+hyzk+"-yx-"+yx%>.htm" <%=himg.equals("1") ? "style=\"color: #FFFFFF\"":""%>>有</a></li>
                  <li <%=himg.equals("2") ? "style=\"background:#0099CC\"":""%>><a href="area2-address-<%=address+"-as2-"+s2+"-sex-"+sex+"-jyyx-"+jyyx+"-himg-2-hyzk-"+hyzk+"-yx-"+yx%>.htm" <%=himg.equals("2") ? "style=\"color: #FFFFFF\"":""%>>无</a></li>
                </ul></td>
              </tr>
              <tr>
                <td align="left">按性别选择：</td>
              </tr>
              <tr>
                <td align="left"><ul>
                  <li <%=sex.equals("0")  ? "style=\"background:#0099CC\"":""%>><a href="area2-address-<%=address+"-sex-"+"0"+"-jyyx-"+jyyx+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx%>.htm" <%=sex.equals("0") ? "style=\"color: #FFFFFF\"":""%>>不限</a></li>
                  <li <%=sex.equals("10") ? "style=\"background:#0099CC\"":""%>><a href="area2-address-<%=address+"-sex-"+"10"+"-jyyx-"+jyyx+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx%>.htm" <%=sex.equals("10") ? "style=\"color: #FFFFFF\"":""%>>帅哥</a></li>
                  <li <%=sex.equals("11") ? "style=\"background:#0099CC\"":""%>><a href="area2-address-<%=address+"-sex-"+"11"+"-jyyx-"+jyyx+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx%>.htm" <%=sex.equals("11") ? "style=\"color: #FFFFFF\"":""%>>美女</a></li>
                </ul></td>
              </tr>
              <tr>
                <td align="left">按婚姻状况选择：</td>
              </tr>
              <tr>
                <td align="left"><ul>
                  <li <%=hyzk.equals("0")  ? "style=\"background:#0099CC\"":""%>><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+jyyx+"-himg-"+himg+"-himg-"+himg+"-hyzk-"+"0"+"-yx-"+yx%>.htm" <%=hyzk.equals("0") ? "style=\"color: #FFFFFF\"":""%>>不限</a></li>
                  <li <%=hyzk.equals("10") ? "style=\"background:#0099CC\"":""%>><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+jyyx+"-himg-"+himg+"-hyzk-"+"10"+"-yx-"+yx%>.htm"  <%=hyzk.equals("10") ? "style=\"color: #FFFFFF\"":""%>>未婚</a></li>
                  <li <%=hyzk.equals("12") ? "style=\"background:#0099CC\"":""%>><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+jyyx+"-himg-"+himg+"-hyzk-"+"12"+"-yx-"+yx%>.htm"  <%=hyzk.equals("12") ? "style=\"color: #FFFFFF\"":""%>>单身</a></li>
                  <li <%=hyzk.equals("11") ? "style=\"background:#0099CC\"":""%>><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+jyyx+"-himg-"+himg+"-hyzk-"+"11"+"-yx-"+yx%>.htm" <%=hyzk.equals("11") ? "style=\"color: #FFFFFF\"":""%>>已婚</a></li>
                  
                </ul></td>
              </tr>
              <tr>
                <td align="left">按年薪选择：</td>
              </tr>
              <tr>
                <td align="left"><ul>
                  <li <%=yx.equals("0")  ? "style=\"background:#0099CC\"":""%>><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+jyyx+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+"0"%>.htm" <%=yx.equals("0") ? "style=\"color: #FFFFFF\"":""%>>不限</a></li>
                </ul></td>
              </tr>
              <tr>
                <td align="left"><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+jyyx+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+"10"%>.htm"   <%=yx.equals("10") ? "style=\"background:#0099CC;color: #FFFFFF\"":""%>>2万元以下</a></td>
              </tr>
              <tr>
                <td align="left"><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+jyyx+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+"11"%>.htm"  <%=yx.equals("11") ? "style=\"background:#0099CC;color: #FFFFFF\"":""%>>2-5万元</a></td>
              </tr>
              <tr>
                <td align="left"><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+jyyx+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+"12"%>.htm"   <%=yx.equals("12") ? "style=\"background:#0099CC;color: #FFFFFF\"":""%>>5-10万元</a></td>
              </tr>
              <tr>
                <td align="left"><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+jyyx+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+"13"%>.htm"   <%=yx.equals("13") ? "style=\"background:#0099CC;color: #FFFFFF\"":""%>>10-100万元 </a></td>
              </tr>
              <tr>
                <td align="left"><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+jyyx+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+"14"%>.htm"   <%=yx.equals("14") ? "style=\"background:#0099CC;color: #FFFFFF\"":""%> >100万元以上 </a></td>
              </tr>
              <tr>
                <td align="left">按交友意向选择：</td>
              </tr>
              <tr>
                <td align="left"><ul>
                  <li <%=jyyx.equals("")  ? "style=\"background:#0099CC\"":""%>><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+""+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx%>.htm" <%=jyyx.equals("") ? "style=\"color: #FFFFFF\"":""%>>不限</a></li>
                </ul></td>
              </tr>
              <tr>
                <td align="left"><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+"1"+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx%>.htm"   <%=jyyx.equals("1") ? "style=\"background:#0099CC;color: #FFFFFF\"":""%>>纯友谊</a> 
                <a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+"2"+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx%>.htm"  <%=jyyx.equals("2") ? "style=\"background:#0099CC;color: #FFFFFF\"":""%>>异性恋人</a></td>
              </tr>
              <tr>
                <td align="left"><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+"3"+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx%>.htm"    <%=jyyx.equals("3") ? "style=\"background:#0099CC;color: #FFFFFF\"":""%>>同性恋人</a> 
                <a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+"4"+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx%>.htm"   <%=jyyx.equals("4") ? "style=\"background:#0099CC;color: #FFFFFF\"":""%>>婚姻</a></td>
              </tr>
              <tr>
                <td align="left"><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+"5"+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx%>.htm"   <%=jyyx.equals("5") ? "style=\"background:#0099CC\"":""%>>E夜情</a> 
                <a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+"6"+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx%>.htm"  <%=jyyx.equals("6") ? "style=\"background:#0099CC;color: #FFFFFF\"":""%>>陪伴</a></td>
              </tr>
              <tr>
                <td align="left"><a href="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+"7"+"-himg-"+himg+"-hyzk-"+hyzk+"-yx-"+yx%>.htm"   <%=jyyx.equals("7") ? "style=\"background:#0099CC;color: #FFFFFF\"":""%>>其它</a></td>
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