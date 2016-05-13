<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%@ page import="com.common.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.web.bean.QueryRecord"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="org.apache.commons.beanutils.DynaBean"%>
<%@ page import="com.web.bean.*"%>
<%@ page import="com.lover.*"%>
<%@ page import="com.web.common.DateTools"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.servlet.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.Date" %>

<%
		int nums = 0;
		if(hyInfo != null && hyInfo.getSex()!=null && hyInfo.getSex().equals("10")){
			nums = 50;
		}else if (hyInfo != null && hyInfo.getSex()!=null && hyInfo.getSex().equals("11")){
			nums=20;
		}
		String hycity="";
		if(hyInfo.getS1().equals("上海")||hyInfo.getS1().equals("北京")||hyInfo.getS1().equals("天津")||hyInfo.getS1().equals("重庆")||hyInfo.getS1().equals("澳门")
		||hyInfo.getS1().equals("香港")||hyInfo.getS1().equals("台湾")){
			hycity=hyInfo.getS1();
		}else{
			hycity=hyInfo.getS2();
		}
                  String sql1 = "";
                  if(hyInfo != null && hyInfo.getSex().equals("11")){
                  int start = hyInfo.getCsdate().getYear()-2 + 1900;
					int end = hyInfo.getCsdate().getYear()+2 + 1900;
				String sdate = start + "-01-01";
	   			 String edate = end +  "-12-31";
	   			 //System.out.println(sdate);
                      sql1 = "from Userinfo as o where "
                     +" o.sex=11 and o.s2='"+hycity
                     +"' and o.csdate>=to_date('"+sdate+"','YYYY-MM-DD') and o.csdate <=to_date('"+edate+"','YYYY-MM-DD') and o.img=1 and o.isdel =0 "
                     +" and o.sg <= '"+hyInfo.getSg()+"' and o.tz<= '"+hyInfo.getTz()+"' and o.lysize>=30 and o.hyid<>'"+hyInfo.getHyid()+"' order by o.lasttime desc";
                      }
                  else{
                  int start = hyInfo.getCsdate().getYear()-5 + 1900;
					int end = hyInfo.getCsdate().getYear()+2 + 1900;
				String sdate = start + "-01-01";
	   			 String edate = end +  "-12-31";
                  	sql1 = "from Userinfo as o where "
                     +" o.sex=10 and o.s2='"+hycity
                     +"' and o.csdate>=to_date('"+sdate+"','YYYY-MM-DD') and o.csdate <=to_date('"+edate+"','YYYY-MM-DD') and o.img=1 and isdel=0 "
                     +" and o.lysize>=30 and o.hyid<>'"+hyInfo.getHyid()+"' and o.sg >= '"+hyInfo.getSg()+"' and o.yx>='"+hyInfo.getYx()
                     +"' order by o.lasttime desc";
                      }
                      
                      QueryResult qr1 = null;
                      qr1 = QueryRecord.queryByHbm(sql1,nums,1);
                      
                  
                   %>

<%
	if(null!=qr1 && qr1.resultList.size()>0){
 %>
<ul>
        <%
     	HashSet<Integer> hs = new HashSet<Integer>(); 
   		Random r = new Random();
   		int k = 0;
   		int p = 0;
   		if(qr1.resultList.size()>0 && qr1.resultList!=null)
   		{
   		//System.out.println("++++"+qr1.resultList.size());
   		if(qr1.resultList.size()<10){
   			k = qr1.resultList.size();
   		}else {
   			k = 10;
   		}
	   		while(hs.size()<k)
	    	{
	      		 hs.add(r.nextInt(qr1.resultList.size()));
	   		}
   		}
    	//Iterator<Integer> i = hs.iterator();
   //---------------------------------------------- 	
    	Iterator<Integer> f = hs.iterator();
        int n=k;

        int  ra[]=new int[n];
        int  temp2;
        for(temp2=0;temp2<ra.length;temp2++)
        {
            ra[temp2]=(int)(f.next());
        }
        int d;
        for(d=0;d<ra.length;d++) 
        {
        	for(int j=d+1;j<ra.length;j++) 
        	{
        		if(ra[j]<ra[d]) 
        		{
        			int temp1 = ra[d];
        			ra[d] = ra[j];
        			ra[j] = temp1;
            
        		}
        	}
        }
        //--------------------------------------------------------
    	String age2 = "";
    	String xxname = "";
    	Date date1 = new Date(System.currentTimeMillis());
                
                int j=0;
                for(j =0;j<k;j++){
                  Userinfo temp = (Userinfo)qr1.resultList.get(ra[j]);
                  xxname = temp.getLcname();
                  if(xxname.length()>4){
                  	xxname = xxname.substring(0,4);
                  }
   				  Userother userother = HYRegMng.getUserOtherByHyid(temp.getHyid().toString());
   				  age2 = (date1.getYear() - temp.getCsdate().getYear()) + "岁";
                  %>
      <li>
          <table border="0" cellpadding="0" cellspacing="0">
              <tr>
                  <td>  <a href="perinfo-id-<%=temp.getHyid()%>.htm" target="_blank">
                      <img src="../<%=afilepathsmall+File.separator+userother.getUserphoto1()%>" width="50" alt=""/></a></td>
              </tr>
              <tr>
                  <td height="3px" align="center" ></td>
              </tr>
              <tr>
                  <td height="20px" align="center" class="xxyxtext01"><%=xxname%></td>
              </tr>
              <tr>
                  <td height="8px" align="center" class="xxyxtext02"><%=temp.getS2()%>&nbsp;&nbsp;<%=age2%></td>
              </tr>
          </table>
      </li>

      <%
			}
      %>
</ul>
                <%

			 }else{


      %>
    <div style="text-align: center; font-size: 14px;"><br/><br/>没有相仿异性 </div>
    <%
            }
        %>
