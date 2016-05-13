<%@ page import="java.util.Date" %>
<%@ page import="java.util.Random" %>
<%@ page import="com.common.MD5Util" %>
<%
    String erweima ="weixin://wxpay/bizpayurl?";
    String appid = "wxfb0c41fd39d33468";
    String mch_id = "1239362002";

    Random r2 = new Random();
    long sjs = r2.nextInt(100000);
    String nonce_str = sjs+"";

    String product_id = "vip1";



    Date date = new Date();
    long time_second = date.getTime()/1000;
    String time_stamp = time_second+"";

  //  String stringA = "appid="+appid+"&mch_id="+mch_id+"&nonce_str="+nonce_str +"&productid="+product_id + "&time_stamp="+time_stamp;
    String stringA = "appid="+appid+"&mch_id="+mch_id+"&nonce_str="+nonce_str +"&productid="+product_id + "&time_stamp="+time_stamp;
 //   String stringSignTemp= stringA+"&key=51loverorg2015mahe0051loverorg2015";

    String stringSignTemp= stringA+"&key=51loverorg2015mahe0051loverorg2015";

    String sign= MD5Util.MD5(stringSignTemp).toUpperCase();

    erweima += stringA+"&sign="+sign;


 %>

<img src="../code.jspx?content=<%=erweima%>" height="200" width="200">