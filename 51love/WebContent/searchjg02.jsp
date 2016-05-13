<%@ page contentType="text/html; charset=GBK" language="java" errorPage="" %>
<%@ page import="com.web.bean.QueryResult" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<%@ page import="com.lover.mng.UserVisitMng" %>
<%@ page import="com.lover.LoverTools" %>
<%@ page import="com.web.bean.QueryRecord" %>
<%@ page import="com.web.obj.extend.DicList" %>
<%@ page import="com.lover.mng.HYRegMng" %>
<%@ page import="com.web.common.DateTools" %>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.File" %>
<%@ page import="com.web.obj.*" %>
<%
    String afilepathsmall = SysCommonFunc.getPhotoSmallView();
    request.setCharacterEncoding("gb2312");
    Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);


    if (loginUser!=null){
        String vurl="";
        vurl=request.getRequestURL().toString();
        if (request.getQueryString()!=null){
            vurl+="?"+request.getQueryString();
        }
        UserVisitMng.insertUserVisit(loginUser.getHyid(), vurl);
    }
%>
<%
  //  System.out.println("�߼���ѯ"+request.getRemoteAddr()+"---"+loginUser.getUsername());
    String isvcation  = SysCommonFunc.getStrParameter(request,"isvcation");
    //modified by gjh for ���ؽ��������������֤��δ��֤��Ա
    /*if(isvcation==null){
        isvcation = "0";
    }*/
    System.out.println("searchjg02.jsp--isvcation:"+isvcation);
    String sex = SysCommonFunc.getStrParameter(request,"sex");
    if(sex.length() ==0){
        sex = "0";
    }
    String address = request.getParameter("s1");
    HashMap hm = (HashMap)request.getAttribute("query");
    if(hm != null && hm.get("s1") != null)
    {
        address = hm.get("s1").toString();
    }
    if(address == null)
        address = "";
    String s2 = request.getParameter("s2");
    if(hm != null && hm.get("s2") != null)
        s2 = hm.get("s2").toString();
    if(s2 == null)
        s2 = "";
    int jyyxP =0;
    String jyyx = SysCommonFunc.getStrParameter(request,"jyyx");

    if(jyyx!=null){
         jyyxP = SysCommonFunc.getNumberFromString(jyyx,0);
  }

    String yx   = SysCommonFunc.getStrParameter(request,"yx");
    if(yx.length() ==0){
        yx = "0";
    }

    String hyzk  = SysCommonFunc.getStrParameter(request,"hyzk");
    if(hyzk.length() ==0){
        hyzk = "0";
    }


    String sx = SysCommonFunc.getStrParameter(request,"sx");
    if(sx.length() ==0){
        sx = "0";
    }

    String xz = SysCommonFunc.getStrParameter(request,"xz");
    if(xz.length() ==0)
        xz = "0";
    String sg = SysCommonFunc.getStrParameter(request,"sg");
    if(sg.length() ==0){
        sg = "0";
    }

    String tz = SysCommonFunc.getStrParameter(request, "tz");
    if(tz.length() ==0){
        tz = "0";
    }

    String fs = SysCommonFunc.getStrParameter(request,"fs");
    if(fs.length() ==0){
        fs = "0";
    }

    String whcd = SysCommonFunc.getStrParameter(request,"whcd");
    if(whcd.length() ==0){
        whcd = "0";
    }

    String zf = SysCommonFunc.getStrParameter(request,"zf");
    if(zf.length() ==0)
        zf = "0";


    int agestart = SysCommonFunc.getNumberFromString(SysCommonFunc.getStrParameter(request,"agestart"),0);
    int ageend = SysCommonFunc.getNumberFromString(SysCommonFunc.getStrParameter(request,"ageend"),0);

    String himg = SysCommonFunc.getStrParameter(request,"himg");

    String zy = SysCommonFunc.getStrParameter(request,"zy");
    if(zy.length() ==0)
        zy = "0";
    String lltime = SysCommonFunc.getStrParameter(request,"lltime");
    String user_income = SysCommonFunc.getStrParameter(request,"user_income");
    int income  = SysCommonFunc.getNumberFromString(user_income,0);

    String cpages = SysCommonFunc.getStrParameter(request,"cpages");
    if(cpages==null|| "".equals(cpages) ){
        cpages = "1";
    }
    int cpage = SysCommonFunc.getNumberFromString(cpages,1);
    String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
    int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);
    int pagesize = 10;

    ///�õ��û��б�
    String sql = "from Userinfo as o where o.isdel = 0";
    if(isvcation!=null && isvcation!=""){
        sql=sql+" and o.isvcation = "+isvcation;
    }
    if(sex.length() > 1){
        sql = sql + " and o.sex ='"+sex+"'";
    }

    if(address.length() > 1)
        sql = sql + " and o.s1 ='"+address+"'";
    if(s2.length() > 1)
    {
        if(address.equals("����") || address.equals("���") || address.equals("����") || address.equals("�Ϻ�"))
            sql = sql +" and  ( o.s2 = '"+address+"' or s2 = '" + s2+"')";
        else
            sql = sql + " and o.s2 ='"+s2+"'";
    }
    if(jyyxP > 0 && jyyxP < 8)
    {
        sql = sql + " and jyyx like '"+ LoverTools.getMinJyyx(jyyxP)+"'";
    }
    if(whcd.length() > 1){
        sql = sql + " and o.whcd = '"+whcd+"'";
    }

    if(agestart !=0 && ageend!=0)
    {
        int year = new Date(System.currentTimeMillis()).getYear() + 1900 - agestart;
        String csdate = year + "-12-31 23:59:59";
        sql = sql + " and o.csdate <= to_date('"+csdate+"','YYYY-MM-DD HH24:MI:SS')";

         year = new Date(System.currentTimeMillis()).getYear() + 1900 - ageend;
         csdate = year + "-01-01";
         sql = sql + " and o.csdate >= to_date('"+csdate+"','YYYY-MM-DD')";
    }

    if(zy.length() > 1){
        sql = sql + " and (o.zy is null or o.zy = '"+zy+"')";
    }
    if(himg.length() > 0 && !himg.equals("0"))
    {
        if(himg.equals("1"))
            sql = sql + " and o.img > 0";
        else if(himg.equals("2"))
            sql = sql + " and o.img = 0";
    }

    if(hyzk.length() > 1){
        sql = sql + " and o.hyzk = '"+hyzk+"'";
    }
    if(zf.length() > 1){
        sql = sql + " and o.zf = '"+zf+"'";
    }

    if(yx.length() > 1)
        sql = sql + " and o.yx = '"+yx+"'";

    if(sx.length() > 1){
        sql = sql + " and o.sx = '"+sx+"'";
    }
    if(sg.length() > 1){
        sql = sql + " and o.sg = '"+sg+"'";
    }
    if(xz.length() > 1){
        sql = sql + " and o.xz = '"+xz+"'";
    }
    if(tz.length() > 1){
        sql = sql + " and o.tz = '"+tz+"'";
    }
     if(fs.length() > 1){
        sql = sql + " and o.fs = '"+fs+"'";
    }

    if(income>0){
        sql = sql + " and o.yx = '"+income+"'";
    }

    //10�죬45�죬4���£�1���

//    String stemp = "";
//    int lday = 0;
//    if(lltime.equals("1"))
//    {
//        lday = 10;
//        stemp = "(���һ�ܵ�¼)";
//    }
//    if(lltime.equals("2"))
//    {
//        lday = 45;
//        stemp = "(���һ�µ�¼)";
//    }
//    if(lltime.equals("3"))
//    {
//        lday = 120;
//        stemp = "(������µ�¼)";
//    }
//    if(lltime.equals("4"))
//    {
//        lday = 540;
//        stemp = "(���һ���¼)";
//    }
//    if(lday > 0){
//        sql = sql + " and o.lasttime > sysdate-"+lday;
//    }


//    if(sex.length() > 1 && sex.equals("11") || address.equals("�Ϻ�") || address.equals("�㶫") || address.equals("���")){
//      //  sql = sql+" order by o.img desc,o.flag desc,o.lasttime desc";
//        sql = sql+" order by o.regtime5 desc";
//    }else{
//       // sql = sql+" order by o.img desc,o.lasttime desc";
//
//    }

    sql = sql+" order by o.regtime5 desc";

    System.out.println("--"+sql);
    QueryResult qr = null;

    long start = System.currentTimeMillis();
    if(tcount > 0)
        qr = QueryRecord.queryByHbm(sql,pagesize,cpage,true,tcount);
    else
        qr = QueryRecord.queryByHbm(sql, pagesize, cpage);
    int totalPage = qr.pageCount;
    int totalCount = qr.rowCount;
    cpage = qr.pageNum;
    int prepage = cpage-1;
    int nextpage = cpage+1;
    long step = System.currentTimeMillis()-start;

    System.out.println("time="+step/1000);
   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��</title>
    <meta name="description" content="51��������--�й���������ཻ����վ����Ա�鲼��������,�㶫����,�Ϻ�����,���ս��ѵ�ȫ������ʡ�С�51���������Ƚ�רҵ����ݳ�ֵ,�ѻ���1000������н��ѻ�Ա��" />
    <meta http-equiv=��Cache-Control�� content=��no-transform�� />
    <meta http-equiv=��Cache-Control�� content=��no-siteapp�� />
    <meta name="keywords" content="51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js/jquery.js"></script>
</head>
<body class="cm_search">
<%@ include file="head.jsp"%>
<div class="wrapper1250 cm_block01">
    <div class="lm_name">
        <h2>�������</h2>
    </div>
    <div class="block01">
        <div class="jieguo">
            <strong>��Ҫ�ҵ��ǣ�</strong>
            <p>
                <%
                    if("10".equals(sex)){
                       out.print("��");
                    }
                    if("11".equals(sex)){
                        out.print("Ů");
                    }
                %>

                <%
                    if("1".equals(jyyx)){
                        out.print("������");
                    }
                    if("2".equals(jyyx)){
                        out.print("���ܹ�ϵ");
                    }
                    if("3".equals(jyyx)){
                        out.print("�� ��");
                    }
                    if("4".equals(jyyx)){
                        out.print("���");
                    }
                    if("5".equals(jyyx)){
                        out.print("����");
                    }
                %>


                <%
                    if(agestart>0 && ageend>0 && agestart!=16 && ageend!=70){
                        out.print("����" +agestart+" ~ " + ageend);
                    }

                %>

                <%
                    if("1".equals(himg)){
                        out.print("����Ƭ");
                    }
                    if("2".equals(himg)){
                        out.print("����Ƭ");
                    }
                %>

                <%
                       if("10".equals(hyzk)){
                            out.print("δ��");
                        }
                            if("11".equals(hyzk)){
                                out.print("�ѻ�");
                            }
                            if("12".equals(hyzk)){
                                out.print("����");
                            }
                 %>
                <%
                    if("10".equals(fs)){
                        out.print("���");
                    }
                    if("11".equals(fs)){
                        out.print("һ��");
                    }
                    if("12".equals(fs)){
                        out.print("ƫ��");
                    }
                %>


                <%

                            if("10".equals(sg)){
                                out.print("145cm����");
                            }
                            if("11".equals(sg)){
                                out.print("145-150cm");
                            }
                            if("12".equals(sg)){
                                out.print("150-155cm");
                            }
                            if("13".equals(sg)){
                                out.print("155-160cm");
                            }
                            if("14".equals(sg)){
                                out.print("160-165cm");
                            }
                            if("15".equals(sg)){
                                out.print("165-170cm");
                            }
                            if("16".equals(sg)){
                                out.print("170-175cm");
                            }
                            if("17".equals(sg)){
                                out.print("175-180cm");
                            }
                            if("18".equals(sg)){
                                out.print("180-185cm");
                            }
                            if("19".equals(sg)){
                                out.print("185cm����");
                            }
                        %>


                    <%
                    if("12".equals(tz)){
                        out.print("90������");
                    }
                    if("13".equals(tz)){
                        out.print("90-100��");
                    }
                    if("14".equals(tz)){
                        out.print("100-110��");
                    }
                    if("15".equals(tz)){
                        out.print("110-120��");
                    }
                    if("16".equals(tz)){
                        out.print("120-130��");
                    }
                    if("17".equals(tz)){
                        out.print("130-140");
                    }
                    if("18".equals(tz)){
                        out.print("140-150��");
                    }
                    if("19".equals(tz)){
                        out.print("150-160��");
                    }
                    %>

                <%
                    out.print(address);
                %>
                <%
                    out.print(s2);
                %>
                <%
                    if("12".equals(whcd)){
                        out.print("����/��ר������");
                    }
                    if("13".equals(whcd)){
                        out.print("��ѧ/��ר");
                    }
                    if("14".equals(whcd)){
                        out.print("˶ʿ�о���");
                    }
                    if("15".equals(whcd)){
                        out.print("��ʿ�о���������");
                    }
                %>
                <%
                    if("10".equals(zy)){
                        out.print("ר�Ҽ�����Ա");
                    }
                    if("11".equals(zy)){
                        out.print("��������ҵ������");
                    }
                    if("12".equals(zy)){
                        out.print("������Ա");
                    }
                    if("13".equals(zy)){
                        out.print("���۷���ҵ");
                    }
                    if("14".equals(zy)){
                        out.print("ũ������ˮ��ҵ");
                    }
                    if("15".equals(zy)){
                        out.print("��������ҵ");
                    }
                    if("16".equals(zy)){
                        out.print("����");
                    }
                    if("17".equals(zy)){
                        out.print("����");
                    }
                %>
                <%
                    if("10".equals(user_income)){
                        out.print("������:2��Ԫ����");
                    }
                    if("11".equals(user_income)){
                        out.print("������:2-5��Ԫ");
                    }
                    if("12".equals(user_income)){
                        out.print("������:5-10��Ԫ");
                    }
                    if("13".equals(user_income)){
                        out.print("������:10-100��Ԫ");
                    }
                    if("14".equals(user_income)){
                        out.print("������:100��Ԫ����");
                    }

                %>
                <%
                    if("10".equals(zf)){
                        out.print("����ס��");
                    }
                    if("11".equals(zf)){
                        out.print("ͬ��ĸ��ס");
                    }
                    if("12".equals(zf)){
                        out.print("�����ⷿ");
                    }
                %>

                <%
                    if("10".equals(sx)){
                        out.print("A��");
                    }
                    if("11".equals(sx)){
                        out.print("B��");
                    }
                    if("12".equals(sx)){
                        out.print("AB��");
                    }
                    if("13".equals(sx)){
                        out.print("O��");
                    }
                %>
                <%
                    if("10".equals(xz)){
                        out.print("������");
                    }
                    if("11".equals(xz)){
                        out.print("˫����");
                    }
                    if("12".equals(xz)){
                        out.print("��ţ��");
                    }
                    if("13".equals(xz)){
                        out.print("��з��");
                    }
                    if("14".equals(xz)){
                        out.print("ʨ����");
                    }
                    if("15".equals(xz)){
                        out.print("��Ů��");
                    }
                    if("16".equals(xz)){
                        out.print("�����");
                    }
                    if("17".equals(xz)){
                        out.print("��Ы��");
                    }
                    if("18".equals(xz)){
                        out.print("������");
                    }
                    if("19".equals(xz)){
                        out.print("ħ����");
                    }
                    if("20".equals(xz)){
                        out.print("˫����");
                    }
                    if("21".equals(xz)){
                        out.print("ˮƿ��");
                    }
                %>
          </p>
            <div style="clear:both"></div>
        </div>
        <div class="tab_name">
			<!--modified by gjh 20151205 for ���ؽ��������������֤��δ��֤��Ա  start-->
			<span  id="searchTab0" class="current">�������</span>
            <!-- <span  id="searchTab0" class="current" onClick="selectTag('searchTab0','1')">����֤��Ա</span>
            <span  id="searchTab1" onClick="selectTag('searchTab1','0')">δ��֤��Ա</span> -->
            <!--modified by gjh 20151205 for ���ؽ��������������֤��δ��֤��Ա  end-->

        </div>
        <div style="clear:both"></div>
        <ul class="show_ul">
                <%
			 int j = 0;
for(j=0;j < qr.resultList.size();j++)
{
   boolean isvery = false;
   Userinfo temp = (Userinfo)qr.resultList.get(j);
   Date cdate11 =  DateTools.stringToDate("2010-08-27");

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
  String vhyzk = DicList.getDicValue(SysDefine.DIC_HYZH, temp.getHyzk(), 1);
  %>
            <li>
                <span class="tx">

                    <%
                        if(userother != null && userother.getUserphoto1() != null && userother.getUserphoto1().length() > 0)
                        {

                    %>
                   <a href="perinfo-id-<%=temp.getHyid()%>.htm" target="_blank" class="new_link06"><img src="../<%=afilepathsmall+File.separator+userother.getUserphoto1() %>" width="90" height="120" /></a>
                       <%
                       }else
                       {
                       %>
                          <a href="perinfo-id-<%=temp.getHyid()%>.htm" target="_blank" class="new_link06"><img src="images/nopic2.gif" width="90" height="120" border="0"></a>
                       <%
                           }
                       %>
                </span>
                <a href="perinfo-id-<%=temp.getHyid()%>.htm" target="_blank" class="name"><%=temp.getLcname()%></a><span class="yyz"><%if(isvery) {%>����֤<%}%></span><br />
                <%=temp.getSex().equals("11") ? "Ů" : "��" %>, <%= age %>��,<%=vs1 %>
                <%
                    String ly="";
                    if(userother != null && userother.getJyly() != null && userother.getJyly().length()>50){
                        ly = userother.getJyly().substring(0,50);
                    }else if(userother != null && userother.getJyly() != null && userother.getJyly().length()>0 &&userother.getJyly().length()<=50 ){
                        ly = userother.getJyly();
                    }else{
                        ly = "";
                    }
                     if(ly!=null && !"".equals(ly)){
                         if(ly.length()>45){
                             ly =ly.substring(0,45)+"...";
                         }
                     }

                %>
                <p class="txt02"> <strong>�������ԣ�</strong><%=ly%></p>
            </li>
            <%
                }
            %>
        </ul>
        <div style="clear:both"></div>
        <div class="Paging">
            <%
                if(cpage == 1)
                    out.println("<a href='###'>��    ҳ</a><a href='###'>��һҳ</a>");
                else
                {
                    out.println("<a href='javascript:turn(1)'>��    ҳ</a>");
                    out.println("<a href='javascript:turn("+prepage+")'>��һҳ</a>");
                }
                int startpage = 0;
                int endpage = 12;
                if(cpage>=12){
                    startpage = cpage-5;
                    endpage =(cpage+7)>totalPage?totalPage:(cpage+7);
                }
                 if(totalPage<12){
                     endpage =totalPage;
                 }
                for(int i=startpage;i<endpage;i++){
                    if((i+1)==Integer.parseInt(cpages)){
                        out.println("<a href='javascript:turn("+(i+1)+")' class='Check'>"+(i+1)+"</a>");
                    }else{
                        out.println("<a href='javascript:turn("+(i+1)+")'>"+(i+1)+"</a>");
                    }

                }

                if(cpage >= totalPage ){
//                    out.println("<a href='###'>��һҳ</a><a href='###'>βҳ</a>");
                }

                else
                {
                    out.println("<a href='javascript:turn("+nextpage+")'>��һҳ</a>");
//                    out.println("<a href='javascript:turn("+totalPage+")'>βҳ</a>");
                }
            %>
            <%--<a>����:<%=totalCount%>λ</a>--%>
            <div style="clear:both;"></div>
        </div>
    </div>
    <div class="block02">
        <div class="lm_name02">
            <h2>��ͨ��Ա����</h2>
        </div>
        <div class="erweima"><img src="images/weixin_erweima.jpg" alt="" width="120" height="120"/><br/>΢�Ź��ںţ��ƶ�վ��</div>
        <div class="erweima"><img src="images/kf_img.jpg" alt="" width="120"  /><br/>�ͷ��绰</div>
        <div style="clear:both"></div>
    </div></div>
<div style="clear:both"></div>
<form id="advsearch" action="searchjg02.jsp" target="_self">
    <input type="hidden" value="<%=isvcation%>" name="isvcation" id="isvcation">
    <input type="hidden" value="<%=sex%>" name="sex">
    <input type="hidden" value="<%=address%>" name="s1">
    <input type="hidden" value="<%=s2%>" name="s2">
    <input type="hidden" value="<%=jyyx%>" name="jyyx">
    <input type="hidden" value="<%=yx%>" name="yx">
    <input type="hidden" value="<%=hyzk%>" name="hyzk">
    <input type="hidden" value="<%=sx%>" name="sx">
    <input type="hidden" value="<%=xz%>" name="xz">
    <input type="hidden" value="<%=xz%>" name="xz">
    <input type="hidden" value="<%=sg%>" name="sg">
    <input type="hidden" value="<%=tz%>" name="tz">
    <input type="hidden" value="<%=fs%>" name="fs">
    <input type="hidden" value="<%=whcd%>" name="whcd">
    <input type="hidden" value="<%=zf%>" name="zf">
    <input type="hidden" value="<%=agestart%>" name="agestart">
    <input type="hidden" value="<%=ageend%>" name="ageend">
    <input type="hidden" value="<%=himg%>" name="himg">
    <input type="hidden" value="<%=zy%>" name="zy">
    <input type="hidden" value="<%=user_income%>" name="user_income">
    <input type="hidden" value="<%=cpages%>" name="cpages">

 </form>
<%@ include file="bottom.jsp"%>
<iframe name="searchframe" frameborder="0"></iframe>
   <iframe id="useBjdframe" name="useBjdframe" frameborder="0" width="0" height="0"></iframe>
</body>
 <script>
function selectTag(a,b){
// ������ǩ
for(i=0; i<2; i++){
var tag = document.getElementById("searchTab"+i);
tag.className = "";
}
 document.getElementById(a).className = "current";
    advsearch.isvcation.value = b;
 document.getElementById("advsearch").submit();
}

function turn(a){
    advsearch.cpages.value = a;
    document.getElementById("advsearch").submit();
}

function useBjdToSee(userid) {
		var isvery = "0";
	<%
     if("1".equals(isvcation)){
     %>
     		isvery="true";
     <%
     }
     %>
	 	document.getElementById("useBjdframe").src = "perinfoUseBjd.jsp?isvery="+isvery+"&userid="+userid;
	}


     <%
     if("0".equals(isvcation)){
     %>
        for(i=0; i<2; i++){
            var tag = document.getElementById("searchTab"+i);
            tag.className = "";
        }
        document.getElementById("searchTab1").className = "current";
     <%
     }
     %>

</script>
</html>
