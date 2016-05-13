<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.servlet.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%
   String keyword = SysCommonFunc.getStrParameter(request,"keyword");
   if(keyword != null && keyword.length() > 0)
   {   keyword = keyword.toUpperCase();
       List list = HbmOperator.list("from Keywordlib as o where o.keyword = '"+keyword+"'");
       if(list != null && list.size() > 0)
       {
           Keywordlib key = (Keywordlib)list.get(0);
           String address = key.getAddress();
           Keywordaccess ka = new Keywordaccess();
           ka.setId(SysCommonFunc.getSequenceIdForOracle(SysDefine.SEQ_BCS));
           ka.setKeyword(keyword);
        //   ka.setIpaddress(request.getRemoteAddr());
           ka.setIpaddress(IPTools.getIp(request));
           
           HbmOperator.insert(ka);
           response.sendRedirect(address);
       }else
       {
          list = HbmOperator.list("from Keywordlib as o where o.keyword = 'DEFAULT'");
          if(list != null && list.size() > 0)
          {
           Keywordlib key = (Keywordlib)list.get(0);
           String address = key.getAddress();

           response.sendRedirect(address);
          }
            Keywordaccess ka = new Keywordaccess();
           ka.setId(SysCommonFunc.getSequenceIdForOracle(SysDefine.SEQ_BCS));
           ka.setKeyword(keyword);
           //ka.setIpaddress(request.getRemoteAddr());
           ka.setIpaddress(IPTools.getIp(request));
           
           HbmOperator.insert(ka);

       }
   }else
   {
            List   list = HbmOperator.list("from Keywordlib as o where o.keyword = 'DEFAULT'");
          if(list != null && list.size() > 0)
          {
           Keywordlib key = (Keywordlib)list.get(0);
           String address = key.getAddress();

           response.sendRedirect(address);
          }
   }

%>
