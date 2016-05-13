<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.lover.*"%>
<%@ page import="java.io.*"%>
<%
   CacheTools.setAll();
   out.println("更新成功");
   
   
   WebClient client=new WebClient();
	try {
		String webContent= client.getWebContentByGet("http://localhost:8080/lover51PC");
		if(webContent!=null){
			int point = webContent.indexOf("login\" value=\"");
			if(point>0){
				webContent = webContent.substring(0,point+14)+"<%=login2%/>"+webContent.substring(point+27);
			}
			BufferedReader reader = new BufferedReader(new FileReader(new File("E:/web/lover51/index.html")));
			String tempString = null;
			String content = "";
            while ((tempString = reader.readLine()) != null) {
            	content+=tempString+"\r\n";
            }
            reader.close();  
            webContent = content +webContent;
			File file=new File("../index.html");
	         if(!file.exists()){
	        	 file.createNewFile();
	         }
         	FileOutputStream outStream=null;
         	outStream = new FileOutputStream(file,false);
         	outStream.write(webContent.getBytes("gbk"));
         	outStream.close();
		}
	} catch (Exception e) {
	}
	out.println("<script langauge=javascript>alert('更新成功');</script>");
%>
