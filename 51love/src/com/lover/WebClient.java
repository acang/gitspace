package com.lover;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class WebClient {
	
	public String getWebContentByGet(String urlString, final String charset,
			int timeout) throws IOException {
		if (urlString == null || urlString.length() == 0) {
			return null;
		}
		urlString = (urlString.startsWith("http://") || urlString
				.startsWith("https://")) ? urlString : ("http://" + urlString)
				.intern();
		URL url = new URL(urlString);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		// ���ӱ�ͷ��ģ�����������ֹ����
		conn.setRequestProperty(
						"User-Agent",
						"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727)");
		// ֻ����text/html���ͣ���ȻҲ���Խ���ͼƬ,pdf,*/*���⣬����tomcat/conf/web���涨����Щ
		conn.setRequestProperty("Accept", "text/html");
		conn.setConnectTimeout(timeout);
		try {
			if (conn.getResponseCode() != HttpURLConnection.HTTP_OK) {
				return null;
			}
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		InputStream input = conn.getInputStream();
		BufferedReader reader = new BufferedReader(new InputStreamReader(input,charset));
		String line = null;
		StringBuffer sb = new StringBuffer();
		while ((line = reader.readLine()) != null) {
			sb.append(line).append("\r\n");
		}
		if (reader != null) {
			reader.close();
		}
		if (conn != null) {
			conn.disconnect();
		}
		return sb.toString();

	}

	public String getWebContentByGet(String urlString) throws IOException {
		//return getWebContentByGet(urlString, "GBK", 5000);
		String webContent=null;
		try {
			webContent= getWebContentByGet(urlString, "GBK", 5000);
			if(webContent!=null){
			int point = webContent.indexOf("login\" value=\"");
			
				if(point>0){
					webContent = webContent.substring(0,point+14)+"<%=login2%>"+webContent.substring(point+27);
				}
				BufferedReader reader = new BufferedReader(new FileReader(new File("E:/web/lover51/htmlheader.html")));
				String tempString = null;
				String content = "";
	            while ((tempString = reader.readLine()) != null) {
	            	content+=tempString+"\r\n";
	            }
	            reader.close();   
	            webContent = content +webContent;
	            File file=new File("E:/web/lover51/index.jsp");
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
		return webContent;
	}

	public String getWebContentByPost(String urlString,String data, final String charset,
			int timeout)throws IOException{
		if (urlString == null || urlString.length() == 0) {
			return null;
		}
		urlString = (urlString.startsWith("http://") || urlString
				.startsWith("https://")) ? urlString : ("http://" + urlString).intern();
		URL url = new URL(urlString);
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		 // �����Ƿ���connection�������Ϊ�����post���󣬲���Ҫ����  http�����ڣ������Ҫ��Ϊtrue
        connection.setDoOutput(true);   
        connection.setDoInput(true); 
        connection.setRequestMethod("POST");
        // Post ������ʹ�û���   
        connection.setUseCaches(false);
        connection.setInstanceFollowRedirects(true);
        //connection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
connection.setRequestProperty("Content-Type","text/xml;charset=UTF-8");
        // ���ӱ�ͷ��ģ�����������ֹ����
        connection.setRequestProperty("User-Agent","Mozilla/4.0 (compatible; MSIE 8.0; Windows vista)");
        // ֻ����text/html���ͣ���ȻҲ���Խ���ͼƬ,pdf,*/*����
        connection.setRequestProperty("Accept", "text/xml");//text/html
        connection.setConnectTimeout(timeout);
        connection.connect();
        DataOutputStream out = new DataOutputStream(connection.getOutputStream());
        //String content = data;//+URLEncoder.encode("���� ", "utf-8");
        //out.writeBytes(content);
 byte[] content = data.getBytes("UTF-8");//+URLEncoder.encode("���� ", "utf-8");
        out.write(content);
        out.flush();   
        out.close();
		try {
			//����д�ڷ������ݵĺ���
			if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) {
				return null;
			}
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
        BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(),charset));
        String line;
        StringBuffer sb=new StringBuffer();
        while ((line = reader.readLine()) != null) {
            sb.append(line).append("\r\n");
        }
        if (reader != null) {
			reader.close();
		}
		if (connection != null) {
			connection.disconnect();
		}
		return sb.toString();
	}
	public String getWebContentByPost(String urlString,String data) throws IOException {
		return getWebContentByPost(urlString, data,"UTF-8", 5000);//iso-8859-1
	}
	
	public static void main(String[] args) throws IOException {
		WebClient client=new WebClient();
		//get
		String s = client.getWebContentByGet("http://www.51lover.org/");
//		s = new String(s.getBytes("iso-8859-1"), "gb2312");
		//post
		//String s = client.getWebContentByPost("http://localhost:8080/Lottery/login.portal","toPath=toPath&;action=login&;loginname=13761083826&;password=111111");
//		s = new String(s.getBytes("iso-8859-1"), "UTF-8");
		System.out.println(s);
	}
}