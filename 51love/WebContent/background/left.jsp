<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.common.*"%>

<%
 Admininfo adminLeft = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
 int flag = 2;
 if(adminLeft.getFlag() != null)
   flag = adminLeft.getFlag().intValue();
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #f0f0f0;
	scrollbar-3dlight-color:#cccccc;
	scrollbar-highlight-color:#eeeeee;
	scrollbar-face-color:#eeeeee;
	scrollbar-arrow-color:#777777;
	scrollbar-shadow-color:#cccccc;
	scrollbar-darkshadow-color:#eeeeee;
	scrollbar-base-color:#F0F0F0;
	scrollbar-track-color:#dedede;
}
-->
</style>
<script language="JavaScript" src="./dtree/dtree.js"></script>
<%--<link href="../style/css.css" rel="stylesheet" type="text/css">--%>
<link href="./dtree/dtree.css" rel="stylesheet" type="text/css">
</head>

<body   style="background-position:right bottom; background-repeat:no-repeat ">
<div class="dtree" style="width:190px;height:100%; overflow:auto">
<script type="text/javascript">
   //out.println("d.add(1,0,'�û�����','userManage/userList.jsp');");

    var d = new dTree('d');
    d.config.target = "mlist";
    d.config.useIcons=true;
    d.add(0,-1,'��̨����','http://www.51lover.org/',"","_blank");
   d.config.closeSameLevel=true;
    <%
    if(flag ==10)
    {
    %>
    d.add(1,0,'����Ա�趨');
    d.add(101,1,'���ӹ���Ա','addadmin.jsp');
    d.add(102,1,'ά������Ա','editadmin.jsp');
    <%
    }
    %>
    <%
    if(flag ==10 || flag == 1)
    {
    %>

    d.add(2,0,'��վ����');
    d.add(201,2,'��վ��Ϣ','siteinfo.jsp');

    d.add(202,2,'���淢��');
    d.add(203,202,'���ķ���','./channel/news_add.jsp');   //��ԭ���Ĺ��淢��
    d.add(204,202,'��̳���·���','./channel/news_add_lt.jsp');
    d.add(205,2,'��������');
    d.add(206,205,'��վ����',"./channel/wtnews_mod3.jsp?id=1773446");
    d.add(207,205,'��վ֤��',"./channel/wtnews_mod3.jsp?id=1773447");
    d.add(208,205,'��վ��̬','newslist.jsp');
    d.add(210,2,'����ָ��');
    d.add(211,210,'ʹ��ָ��',"newslist2.jsp");
    d.add(212,210,'��������',"./channel/wtnews_mod3.jsp?id=1773448");
    d.add(213,210,'��˽����',"./channel/wtnews_mod3.jsp?id=1773449");
    d.add(214,210,'������֪',"./channel/wtnews_mod3.jsp?id=1773450");
    d.add(215,2,'����ѵ��');
    d.add(216,215,'ѵ������',"./channel/wtnews_mod3.jsp?id=1773368");
    d.add(217,215,'ѵ��ͼƬ',"./channel/wtnews_mod4.jsp?id=1773369");
    d.add(218,215,'ѵ������',"newslist5.jsp");
   //    d.add(202,2,'��������','setll.jsp');
    <%
    }
    %>


    <%
    if(flag ==10 || flag == 5)
    {
    %>
    d.add(3,0,'�������ӹ���');
    d.add(301,3,'��������','friend.jsp?state=0');
    d.add(302,3,'��������','friend.jsp?state=1');
    d.add(303,3,'��ͣ����','friend.jsp?state=2');

    d.add(304,3,'Ư�����','');
    <%
    }
    %>

    <%
    if(flag ==10 || flag ==5 || flag == 1 || flag == 30)
    {
    %>
    d.add(4,0,'�ͷ�����');
    <%
    }
    %>
     <%
    if(flag ==10 || flag == 1 ||  flag == 30)
    {
    %>
    
    d.add(401,4,'������','kfzxlist.jsp?ntype=0');
    d.add(402,4,'����','kfzxlist.jsp?ntype=1');
    d.add(403,4,'��ѯ','kfzxlist.jsp?ntype=2');
    d.add(404,4,'Ͷ��','kfzxlist.jsp?ntype=3');
    d.add(405,4,'����','kfzxlist.jsp?ntype=4');
    <%
    }
    %>
    
    <%
    if(flag ==10 || flag ==5 || flag == 1 ||  flag == 30)
    {
    %>
    d.add(406,4,'����','kfzxlist.jsp?ntype=5');
    <%
    }
    %>
     <%
    if(flag ==10 || flag == 1 || flag == 30)
    {
    %>
    d.add(407,4,'ɾ��','kfzxlist.jsp?ntype=6');
    <%
    }
    %>


    <%
    if(flag ==10 || flag ==2 || flag ==1 || flag ==5 || flag ==3 || flag == 20 ||  flag == 30 ||  flag == 40)
    {
    %>
    d.add(6,0,'��Ա����');
    <%
     if(flag == 10 || flag==30 ||flag == 2 ||flag ==3 ||flag ==40)
     {
    %>
   d.add(608,6,'��Ա��֤','searchsms.jsp');
   d.add(609,6,'��Ϣ�շ�','xxsf.jsp');
   <%
   }
   %>

    d.add(601,6,'��Ա����','search.jsp?isdel=0');
    <%
    }
    %>

    <%
    if(flag ==10 || flag ==1 || flag ==5 || flag== 20 ||  flag == 30)
    {
    %>
    d.add(602,6,'��ɾ����Ա','search.jsp?isdel=1');
    <%
	}    
    %>
    
    <%
    if(flag ==10 || flag ==1 || flag == 20 ||  flag == 30)
    {
    %>
    d.add(603,6,'������Ƭ','searchoplog.jsp');
    d.add(604,6,'ɾ���ļ�','searchoplogarticle.jsp');
    d.add(605,6,'�û���Ϣ�޸�','searchoploguinfo.jsp');
    /*d.add(606,6,'�û�������','usernamecutlist.jsp');*/
    d.add(608,6,'�ﲨƥ��','searchqiubo.jsp');
    //d.add(606,6,'ɧ������','usernamecutlist.jsp');
    d.add(607,6,'���дʹ���','sensitivelist.jsp');

<%
    }
    
    if(flag ==10 || flag ==2 || flag ==1 || flag ==5 || flag ==3 || flag == 20 ||  flag == 30 ||  flag == 40)
    {
    %>
    	d.add(606,6,'ɧ������','usernamecutlist.jsp');
    	d.add(610,6,'��˹���','hychecklist.jsp');
    <%
    }
    %>

   <%
if(flag ==10 || flag ==3 || flag == 1 || flag == 5)
{
%>
   d.add(5,0,'��̳����');
   d.add(501,5,'�������','bbs_admin.jsp');
   d.add(502,5,'�ظ�����','bbs_retopic.jsp');
   d.add(503,5,'��������','bbs_addtopic.jsp');
   d.add(504,5,'��������','bbssort_admin.jsp');

   <%
   }
   %>
    <%
    if(flag ==10|| flag==1|| flag ==5 )
    {
    %>
      d.add(12,0,'��Ա�Ƽ�');
      d.add(1201,12,'��Ա�Ƽ�','searchhytj.jsp');
      d.add(1202,12,'�Ƽ�ͳ��','searchhytjtj.jsp');
	  d.add(1203,12,'΢�ŷ���','sharearticlelist.jsp');
    <%
    }
    %>
    
    <%
    if(flag ==10 || flag ==5)
    {
    %>
    d.add(11,0,'�ƹ����');
    d.add(1101,11,'�ƹ��˹���','advset.jsp');
    d.add(1102,11,'�ƹ�ͳ��','advlist.jsp');
    //d.add(1103,11,'�ƹ��ѯ','advlist.jsp');
    <%
    }
    %>

    <%
    if(flag ==4)
    {
    %>
    d.add(11,0,'�ƹ����');
    d.add(1103,11,'�ƹ��ѯ','advplist.jsp');
    <%
    }
    %>
   d.add(1201,0,'�����ҹ���','bbs_user.jsp');
    <%
    if(flag ==10 || flag == 1 ||  flag == 30 ||flag ==40 || flag ==6)
    {
    %>
    	d.add(7,0,'�շѹ���');
    <%
    }
    %>
    <%
    if(flag ==10 || flag == 1 ||  flag == 30)
    {
    %>
    d.add(701,7,'���ӷ�����Ŀ','addproduct.jsp');
    d.add(702,7,'ά��������Ŀ','productlist.jsp');
    d.add(703,7,'�� �� �� ��','cartlist.jsp');
    d.add(704,7,'�� �� �� �� ','addvip.jsp');
    d.add(705,7,'�� �� �� ѯ','searchviprecordlist.jsp');

   <%
    }
    %>
    <%
    if(flag == 6)
    {
    %>
    d.add(701,7,'���ӷ�����Ŀ','addproduct.jsp');
    d.add(702,7,'ά��������Ŀ','productlist.jsp');
    d.add(703,7,'�� �� �� ��','cartlist.jsp');
   <%
    }
    %>
    <%
    if(flag ==40)
    {
    %>
    d.add(703,7,'�� �� �� ��','cartlist.jsp');
   <%
    }
    %>

    <%
    if(flag ==10 || flag ==1 || flag == 20)
    {
    %>
      d.add(8,0,'��վ��־','iplog.jsp?isf=1');
      d.add(9,0,'��ҳ����','jsp2.jsp');
    <%
    }
    %>
    

//    d.add(601,6,'�����û�','online.jsp');
//    d.add(602,6,'������־','iplog.jsp');


//    d.add(9,0,'�˳�����','logout.jsp');
    document.write(d);
</script>
</div>

</body>
</html>
