<%
/* *
 ���ܣ�֧����ҳ����תͬ��֪ͨҳ��
 �汾��3.2
 ���ڣ�2011-03-17
 ˵����
 ���´���ֻ��Ϊ�˷����̻����Զ��ṩ���������룬�̻����Ը����Լ���վ����Ҫ�����ռ����ĵ���д,����һ��Ҫʹ�øô��롣
 �ô������ѧϰ���о�֧�����ӿ�ʹ�ã�ֻ���ṩһ���ο���

 //***********ҳ�湦��˵��***********
 ��ҳ����ڱ������Բ���
 �ɷ���HTML������ҳ��Ĵ��롢�̻�ҵ���߼��������
 TRADE_FINISHED(��ʾ�����Ѿ��ɹ��������������ٶԸý�������������);
 TRADE_SUCCESS(��ʾ�����Ѿ��ɹ����������ԶԸý����������������磺�����˿��);
 //********************************
 * */
%>
<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.alipay.util.*"%>
<%@ page import="com.alipay.config.*"%>
<%@ page import="com.lover.mng.CartMng" %>
<%@ page import="com.lover.mng.HYRegMng" %>
<%@ page import="com.common.*"%>
<%@ page import="com.web.obj.Userinfo" %>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.obj.extend.*"%>
<html>
  <head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk">
		<title>֧����ҳ����תͬ��֪ͨҳ��</title>
  </head>
  <body>
<%
	//��ȡ֧����GET����������Ϣ
	Map<String,String> params = new HashMap<String,String>();
	Map requestParams = request.getParameterMap();
	for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
		String name = (String) iter.next();
		String[] values = (String[]) requestParams.get(name);
		String valueStr = "";
		for (int i = 0; i < values.length; i++) {
			valueStr = (i == values.length - 1) ? valueStr + values[i]
					: valueStr + values[i] + ",";
		}
		//����������δ����ڳ�������ʱʹ�á����mysign��sign�����Ҳ����ʹ����δ���ת��
		valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
		params.put(name, valueStr);
	}
	
	//��ȡ֧������֪ͨ���ز������ɲο������ĵ���ҳ����תͬ��֪ͨ�����б�(���½����ο�)//
	//�̻�������

	String MerId = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"GBK");
	//֧�������׺�

	String OrdId = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"GBK");
    System.out.println(OrdId);
	//����״̬
	String OrderStatus = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"GBK");
    System.out.println("OrderStatus =???? " + OrderStatus);
    if("TRADE_SUCCESS".equals(OrderStatus)){
       OrderStatus = "1001";
    }
	//��ȡ֧������֪ͨ���ز������ɲο������ĵ���ҳ����תͬ��֪ͨ�����б�(���Ͻ����ο�)//

    int ret = CartMng.alipayOk(MerId,OrdId,"0.01","0","0","0",OrderStatus,"9");
    String s = CartMng.cartOkResponse(ret);
    out.println(s);

    Cart cart = CartMng.getCartByOrderId(OrdId);
    if(ret==5||ret==7 || (ret==0&& cart!=null &&cart.getFlag()!=null && cart.getFlag()==5)){
       
//      Userinfo user = HYRegMng.getUserinfoByUsername(cart.getUsername());
      if(cart != null){
    	///�ҵ������û�
            Userinfo tempUser = HYRegMng.getUserinfoByUsername(cart.getUsername());
    	if(tempUser!=null){
    		if(tempUser.getImportant()==null||tempUser.getImportant()!=91){
    			Userother uother = HYRegMng.getUserOtherByHyid(""+tempUser.getHyid());
  			  //must have photo
  		    if(uother.getUserphoto1()!=null&& uother.getUserphoto1().trim().length()>0){
	    		String type = "9";
	            String sql2 = "update userinfo set important = important+1 where  important >90 and  important<120";
	            HbmOperator.executeSql(sql2);
	            String sql = "update userinfo set important = " + type+"1  where  hyid = " +tempUser.getHyid();
	            HbmOperator.executeSql(sql);
    		}
    		}
    	}
      }
		// /���û�VIP��Ϣ���뵽��½��Ϣ��
       Userinfo grwhqUser = (Userinfo)request.getSession().getAttribute(SysDefine.SESSION_LOGINNAME);
       grwhqUser.setFlag(SysDefine.SYSTEM_HY_TYPE_vip);
       request.getSession().setAttribute(SysDefine.SESSION_LOGINNAME,
    		   grwhqUser);
       response.sendRedirect("http://www.51lover.org/grzq.jsp");

    }

	//����ó�֪ͨ��֤���
	boolean verify_result = AlipayNotify.verify(params);
	
//	if(verify_result){//��֤�ɹ�
//		//////////////////////////////////////////////////////////////////////////////////////////
//		//������������̻���ҵ���߼��������
//
//		//�������������ҵ���߼�����д�������´�������ο�������
//		if(trade_status.equals("TRADE_FINISHED") || trade_status.equals("TRADE_SUCCESS")){
//			//�жϸñʶ����Ƿ����̻���վ���Ѿ���������
//				//���û�������������ݶ����ţ�out_trade_no�����̻���վ�Ķ���ϵͳ�в鵽�ñʶ�������ϸ����ִ���̻���ҵ�����
//				//���������������ִ���̻���ҵ�����
//            int ret = CartMng.alipayOk(request);
//            String s = CartMng.cartOkResponse(ret);
//		}
//
//		//��ҳ�����ҳ�������༭
//		out.println("��֤�ɹ�<br />");
//		//�������������ҵ���߼�����д�������ϴ�������ο�������
//
//		//////////////////////////////////////////////////////////////////////////////////////////
//	}else{
//		//��ҳ�����ҳ�������༭
//		out.println("��֤ʧ��");
//	}
%>
  </body>
</html>
