<style type="text/css">
<!--
div {
	font-size: 12px;
	color: #6666FF;
}
li {
	list-style-type: none;
}
.a {
	font-size: 14px;
	font-weight: bold;
	color: #333333;
	list-style-type: circle;
}
.a a {
	font-size: 14px;
	font-weight: bold;
	color: #333333;
	text-decoration: none;
}
.b {
	font-size: 12px;
	color: #6666FF;
}
.b a {
	font-size: 12px;
	color: #6633FF;
	text-decoration: none;
}
.c {
	font-size: 12px;
	color: #6666FF;
}
.c a {
	font-size: 12px;
	color: #6666FF;
	text-decoration: none;
}

-->
</style>
<%
Dim ConnStr 
ConnStr="driver={sql server};server=61.132.74.87,9433;uid=nasadb;pwd=db&atgamw*($);database=infofanni"
'Y=Request("Y")*1
'M=Request("M")*1
'D=Request("D")*1
SN=Request("SN")
sex=request("sex")
if Y<>0 Then  StrW=StrW&"YEAR(UpTime) = "&Y&" and "
If M<>0 Then  StrW=StrW&"MONTH(UpTime) = "&M&"  And "
If D<>0 Then  StrW=StrW&"DAY(UpTime) = "&D&" And "
If SN<>"" Then  StrW=StrW&"username Like ''%"&SN&"%'' And "
if sex<>"" then StrW=StrW&"sex Like ''%"&sex&"%'' And "
StrW=StrW&" 1=1 "

set cls=Server.CreateObject("MyDLL.MsSql")
	cls.ConnStr=ConnStr
	cls.tblName="userinfo"
	cls.fldName="hyid"
	cls.PageIndex=Request("P")*1
	cls.PageSize=20
	cls.OrderType=1
	cls.strWhere=StrW
	cls.ListUrl="?sex="&sex&"&Sn="&Sn&"&P="
Set Rs=cls.Result
 do while not rs.eof
 Str=Str&"<li class='a'>"&Rs("username")&"</li>"&vbcrlf&"<li class='b'>("&Rs("lcname")&")</li>"&vbcrlf&"<li class='b'>("&Rs("sex")&")</li>"&vbcrlf
 rs.movenext
 loop
 rs.close
 Set rs=nothing 
 %>

<%= "<div><ul>"&Str&"</ul><ul><li  class='c'>"&cls.Page&"</li></ul></div>"%>
<% Set cls=nothing %>