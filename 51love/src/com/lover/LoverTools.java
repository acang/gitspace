package com.lover;
import com.web.common.*;
import com.common.*;
import javax.servlet.http.HttpServletRequest;
import java.util.regex.Matcher;  
import java.util.regex.Pattern;

import com.web.obj.*;
import com.web.common.beanutil.*;
import hibernate.db.*;
import java.util.*;
import com.web.bean.QueryRecord;
import com.lover.mng.HYRegMng;
import com.web.servlet.InitEnvironment;
import java.io.File;
import javax.mail.*;
import java.net.*;

public class LoverTools {
  public LoverTools() {
  }



  public static String getHtml(String content)
  {
     if(content == null)
       return "";

//

//     content=content.replaceAll("\"","&quot;");
     content=content.replaceAll("'","&#146;");

     content=content.replaceAll("&","&amp;");
     content=content.replaceAll(" ","&nbsp;");
     content=content.replaceAll("<script.*</script>","");
     content=content.replaceAll("<","&lt;");
     content=content.replaceAll(">","&gt;");
     content=content.replaceAll("\n","<br>");
     content = content.replaceAll("\\[B\\]","<b>");
     content = content.replaceAll("\\[/B\\]","</b>");
     return content;
  }


  public static  String getJYYXDes(Userinfo user)
  {
     String jyyx = "";

     String jyyx01 = "000000";
     if(user.getJyyx() != null && user.getJyyx().toString().length() ==6)
        jyyx01 = user.getJyyx().toString();
     for(int i=0;i < 5;i ++)
     {
        if(jyyx01.charAt(i+1) == '1')
          jyyx = jyyx + SysDefine.jyyxArray[i]+"&nbsp;&nbsp;";
     }
     return jyyx;
  }

  public static String getXgtzdes(Userinfo user)
  {
     String xgtz = user.getXgtz();
     if(xgtz == null)
        return "";
      String xgtz1 = "";
      for(int i =0;i < xgtz.length();i ++)
      {
          if(xgtz.charAt(i)=='1' && i < SysDefine.xgtzArray.length)
            xgtz1 = xgtz1 + SysDefine.xgtzArray[i]+"&nbsp;&nbsp;";
      }
      return xgtz1;
  }

  public static String getYYapdes(Userinfo user)
  {
     String yyap = user.getYyap();
     if(yyap == null)
        return "";
      String yyap1 = "";
      for(int i =0;i < yyap.length();i ++)
      {
          if(yyap.charAt(i)=='1' && i < SysDefine.yyapArray.length)
            yyap1 = yyap1 + SysDefine.yyapArray[i]+"&nbsp;&nbsp;";
      }
      return yyap1;
  }


  public static String getJYZTDes(Userinfo user)
  {
    String jyzt ="";
    if(user.getSetzt() == null)
      return jyzt;

    if(user.getSetzt().intValue() == SysDefine.SYSTEM_HYSET_HYZT_WAIT)
      jyzt = "�ȴ���";
    else if(user.getSetzt().intValue() == SysDefine.SYSTEM_HYSET_HYZT_NOT_WAIT)
      jyzt = "�������";
    return jyzt;
  }

  public static String getHyDj(Userinfo user)
  {
     String s = "��ͨ��Ա";
     if(user.getFlag() != null && user.getFlag().intValue() == SysDefine.SYSTEM_HY_TYPE_vip)
       s = "�׽�vip��Ա";
     else if(user.getFlag() != null && user.getFlag().intValue() == SysDefine.SYSTEM_HY_TYPE_nvip){
    	 s="��ͨvip��Ա";
     }
     return s;
  }


  public static String getMinJyyx(int jyyxP)
  {
     if(jyyxP ==1)
        return "11____";
     if(jyyxP ==2)
        return "1_1___";
     if(jyyxP ==3)
        return "1__1__";
     if(jyyxP ==4)
        return "1___1_";
     if(jyyxP ==5)
        return "1____1";
     //if(jyyxP ==6)
        //return "1_____1_";
     //if(jyyxP ==7)
        //return "1______1";
     return "";
  }

  public static boolean isMobileNO(String mobiles){  
	  Pattern p = Pattern.compile("^((13[0-9])|(17[6-8])|(145)|(147)|(15[^4,\\D])|(18[0,1-9]))\\d{8}$");
	  Matcher m = p.matcher(mobiles);
	  return m.matches();  
  }
  
  public static boolean isEmail(String email){  
	  Pattern p = Pattern.compile("^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\\.([a-zA-Z0-9_-])+)+$");
	  Matcher m = p.matcher(email);
	  return m.matches();  
  }
}
