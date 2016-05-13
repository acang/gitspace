<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<%@ page import="hibernate.db.HbmOperator" %>
<%@ page import="com.web.bean.QueryResult" %>
<%@ page import="com.web.bean.QueryRecord" %>
<%@ page import="com.web.common.DateTools" %>
<%@ page import="com.web.obj.extend.DicList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.web.obj.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.lover.LoverTools" %>
<%@ page import="org.apache.commons.beanutils.DynaBean" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.File" %>
<%@ page import="com.lover.mng.*" %>
<%
    Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
    String userid = SysCommonFunc.getStrParameter(request,"id");
    String type = SysCommonFunc.getStrParameter(request, "type");
    String isAddFavorite =  (String)session.getAttribute("isAddFavorite");
    if(type==null || "".equals(type)){
        type = "0";
    }
    Boolean issend = false;
    boolean isvery = false;

    
    if(SysCommonFunc.getNumberFromString(userid,0)==0)
    {
        out.println("<script language='javascript'>alert('会员信息不存在！');window.close();</script>");
        return;
    }

    if (loginUser!=null){
        String vurl="";
        vurl=request.getRequestURL().toString();
        if (request.getQueryString()!=null){
            vurl += "?" + request.getQueryString()+"&type="+type;
        }
        UserVisitMng.insertUserVisit(loginUser.getHyid(), vurl);
        
    }

    String qid = SysCommonFunc.getStrParameter(request,"qid");
    if(SysCommonFunc.getNumberFromString(qid,0)>0)
    {
        HbmOperator.executeSql("update db_qiubo set isread='1' where id = " + qid);
    }

	Userinfo hyInfo = HYRegMng.getUserinfoByHyid(userid);

    if(hyInfo == null)
    {
        out.println("<script language='javascript'>alert('会员信息不存在！');window.close();</script>");
        return;
    }
    //zxl add 普通登录也可热度
    //if(loginUser!=null){
    	
    	Integer upBody =null;
    	int fenmu=8;
    	if("11".equals( hyInfo.getSex())){
    		upBody = (Integer)session.getAttribute("SESSION_WOMAN_NUMBER");
    	}else{
    		fenmu=3;
    		upBody = (Integer)session.getAttribute("SESSION_MAN_NUMBER");
    	}
    	if(upBody==null || upBody<1){
    		upBody=1;
    	}else{
    		upBody++;
    	}
    	if(upBody%fenmu==2){
    		Date cdate = new Date(System.currentTimeMillis());
            hyInfo.setRegtime5(cdate);
            try
            {
                HbmOperator.update(hyInfo);
            }
            catch (Exception e)
            {
                System.out.println(e.getMessage());
            }
    	}
    	
    	if("11".equals( hyInfo.getSex())){
    		session.setAttribute("SESSION_WOMAN_NUMBER",upBody);
    	}else{
    		session.setAttribute("SESSION_MAN_NUMBER",upBody);
    	}
    //}
    
    
    Userother uother = HYRegMng.getUserOtherByHyid(userid);
    String ask = hyInfo.getAsk();
    boolean isPhoneUser = false;
    if(uother!=null ){
    	String tempQggx = uother.getQggx();
    	String tempLxqr = uother.getLxqr();
    	String tempJyly = uother.getJyly();
    	
    	if((tempQggx!=null &&tempQggx.trim().length()>0)||(tempLxqr!=null &&tempLxqr.trim().length()>0)
    			||(tempJyly!=null &&tempJyly.trim().length()>0) || (ask!=null &&ask.trim().length()>0)){
    		isPhoneUser = true;
    	}
    }else{
    	if((ask!=null &&ask.trim().length()>0)){
    		isPhoneUser = true;
    	}
    }

    if(!isPhoneUser){
    	out.println("<script language='javascript'>alert('该会员为手机站简易注册会员，无法查看资料！');window.close();</script>");
   		 return;
    }
    Date cdate =  DateTools.stringToDate("2010-08-27");

    //modify by gaojianhong 20120820 for 新增ISVCATION是否验证字段 start
    //if((hyInfo.getUsername().equals(hyInfo.getEmail()) || hyInfo.getUsername().equals(hyInfo.getSjtel()))&&hyInfo.getRegtime().after(cdate))
    if(hyInfo.getIsvcation()==1){
        isvery = true;
    }
    
    //add BJD 白金豆功能 by linyu 20151126 start
   long needbjd = 1l;
    if(isvery)
    {
        needbjd = 2l; 
    }
//System.out.println("needbjd：：：：：："+needbjd);
//白金豆是否查看该会员了
boolean isMayView=false;   
 //登录会员的白金豆数
 long bjd = 0l;
 if(loginUser !=null){
List listtemp = QueryRecord.queryByDynaResultSet("select * from user_bjd_viewrecord where hyid="+loginUser.getHyid()+" and viewhyid="+userid + "order by id asc",1,1).resultList;
if(listtemp != null && listtemp.size() > 0)
{

   DynaBean db = (DynaBean)listtemp.get(0);
   Date vdate = (Date)db.get("viewdate");
   Date ccdate = new Date(System.currentTimeMillis());

  if((ccdate.getTime()-vdate.getTime()) > 48*60*60*1000)
     isMayView = false;
   else
     isMayView = true;
}
//System.out.println("isMayView：：：：：："+isMayView);
   List listbjd = HbmOperator.list("from UserBjd as o where o.hyid="+loginUser.getHyid());
    if(listbjd != null && listbjd.size() > 0)
    {
        UserBjd ub = (UserBjd)listbjd.get(0);
        bjd = ub.getBjdnumber();
    }
  }
 //System.out.println("bjd：：：：：："+bjd);
   //add BJD 白金豆功能 by linyu 20151126 end
    
    HashSet<Integer> hs1 = new HashSet<Integer>();
    Random r1 = new Random();
    hs1.add(r1.nextInt(20));
    Iterator<Integer> i1 = hs1.iterator();

///设置用户的人气指数
    Long stime=System.currentTimeMillis();
    if (session.getAttribute("viewuser")!=null && !session.getAttribute("viewuser").equals("")){
        stime=Long.parseLong(session.getAttribute("viewuser").toString());
    }else{
        session.setAttribute("viewuser",stime);
    }
    if ((System.currentTimeMillis()-stime)>10000){
        session.setAttribute("viewuser",System.currentTimeMillis());
        String sqlstr = "update userinfo set hots = hots + "+i1.next()+" where hyid="+userid;
        HbmOperator.executeSql(sqlstr);
    }



    
    Userinfo ui = null;
    List loginList = HbmOperator
            .list("from Userinfo as o where o.hyid=" + uother.getHyid());
    long datetime2010 = 0;
    boolean last_login_is_2010 = false;
    if(loginList !=null && loginList.size()>0){
        ui  = (Userinfo) loginList.get(0);
    }


    String jyyx = "";
    String jyzt ="";
    if(hyInfo.getSetzt().intValue() == SysDefine.SYSTEM_HYSET_HYZT_WAIT)
        jyzt = "等待中";
    else if(hyInfo.getSetzt().intValue() == SysDefine.SYSTEM_HYSET_HYZT_NOT_WAIT)
        jyzt = "暂勿打扰";
    String jyyx01 = "00000000";
    if(hyInfo.getJyyx() != null && hyInfo.getJyyx().toString().length() ==6)
        jyyx01 = hyInfo.getJyyx().toString();

    for(int i=0;i < 5;i ++)
    {
        if(jyyx01.charAt(i+1) == '1')
            jyyx = jyyx + SysDefine.jyyxArray[i]+"&nbsp;&nbsp;";
    }


    String sex = DicList.getDicValue(SysDefine.DIC_SEX,hyInfo.getSex(),1);
    String hyzk = DicList.getDicValue(SysDefine.DIC_HYZH,hyInfo.getHyzk(),1);
    String zz   = (hyInfo.getS1() == null? "":hyInfo.getS1()) + (hyInfo.getS2()==null ? "":hyInfo.getS2());
    if(zz.equals("北京北京"))
        zz = "北京";
    if(zz.equals("上海上海"))
        zz = "上海";
    if(zz.equals("天津天津"))
        zz = "天津";
    if(zz.equals("重庆重庆"))
        zz = "重庆";
    if(zz.equals("香港香港"))
        zz = "香港";
    if(zz.equals("澳门澳门"))
        zz = "澳门";
    String age = "未知";

    if(hyInfo.getCsdate() != null)
    {
        Date date = new Date(System.currentTimeMillis());

        age=(date.getYear()-hyInfo.getCsdate().getYear())+"岁";
    }
    Date datea = new Date(System.currentTimeMillis());

    int time = 0;
    int yy=0;
    time = datea.getMonth()-hyInfo.getRegtime().getMonth();
    yy = datea.getYear()-hyInfo.getRegtime().getYear();
    String whcd = DicList.getDicValue(SysDefine.DIC_WHCD,hyInfo.getWhcd(),1);
    String yx = DicList.getDicValue(SysDefine.DIC_YX,hyInfo.getYx(),1);
    String zf = DicList.getDicValue(SysDefine.DIC_ZF,hyInfo.getZf(),1);
    String sg = DicList.getDicValue(SysDefine.DIC_SG,hyInfo.getSg(),1);
    String tz = DicList.getDicValue(SysDefine.DIC_TZ,hyInfo.getTz(),1);
    String fs = DicList.getDicValue(SysDefine.DIC_FS,hyInfo.getFs(),1);
    String xz = DicList.getDicValue(SysDefine.DIC_XZ, hyInfo.getXz(), 1);
    String xx = DicList.getDicValue(SysDefine.DIC_XX,hyInfo.getSx(),1);
    String zy = hyInfo.getZy() == null ? "没有分类":DicList.getDicValue(SysDefine.DIC_ZY,hyInfo.getZy(),1);
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String xgtz = "";
    String xgtz01= "000000000000000";
    if(hyInfo.getXgtz() != null && hyInfo.getXgtz().length() ==15)
        xgtz01 = hyInfo.getXgtz();
    for(int i=0;i < xgtz01.length();i ++)
    {
        if(xgtz01.charAt(i) == '1')
            xgtz = xgtz + SysDefine.xgtzArray[i]+"&nbsp;&nbsp;";
    }

     String yyap = "";
    String yyap01= "00000000000";
    if(hyInfo.getYyap() != null && hyInfo.getYyap().length() ==11)
        yyap01 = hyInfo.getYyap();
    for(int i=0;i < yyap01.length();i ++)
    {
        if(yyap01.charAt(i) == '1')
            yyap = yyap + SysDefine.yyapArray[i]+"&nbsp;&nbsp;";
    }
    String afilepath = SysCommonFunc.getPhotoView();
    String afilepathsmall = SysCommonFunc.getPhotoSmallView();
    String cpages = SysCommonFunc.getStrParameter(request,"cpages");
    int cpage = SysCommonFunc.getNumberFromString(cpages,1);
    String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
    int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);
    int pagesize = 10;
    String wjfy = SysCommonFunc.getStrParameter(request,"wjfy");
    QueryResult qr = null;
    String sql = "select '1' as wtype,id,title,contentid from userarticle where hyid = " + hyInfo.getHyid() + " and title not like '%script%' and title not like '%iframe%' and title not like '%onload%' and title not like '%url%' and title not like '%src%' and title not like '%href%' and title not like '%load%' and title not like '%frame%' " +
            " union  " +
            "select '2' as wtype,id,title,content as contentid from bbs where user_id = " +hyInfo.getHyid()+ " and re_id=0 and ischeck = '1' order by wtype asc, id desc";
    qr = QueryRecord.queryByDynaResultSet(sql, pagesize, cpage);
    int totalPage =0;
    int totalCount =0;
    if(qr!=null){
         totalPage = qr.pageCount;
         totalCount = qr.rowCount;
    }

    cpage = qr.pageNum;
    int prepage = cpage-1;
    int nextpage = cpage+1;
    List alist = qr.resultList;
    
%>

<%
    if(null != loginUser ){
        List viewList = HbmOperator.list("from Viewme as v where v.myId = '"+loginUser.getHyid()+"' and v.viewId ='"+hyInfo.getHyid()+"' ");

        List mvList = HbmOperator.list("from Meview as v where v.myId = '" + loginUser.getHyid() + "' and v.viewId ='" + hyInfo.getHyid() + "' ");
        Date viewtime = new Date(System.currentTimeMillis());
        Viewme viewme = null;
        Viewme view = null;

        Meview mv = null;
        Meview mvUp = null;
        if(viewList!=null && viewList.size()>0){
            view = (Viewme)viewList.get(0);
        }
        if(mvList!=null && mvList.size()>0)
            mvUp = (Meview)mvList.get(0);

        if(viewList.size()==0){

            viewme = new Viewme();
            viewme.setId(SysCommonFunc
                    .getSequenceIdForOracle("seq_viewme_id"));
            viewme.setMyId(loginUser.getHyid());
            viewme.setMyLcname(loginUser.getLcname());
            viewme.setViewId(hyInfo.getHyid());
            viewme.setViewLcname(hyInfo.getLcname());
            viewme.setViewTime(viewtime);
        }
        else
        {
            view.setViewTime(new Date(System.currentTimeMillis()));
        }


        if(mvList==null || mvList.size()==0){
            mv = new Meview();

            mv.setId(SysCommonFunc
                    .getSequenceIdForOracle("seq_viewme_id"));
            mv.setMyId(loginUser.getHyid());
            mv.setMyLcname(loginUser.getLcname());
            mv.setViewId(hyInfo.getHyid());
            mv.setViewLcname(hyInfo.getLcname());
            mv.setViewTime(viewtime);
        }
        else
        {

            mvUp.setViewTime(new Date(System.currentTimeMillis()));
        }
        try
        {
            if (viewList == null || viewList.size() == 0)
            {
                HbmOperator.insert(viewme);
            }
            else
            {
                HbmOperator.update(view);
            }
            if (mvList == null || mvList.size() == 0)
            {
                HbmOperator.insert(mv);
            }
            else
            {
                HbmOperator.update(mvUp);
            }

        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
        }
    }

//发送信息
/**  取消重复看短信发送功能 update by linyu 20151025
    if (loginUser!=null && loginUser.getHyid()!=hyInfo.getHyid()){
        int fsfs=2; // 0:手机  1：邮箱 2：不发送
        //女会员查看男会员才发
        if ("11".equals(loginUser.getSex()) && "10".equals(hyInfo.getSex())){
            UserReceiveSet userReceiveSet=new UserReceiveSet();
            List templist=new ArrayList();
            templist = HbmOperator.list("from UserReceiveSet as o where o.hyid="+hyInfo.getHyid());
            //判断会员个人信息设置
            if(templist != null && templist.size() ==1){
                userReceiveSet=(UserReceiveSet)templist.get(0);
                if (userReceiveSet.getReceiveyesno()==0){
                    if (userReceiveSet.getReceivetype()==0){
                        //判断手机号码
                        if (hyInfo.getSjtel()!=null && !hyInfo.getSjtel().equals("") && LoverTools.isMobileNO(hyInfo.getSjtel())){
                            fsfs=0;
                        }else if (hyInfo.getEmail()!=null && !hyInfo.getEmail().equals("") && LoverTools.isEmail(hyInfo.getEmail())){  //判断邮箱
                            fsfs=1;
                        }
                    }else if (userReceiveSet.getReceivetype()==1){
                        if (hyInfo.getSjtel()!=null && !hyInfo.getSjtel().equals("") && LoverTools.isMobileNO(hyInfo.getSjtel())){
                            fsfs=0;
                        }
                    }else if (userReceiveSet.getReceivetype()==2){
                        if (hyInfo.getEmail()!=null && !hyInfo.getEmail().equals("") && LoverTools.isEmail(hyInfo.getEmail())){  //判断邮箱
                            fsfs=1;
                        }
                    }
                }
            }else{
                //判断手机号码
                if (hyInfo.getSjtel()!=null && !hyInfo.getSjtel().equals("") && LoverTools.isMobileNO(hyInfo.getSjtel())){
                    fsfs=0;
                }else if (hyInfo.getEmail()!=null && !hyInfo.getEmail().equals("") && LoverTools.isEmail(hyInfo.getEmail())){  //判断邮箱
                    fsfs=1;
                }else{
                    fsfs=2;
                }
            }

            if (fsfs!=2){
                String contentString="@1@您好！@2@正在反复查看您的资料，看看她是否合意吧！http://www.51lover.org  51交友中心网站";
                StringBuilder content=new StringBuilder();
                content.append("@1@="+hyInfo.getLcname());
                contentString=contentString.replace("@1@", hyInfo.getLcname());
                content.append(",@2@="+loginUser.getLcname());
                contentString=contentString.replace("@2@", loginUser.getLcname());
                UserInfoSendReply userInfoSendReply=new UserInfoSendReply();
                userInfoSendReply.setHyid(hyInfo.getHyid());
                userInfoSendReply.setUsername(hyInfo.getUsername());
                userInfoSendReply.setContent(contentString);
                userInfoSendReply.setHdate(new Date(System.currentTimeMillis()));
                userInfoSendReply.setSendorreply(0);
                userInfoSendReply.setSender(loginUser.getUsername());
                userInfoSendReply.setSendtype(0);

                if (fsfs==0){
                    //间隔5秒发送一次
                    List list=QueryRecord.query("select count(1) as totalcount from USERINFO_SEND_REPLY u where u.SENDORREPLY=0 and u.MOBILEOREMAIL=0 and u.SENDTYPE=0 and u.STATUS=0 and u.SENDER='"+loginUser.getUsername()+"' and u.content like '%资料%' and u.HDATE>=sysdate - 12/24/60/60");
                    Boolean blfs=true;
                    if (list!=null && list.size()==1){
                        DynaBean dbt =(DynaBean)list.get(0);
                        if (Integer.parseInt(dbt.get("totalcount").toString())>0){
                            blfs=false;
                        }
                    }
                    if (blfs){
                        userInfoSendReply.setMobileoremail(0);
                        userInfoSendReply.setMobileoremailc(hyInfo.getSjtel());
                        userInfoSendReply.setStatus(1);
                     //   Long id= UserInfoSendReplyMng.insertUserInfoSendReply(userInfoSendReply);
                        //发送手机短信
                      //  String result= SMSTools.sendMobileMb(hyInfo.getSjtel(), content.toString(), "MB-2015013106");
                        UserInfoSendReply newuserInfoSendReply=new UserInfoSendReply();
                     //   newuserInfoSendReply=UserInfoSendReplyMng.getUserInfoSendReply(id);
                      //  if (newuserInfoSendReply!=null){
//                            if (result.indexOf("#")<=0){
//                                newuserInfoSendReply.setStatus(Integer.parseInt(result));
//
//                            }else{
//                                newuserInfoSendReply.setStatus(0);
//                            }
                      //      HbmOperator.update(newuserInfoSendReply);
                 //       }
                    }
                }else{
                    //24小时对同一个会员只发送一次
                    //List list=QueryRecord.query("select count(1) as totalcount from USERINFO_SEND_REPLY u where u.SENDORREPLY=0 and u.MOBILEOREMAIL=1 and u.SENDTYPE=0 and u.STATUS=0 and u.HYID="+hyInfo.getHyid()+" and u.SENDER='"+loginUser.getUsername()+"' and u.content like '%资料%' and u.HDATE>=sysdate - 1");
                    Boolean blfs=true;
                    if (blfs){
                        userInfoSendReply.setMobileoremail(1);
                        userInfoSendReply.setMobileoremailc(hyInfo.getEmail());
                 //       UserInfoSendReplyMng.insertUserInfoSendReply(userInfoSendReply);
                        //发送邮件内容
                     //   MailTools.reMail2("51交友中心网站提示信息", userInfoSendReply.getContent(), hyInfo.getEmail());
                    }
                }
            }
        }
    }
    **/

%>

<%
     int photoNum = 0;
    if(uother != null && uother.getUserphoto1() != null && uother.getUserphoto1().length() > 0){
        photoNum +=1;
    }
    if(uother != null && uother.getUserphoto2() != null && uother.getUserphoto2().length() > 0){
        photoNum +=1;
    }
    if(uother != null && uother.getUserphoto3() != null && uother.getUserphoto3().length() > 0){
        photoNum +=1;
    }
    if(uother != null && uother.getUserphoto4() != null && uother.getUserphoto4().length() > 0){
        photoNum +=1;
    }
    if(uother != null && uother.getUserphoto5() != null && uother.getUserphoto5().length() > 0){
        photoNum +=1;
    }

    if(uother.getUserphoto1()!=null && !"".equals(uother.getUserphoto1())){
        try {
            ImageUtil.resizePhotoJpg2("E:\\web\\lover51\\upload\\hyimg\\"+uother.getUserphoto1(),"E:\\web\\lover51\\upload\\hyimgsmall\\"+uother.getUserphoto1(),190,230);
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }
    if(uother.getUserphoto2()!=null && !"".equals(uother.getUserphoto2())){
        try {
            ImageUtil.resizePhotoJpg2("E:\\web\\lover51\\upload\\hyimg\\"+uother.getUserphoto2(),"E:\\web\\lover51\\upload\\hyimgsmall\\"+uother.getUserphoto2(),190,230);
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }
    if(uother.getUserphoto3()!=null && !"".equals(uother.getUserphoto3())){
        try {
            ImageUtil.resizePhotoJpg2("E:\\web\\lover51\\upload\\hyimg\\"+uother.getUserphoto3(),"E:\\web\\lover51\\upload\\hyimgsmall\\"+uother.getUserphoto3(),190,230);
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }
    if(uother.getUserphoto4()!=null && !"".equals(uother.getUserphoto4())){
        try {
            ImageUtil.resizePhotoJpg2("E:\\web\\lover51\\upload\\hyimg\\"+uother.getUserphoto4(),"E:\\web\\lover51\\upload\\hyimgsmall\\"+uother.getUserphoto4(),190,230);
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }
    if(uother.getUserphoto5()!=null && !"".equals(uother.getUserphoto5())){
        try {
            ImageUtil.resizePhotoJpg2("E:\\web\\lover51\\upload\\hyimg\\"+uother.getUserphoto5(),"E:\\web\\lover51\\upload\\hyimgsmall\\"+uother.getUserphoto5(),190,230);
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }
    
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <title>51交友中心-亲密交友 浪漫交友 同城交友 终生伴侣 情商训练 婚恋训练</title>
    <meta name="description" content="51交友中心网站-中国交友行业领军品牌。亲密关系、终生伴侣、情商训练，全方位支持您的情感生活。十年运营，千万会员，美满感情，从51交友开始！" />
    <meta name="keywords" content="51交友中心-亲密交友 浪漫交友 同城交友 终生伴侣 情商训练 婚恋训练" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/lcmbase.js"></script>
    <script>

    function selectTagPer(showContent,selfObj,a){
    // 操作标签
        var tag = document.getElementsByName("tags1");
        var taglength = tag.length;
    for(var i=0; i<taglength; i++){
        tag[i].className = "";
     }
    selfObj.className = "current";
    // 操作内容
    for(var i=0; i<4; i++){
    j=document.getElementById("pertagContent"+i);
    j.style.display = "none";
    }
    document.getElementById(showContent).style.display = "block";
    	if(showContent == "pertagContent1"){
    	<%
    		if(isAddFavorite!=null && "1".equals(isAddFavorite)){
    	%>
    	<%
    		}else{
    	%>
    		addFavorite2();
    		<%
    		} 
    	%>
    	}
        viewLargePic("1");
        document.getElementById("type").value=a;
        parent.visitFrame.location.href="visitForPerinfo_type.jsp?userid="+<%=userid%>+"&type="+a;
       // document.getElementById("visitform").submit();
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
    var isAdd=0;
	function addFavorite2() {
	if(isAdd == 0){
	
		var url = window.location;
	    var title = document.title;
	    var ua = navigator.userAgent.toLowerCase();
	    if (ua.indexOf("360se") > -1) {
	        alert("请将51交友中心网站加入您的收藏夹！（Ctrl+D键自动收藏）");
	    }else if (ua.indexOf("msie 8") > -1) {
	        window.external.AddToFavoritesBar(url, title); //IE8
	    }else if (document.all) {
			try{
		   		window.external.addFavorite(url, title);
		  	}catch(e){
		   		alert('请将51交友中心网站加入您的收藏夹！（Ctrl+D键自动收藏）');
		  	}
	    }else if (window.sidebar) {
	        window.sidebar.addPanel(title, url, "");
	    }else {
	  		alert('请将51交友中心网站加入您的收藏夹！（Ctrl+D键自动收藏）');
	    }
	    isAdd=1;
	    addFavoriteform.submit();
	    
	    }
	}
	
	function useBjdToSee() {
	 	document.getElementById("useBjdframe").src = "perinfoUseBjd.jsp?isInfo=1&isvery="+<%=isvery%>+"&userid="+<%=userid%>;
	}

    </script>
</head>
<form id="visitform" action="perinfo.jsp" >
        <input type="hidden" name="type" id="type" value=""/>
    <input type="hidden" name="id"  value="<%=userid%>"/>
</form>
<iframe id="visitFrame" name="visitFrame" width="0" height="0" frameborder="0" src="visitForPerinfo_type.jsp?userid=<%=userid%>&type=0" ></iframe>
<body class="cm_grxx">
<%@ include file="head.jsp"%>
<div class="wrapper1250 cm_block01">
    <div class="block01">
        <div class="box01">
            <div class="lm_name" id="personTab">
                <h2 name="tags1" class="current" id="wjtab0" onClick="selectTagPer('pertagContent0',this,0)" onmouseover="changeClass(this)" onmouseout="recoverClass(this)"><a style="cursor:hand">基本资料</a></h2>
                <h2 name="tags1"  id="wjtab1" onClick="selectTagPer('pertagContent1',this,1)" onmouseover="changeClass(this)" onmouseout="recoverClass(this)"><a style="cursor:hand">影　集 (<%=photoNum%>)</a></h2>
                <h2 name="tags1"  id="wjtab2" onClick="selectTagPer('pertagContent2',this,2)" onmouseover="changeClass(this)" onmouseout="recoverClass(this)"><a style="cursor:hand">文　集 (<%=totalCount%>)</a></h2>
               <%   
                   if(loginUser !=null && (flag==SysDefine.SYSTEM_HY_TYPE_nvip || flag==SysDefine.SYSTEM_HY_TYPE_vip ) && hyInfo.getSetzt() != null && hyInfo.getSetzt().intValue() == SysDefine.SYSTEM_HYSET_HYZT_NOT_WAIT){
               %>
                  <h2 name="tags1"   onClick="javascript:alert('该会员状态为暂勿打扰，请不要再联络！');" onmouseover="changeClass(this)" onmouseout="recoverClass(this)"><a style="cursor:hand">联系方式</a></h2>
                <%
                    }else if(loginUser !=null && (flag==SysDefine.SYSTEM_HY_TYPE_nvip || flag==SysDefine.SYSTEM_HY_TYPE_vip ) && hyInfo.getSetzt() != null && hyInfo.getSetzt().intValue() == SysDefine.SYSTEM_HYSET_HYZT_NOT_WAIT){
                %>
                  <h2 name="tags1"   onClick="javascript:alert('该会员已将您拉入黑名单，请不要再联络！');" onmouseover="changeClass(this)" onmouseout="recoverClass(this)"><a style="cursor:hand">联系方式</a></h2>
                <%
                    }else if(loginUser !=null && (flag==SysDefine.SYSTEM_HY_TYPE_vip ||  isMayView ) ){
                %>
                <h2  class="current" onClick="selectTagPer('pertagContent3',this)" onmouseover="changeClass(this)" onmouseout="recoverClass(this)"><a style="cursor:hand">联系方式</a></h2>
                
                <%
                    }
                else if(loginUser !=null && flag==SysDefine.SYSTEM_HY_TYPE_nvip && hyInfo.getIsvcation()==0){
                %>
                <h2  class="current" onClick="selectTagPer('pertagContent3',this)" onmouseover="changeClass(this)" onmouseout="recoverClass(this)"><a style="cursor:hand">联系方式</a></h2>
                
                
                <%
                	}else if(loginUser !=null && bjd >=  needbjd ){
                %>
                <h2  name="tags1"   id="wjtab3" onClick="useBjdToSee()" onmouseover="changeClass(this)" onmouseout="recoverClass(this)"><a style="cursor:hand">联系方式</a></h2>
                <%
                    }else if(loginUser ==null){   
                %>
                <h2  name="tags1"  onClick="javascript:alert('您是游客，请先登录或注册！');showLogin('perinfo.jsp?id=<%=userid%>','perinfo.jsp?id=<%=userid%>');" onmouseover="changeClass(this)" onmouseout="recoverClass(this)"><a style="cursor:hand">联系方式</a></h2>
                <%
                }
                else if(loginUser !=null && flag==SysDefine.SYSTEM_HY_TYPE_NOR){
               %>
                <h2  name="tags1"  onClick="javascript:alert('您是普通会员，请升级白金VIP会员或取得足够的白金豆！');window.open('hyzf.htm')" onmouseover="changeClass(this)" onmouseout="recoverClass(this)"><a style="cursor:hand">联系方式</a></h2>
              <!-- 
                <h2  name="tags1"  onClick="javascript:alert('您是普通会员，请升级为白金VIP会员！');window.open('hyzf.htm')" onmouseover="changeClass(this)" onmouseout="recoverClass(this)"><a style="cursor:hand">联系方式</a></h2>
               -->
			<!-- zxl add add vip and   -->
                <%
                }
				else if(loginUser !=null && flag==SysDefine.SYSTEM_HY_TYPE_nvip && hyInfo.getIsvcation()==1){
                %>
                <h2  name="tags1"  onClick="javascript:alert('您是VIP会员，请升级白金VIP会员或取得足够的白金豆！');window.open('hyzf.htm')" onmouseover="changeClass(this)" onmouseout="recoverClass(this)"><a style="cursor:hand">联系方式</a></h2>
               <%
                    }
                %>
            </div>
        </div>
        <div class="box02"> <span class="tx">
          <td bgcolor="#e7f0fa"><%
                    if(uother != null && uother.getUserphoto1() != null && uother.getUserphoto1().length() > 0
                    		&&new File("E:\\web\\lover51\\upload\\hyimg\\"+uother.getUserphoto1()).exists())
                    {
                %>
             <img src="../<%=afilepathsmall+File.separator+uother.getUserphoto1()%>" alt=""/>
                  <%
                        }else
                        {
                            out.println("<img src='images/nopic2.gif' width='121' height='140' border='0'>");
                        }
                    %>
        </span>
            <p class="zl"><strong><%=hyInfo.getLcname()==null?"":hyInfo.getLcname()%></strong><br />
                <%=hyInfo.getAddress()==null?"":hyInfo.getAddress()%></p>
            <%
                if(loginUser==null){
            %>
            <a href="javascript:alert('您是游客，请先登录或注册');showLogin('perinfo.jsp?id=<%=userid%>','perinfo.jsp?id=<%=userid%>');" class="asqb_btn"> 暗送秋波</a>
            <%
            }else{
            %>
            <a href="addqiubo.jsp?hyid=<%=hyInfo.getHyid()%>" target="perinfoframe" class="asqb_btn"> 暗送秋波</a>
            <%
                }
            %>


            <div class="btn">
                <%
                    if(loginUser==null){
                %>
                <a href="javascript:alert('您是游客，请先登录或注册');showLogin('perinfo.jsp?id=<%=userid%>','perinfo.jsp?id=<%=userid%>');" class="btn01"> 加TA为好友</a>
                <a href="javascript:alert('您是游客，请先登录或注册');showLogin('perinfo.jsp?id=<%=userid%>','perinfo.jsp?id=<%=userid%>');"class="btn02">加入黑名单</a>
                <%
                }else{
                %>
                <a href="addhymd.jsp?bizaction=1&amp;hyid=<%=hyInfo.getHyid()%>" target="perinfoframe" class="btn01"> 加TA为好友</a>
                <a href="addhymd.jsp?bizaction=2&amp;hyid=<%=hyInfo.getHyid()%>" target="perinfoframe" class="btn02">加入黑名单</a>
                <%
                    }
                %>

               </div>
            <div style="height:30px; line-height:30px; background-color:#21648f; padding-left:10px; margin-top:20px; color:#FFF; font-size:16px; font-family:'微软雅黑'">扫描二维码</div>
            <div class="erweima"><img src="images/weixin_erweima.jpg" alt="" width="120" height="120"/><br/>微信公众号（移动站）</div>
            <div class="erweima"><img src="images/kf_img.jpg" alt="" width="120"  /><br/>客服电话</div>
        </div>


         <!--基本资料-->
        <div class="box03" id="pertagContent0" style="display:block">
            <div class="tit">

                <h1><%=hyInfo.getLcname()%></h1>
                <%if(isvery) {%><span style="display:inline-block; padding:0 10px; background-color:#090; height:20px; line-height:20px; margin-left:20px;
                overflow:hidden; color:#FFF">
                   已验证 </span><%}%></div>

            <table width="633" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td colspan="3"><strong>交友意向</strong>：<span class="huangse"><%=jyyx%></span></td>
                </tr>

                <tr>
                    <td style="width:200px;"><strong>性别</strong>：<span><%=sex%></span></td>
                    <td style="width:200px;"><strong>年龄</strong>：<span><%=age%></span></td>
                    <td style="width:200px;"><strong>婚否</strong>：<span><%=hyzk%></span></td>
                </tr>

                <tr>
                    <td><strong>住址</strong>：<span><%=zz+(hyInfo.getS3() == null ? "":hyInfo.getS3())%></span></td>
                    <td><strong>职业</strong>：<span><%=zy%></span></td>
                    <td><strong>学历</strong>：<span><%=whcd%></span></td>
                </tr>
                <tr>
                    <td><strong>年薪</strong>：<span><%=yx%></span></td>
                    <td><strong>住房</strong>：<span><%=zf%></span></td>
                    <td><strong>身高</strong>：<span><%=sg%></span></td>
                </tr>
                <tr>
                    <td ><strong>体重</strong>：<span><%=tz%></span></td>
                    <td ><strong>肤色</strong>：<span><%=fs%></span></td>
                    <td ></td>
                </tr>
                <tr>
                    <td ><strong>星座</strong>：<span><%=xz%></span></td>
                    <td ><strong>血型</strong>：<span><%=xx%></span></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="3"><strong>性格特征</strong>：<span><%=xgtz%></span></td>
                </tr>
                <tr>
                    <td colspan="3"><strong>业余安排</strong>：<span><%=yyap%></span></td>
                </tr>
            </table>
            <div class="lm_name">
                <h2><%=hyInfo.getSex().equals("11")?"她":"他" %>的补充资料：</h2>
            </div>
            <table width="633" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="15%" valign="top"><strong>情爱关系</strong>：</td>
                    <td  width="85%"><%=uother.getQggx()%></td>
                </tr>
                <tr>
                    <td valign="top"><strong>理想情人</strong>：</td>
                    <td ><%=uother.getLxqr()%> </td>
                </tr>
                <tr>
                    <td valign="top"><strong>交友留言</strong>：</td>
                    <td > <%=uother == null ? "":uother.getJyly()%></td>
                </tr>
            </table>

        </div>

        <!--影集-->
        <div class="box03" id="pertagContent1" style="display:none">
            <div class="tit02">
                <h1><%=hyInfo.getLcname()%></h1>的影集
            </div>
            <div class="ShowPhoto">
                <ul>  <li>
                   <%
                        if(uother != null && uother.getUserphoto1() != null && uother.getUserphoto1().length() > 0
                        		&&new File("E:\\web\\lover51\\upload\\hyimg\\"+uother.getUserphoto1()).exists()){
                    %>

                        <img src="../<%=afilepathsmall+File.separator+uother.getUserphoto1()%>" width="110" onClick="viewLargePic('1')" height="126" border="0" />

                    <input id= "lager1" type="hidden" value="<%=afilepath+File.separator+uother.getUserphoto1()%>">
                 <% }else
                        {
                            out.println("<a><img src='images/nopic2.gif' width='110' height='126' border='0'></a>");
                        }
                    %>
                    </li><li>
                    <!--aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa-->
                    <%
                        if(uother != null && uother.getUserphoto2() != null && uother.getUserphoto2().length() > 0
                        		&&new File("E:\\web\\lover51\\upload\\hyimg\\"+uother.getUserphoto2()).exists()){
                    %>

                        <img src="../<%=afilepathsmall+File.separator+uother.getUserphoto2()%>" width="110" onClick="viewLargePic('2')"  height="126" border="0"/>

                    <input id= "lager2" type="hidden" value="<%=afilepath+File.separator+uother.getUserphoto2()%>">
                    <% }else
                    {
                        out.println("<a><img src='images/nopic2.gif' width='110' height='126' border='0'></a>");
                    }
                    %>
                </li><li>
                    <!--aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa-->
                    <%
                        if(uother != null && uother.getUserphoto3() != null && uother.getUserphoto3().length() > 0&&new File("E:\\web\\lover51\\upload\\hyimg\\"+uother.getUserphoto3()).exists()){
                    %>

                        <img src="../<%=afilepathsmall+File.separator+uother.getUserphoto3()%>" width="110"  onClick="viewLargePic('3')"  height="126" border="0" />

                    <input id= "lager3" type="hidden" value="<%=afilepath+File.separator+uother.getUserphoto3()%>">
                    <% }else
                    {
                        out.println("<a><img src='images/nopic2.gif' width='110' height='126' border='0'></a>");
                    }

                    %> <!--aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa-->
                </li><li>
                    <%
                        if(uother != null && uother.getUserphoto4() != null && uother.getUserphoto4().length() > 0&&new File("E:\\web\\lover51\\upload\\hyimg\\"+uother.getUserphoto4()).exists()){
                    %>
                <!--    <a href="getphoto.jsp?number=4&id=<%=userid%>" target="_blank" onclick="addFavorite();">   -->
                        <img src="../<%=afilepathsmall+File.separator+uother.getUserphoto4()%>" width="110"   onClick="viewLargePic('4')"  height="126" border="0"/>
                    <!--  </a> -->
                    <input id= "lager4" type="hidden" value="<%=afilepath+File.separator+uother.getUserphoto4()%>">
                    <% }else
                    {
                        out.println("<a><img src='images/nopic2.gif' width='110' height='126' border='0'></a>");
                    }

                    %> <!--aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa-->
                </li><li>
                    <%
                        if(uother != null && uother.getUserphoto5() != null && uother.getUserphoto5().length() > 0
                        		&&new File("E:\\web\\lover51\\upload\\hyimg\\"+uother.getUserphoto5()).exists()){
                    %>
                 <!--  <a href="getphoto.jsp?number=5&id=<%=userid%>" target="_blank" onclick="addFavorite();">  -->
                        <img src="../<%=afilepathsmall+File.separator+uother.getUserphoto5()%>" width="110" onClick="viewLargePic('5')" height="126" border="0"/>
                  <!--  </a>  -->
                    <input id= "lager5" type="hidden" value="<%=afilepath+File.separator+uother.getUserphoto5()%>">
                    <% }else
                    {
                        out.println("<a><img src='images/nopic2.gif' width='110' height='126'  border='0'></a>");
                    }
                    %>
                </li>
                </ul>
                <div class="Showp">
                    <a id="largeLink" href="getphoto.jsp?number=1&id=<%=userid%>" target="_blank" >    <img id="largeShow" src="images/02.jpg"/> </a>
                </div>
            </div>
            <div style="clear:both"></div>
        </div>
        <!--文集-->
        <div class="box03" id="pertagContent2" style="display:none">
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
                        String sLink = "veiwnews-id-"+aid+"-wtype-"+wtype+"-hyid-"+hyInfo.getHyid()+".htm";
                        if(wtype.equals("2"))
                            sLink="disp_bbs-bbsid-"+aid+".htm";
                %>
                <li><%=wtype.equals("1") ? "[个人文集]":"[论坛发帖]" %><a href="<%=sLink%>" target="_blank"><%=wtitle%></a></li>
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
                String tel,oicq,sjtel,email,wx;
                tel=oicq=sjtel=email=wx="";
                if (loginUser !=null && (bjd >=  needbjd || flag==SysDefine.SYSTEM_HY_TYPE_nvip || flag==SysDefine.SYSTEM_HY_TYPE_vip)){
	                tel = hyInfo.getTel() == null ? "":hyInfo.getTel();
	                if(hyset.getSettel() != null && hyset.getSettel().intValue() == SysDefine.SYSTEM_HYSET_OPEN_FRIEND && !isHy)
	                    tel = "仅向好友，请赶快联系我吧！";
	                oicq = hyInfo.getOicq() == null ? "":hyInfo.getOicq();
	                if(hyset.getSettel() != null && hyset.getSetqq().intValue() == SysDefine.SYSTEM_HYSET_OPEN_FRIEND && !isHy)
	                    oicq = "仅向好友，请赶快联系我吧！";
	                sjtel = hyInfo.getSjtel() == null ? "":hyInfo.getSjtel();
	                if(hyset.getSetsjtel() != null && hyset.getSetsjtel().intValue() == SysDefine.SYSTEM_HYSET_OPEN_FRIEND && !isHy)
	                    sjtel = "仅向好友，请赶快联系我吧！";
	                email = hyInfo.getEmail() == null ? "":hyInfo.getEmail();
	                if(hyset.getSetmail() != null && hyset.getSetmail().intValue() == SysDefine.SYSTEM_HYSET_OPEN_FRIEND && !isHy)
	                    email = "仅向好友，请赶快联系我吧！";
	                wx = hyInfo.getWx() == null ? "":hyInfo.getWx();
	                if(hyset.getSetwx() != null && hyset.getSetwx().intValue() == SysDefine.SYSTEM_HYSET_OPEN_FRIEND && !isHy)
	                    wx = "仅向好友，请赶快联系我吧！";
                }
                
            %>
            <table width="533" border="0" cellspacing="0" cellpadding="0" style="display:block; margin:auto; margin-top:20px;border:#666666 1px solid;">
                <tr>
                    <td style="width:150px; border:#CCC 1px solid;border-bottom:0; background-color:#f7f7f7" align="right"><strong>留言：</strong></td>
                    <td style=" border:#CCC 1px solid; text-align:center;border-left:0; border-bottom:0">
                    	<%if (loginUser !=null && (bjd >=  needbjd || flag==SysDefine.SYSTEM_HY_TYPE_nvip || flag==SysDefine.SYSTEM_HY_TYPE_vip)){ %>
                        	<a href="reperly.jsp?fromid=<%=hyInfo.getHyid()%>&fromname=<%=hyInfo.getLcname()%>" target="_blank" rel="gb_page_center[617, 350]" title="回复"><img src="images/liuyan.jpg"></a>
                        <%} %>
                    </td>
                </tr>
                <tr>
                    <td style="border:#CCC 1px solid; border-bottom:0; background-color:#f7f7f7" align="right"><strong>手机：</strong></td>
                    <td style="font-size:18px;border:#CCC 1px solid; text-align:center;border-left:0; border-bottom:0"><%=sjtel%>
                    <% 
                    String isvca     = hyInfo.getIsvcation() == 1 ? "(已验证)" : "(未验证)";
                    %>
                    <span style="color:#F00"><%=isvca %></span>
                    
                    </td>
                </tr>
                <tr>
                    <td style="border:#CCC 1px solid; border-bottom:0; background-color:#f7f7f7" align="right"><strong>固定电话：</strong></td>
                    <td style="font-size:18px;border:#CCC 1px solid; text-align:center;border-left:0; border-bottom:0"><%=tel%></td>
                </tr>
                <tr>
                    <td style="border:#CCC 1px solid; border-bottom:0; background-color:#f7f7f7" align="right"><strong>QQ：</strong></td>
                    <td style="font-size:18px;border:#CCC 1px solid; text-align:center;border-left:0; border-bottom:0"><%=oicq%></td>
                </tr>
                <tr>
                    <td style="border:#CCC 1px solid; background-color:#f7f7f7" align="right"><strong>E-mail：</strong></td>
                    <td style="font-size:18px;border:#CCC 1px solid; text-align:center;border-left:0;"><%=email%></td>
                </tr>
                <tr>
                    <td style="border:#CCC 1px solid; background-color:#f7f7f7" align="right"><strong>微信：</strong></td>
                    <td style="font-size:18px;border:#CCC 1px solid; text-align:center;border-left:0;"><%=wx%></td>
                </tr>
            </table>

        </div>
        <div style="clear:both"></div>

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
 <iframe id="perinfoframe" name="perinfoframe" frameborder="0" width="0" height="0"></iframe>
  <iframe id="addFavoriteframe" name="addFavoriteframe" frameborder="0" width="0" height="0"></iframe>
<%@ include file="bottom.jsp"%>
 <form id="pageform" action="perinfo.jsp" target="_self">
       <input name="cpages" type="hidden" value="1">
       <input name="id"  type="hidden" value="<%=userid%>">
       <input name="wjfy" type="hidden"  value="1">
   </form>
   <form id="addFavoriteform" action="addFavorite.jsp" target="addFavoriteframe">
       <input name="isAddFavorite"  type="hidden" value="1">
   </form>
   <iframe id="useBjdframe" name="useBjdframe" frameborder="0" width="0" height="0"></iframe>
<script type="text/javascript">
         var objc = document.getElementById("wjtab<%=type%>");
        selectTagPer("pertagContent<%=type%>",objc,<%=type%>);
        
   function viewLargePic(a){
       document.getElementById("largeShow").src ="";
        if(document.getElementById("lager"+a)!=null){
            document.getElementById("largeShow").src="../"+document.getElementById("lager"+a).value;
          //  alert(document.getElementById("largeLink"));
            document.getElementById("largeLink").href = "getphoto.jsp?number="+a+"&id=<%=userid%>";
          //  alert(document.getElementById("largeLink").href);
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
   for(var i=0; i<4; i++){
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
