<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��</title>
    <meta name="description" content="51��������-�D�й�AAA��������ཻ����վ����Ա�鲼�������ѣ��㶫���ѣ��Ϻ����ѣ����ս��ѵ�ȫ������ʡ�С�51���������Ƚ�רҵ����ݳ�ֵ,�ѻ���400������н��ѻ�Ա��" />
    <meta http-equiv=��Cache-Control�� content=��no-transform�� />
    <meta http-equiv=��Cache-Control�� content=��no-siteapp�� />
    <meta name="keywords" content="51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/lcmbase.js"></script>
    
    <script language="JavaScript">
        function check(sform)
        {
           if (sform.netname.value.length==0)
            {
                alert('��վ���Ʋ���Ϊ��');
                sform.netname.focus();
                return false;
            }
            if (sform.nethttp.value.length==0)
            {
                alert('��ַ����Ϊ��');
                sform.nethttp.focus();
                return false;
            }
            if (sform.memo.value.length==0)
            {
                alert('��վ��鲻��Ϊ��');
                sform.memo.focus();
                return false;
            }
            if (sform.applyreason.value.length==0)
            {
                alert('�������ɲ���Ϊ��');
                sform.applyreason.focus();
                return false;
            }
            if (sform.man.value.length==0)
            {
                alert('��ϵ�˲���Ϊ��');
                sform.man.focus();
                return false;
            }
            if (sform.tel.value.length==0)
            {
                alert('��ϵ�绰����Ϊ��');
                sform.tel.focus();
                return false;
            }
            return true;
        }



    </script>
</head>
<body class="cm_syzn">
<%@ include file="head.jsp"%>
<div class="wrapper1250 cm_block01" style="margin-top:8px;">
    <div class="block02">
        <div class="lm_name02">
            <h2>������������</h2>
        </div>
        <div style="clear:both"></div>
        <div style="margin:8px 100px; border:#CCC 1px solid; padding:10px; background-color:#F5F5F5; font-size:14px">
            <strong>����������</strong> <br/>��������10�����ڡ�GooglePRֵ3���ϻ�������2000IP���ϡ�ֻ����ҳ����
            (����ʱ���Ƚ�������վ�����Ϲ�վ��ҳ������ύ���ܺ��վû�б��������ӣ���������Ϊ������վ���������ǵ����ӱ�׼��
            �����Ե�һ���º����ύ���벻Ҫ�ظ��ύ)��
        </div>
        <div style="margin:8px 100px; padding:10px; background-color:#F5F5F5; font-size:14px">
            �뽫51����������վ��Ϊ������վ��ҳ��������</div>
        <table width="70%" border="0" align="center" cellpadding="3" cellspacing="0" class="bk03">
            <tr>
                <td>
                    ������������ӣ���վ���ƣ���51�������ġ�������������<br/>
                    <textarea name="siteintro"  style="width:100%;" readonly="readonly" ><a href="http://www.51lover.org">51��������</a></textarea>
                </td>
            </tr>
        </table>
        <table width="70%" border="0" align="center" cellpadding="3" cellspacing="0" class="bk03" style="margin-top:10px;">
            <tr>
                <td colspan="2">�����ͼƬ���ӣ�51������������������</td>
            </tr>
            <tr>
                <td style="width:150px">
                    <img src="skin/logo.png" width="143" height="44" />
                </td>
                <td>
                    <textarea name="siteintro"  style="width:100%; height:50px;" readonly="readonly" ><a href="http://www.51lover.org"><img src="http://www.51lover.org/skin/logo.png" width="143" height="44" alt="51��������" /></a></textarea>
                </td>
            </tr>
        </table>
        <div style="margin:8px 100px; padding:10px; background-color:#F5F5F5; font-size:14px">
            �ύ������վ�������루ÿ�Ҫ��д��</div>
        <form name="linkform" method="post" action="link_do.jsp"  enctype="multipart/form-data" onSubmit="return check(document.linkform);">
        <table width="70%" border="0" align="center" cellpadding="3" cellspacing="0" class="bk03">
            <tr>
                <td width="22%" align="right"><strong>* ��վ���ƣ�</strong></td>
                <td width="78%"><input name="netname" type="text" class="input02" id="netname" style="width:250px;"  maxlength="20"/></td>
            </tr>
            <tr>
                <td align="right"><strong>* ��վ��ַ��</strong></td>
                <td><input name="nethttp" type="text" class="input02" id="nethttp" style="width:250px;" value="http://" maxlength="100"/></td>
            </tr>
            <tr>
                <td align="right"><strong>* ��վLOGOͼƬ��</strong></td>
                <td >  <input type="file" name="file1" style="HEIGHT: 22px; WIDTH: 200px"></td>
            </tr>

            <tr>
                <td align="right"><strong>* ��վ��飺 </strong></td>
                <td ><textarea name="memo" rows="8" id="memo" style="width:440px;" title="����������������վ�ļ򵥽���"></textarea>                    </td>
            </tr>
            <tr>
                <td align="right" ><strong> * �������ɣ�</strong></td>
                <td><input name="applyreason" type="text" class="input02" id="applyreason" style="width:250px;" maxlength="20"/>��PRֵ��IP������ALEXA������</td>
            </tr>
            <tr>
                <td align="right"><strong>* ��ϵ�ˣ�</strong></td>
                <td ><input name="man" type="text" class="input02" id="man" style="width:250px;" value="" maxlength="30"/></td>
            </tr>
            <tr>
                <td align="right"><strong>* ��ϵ�绰��</strong></td>
                <td ><input name="tel" type="text" class="input02" id="tel" style="width:250px;" value="" maxlength="30"/></td>
            </tr>
            <tr>
                <td align="right"><strong>* �Ƿ��Ѽ�������</strong></td>
                <td><select name="addlink" id="addlink" ><option value="0">��</option><option value="1">��</option></select>
                  </td>
            </tr>
        </table>

        <div class="MyBtn">
            <input type="button" onclick="tijiaoLink()" value=" �������� " class="btn" />
        </div>
        </form>
    </div>
    <div class="block02t">
        <div class="lm_name">
            <h2>ɨ���ά��</h2>
        </div>
        <div class="erweima"><img src="images/weixin_erweima.jpg" alt="" width="120" height="120"/><br/>΢�Ź��ںţ��ƶ�վ��</div>
        <div class="erweima"><img src="images/kf_img.jpg" alt="" width="120"  /><br/>�ͷ��绰</div>
        <div style="clear:both"></div>
    </div>
    <div style="clear:both"></div>
</div>
<%@ include file="bottom.jsp"%>
</body>
<script>
    function tijiaoLink(){
        var addlink_obj = document.getElementById("addlink");
        var seleted_index = addlink_obj.selectedIndex;
        if(addlink_obj[seleted_index].value == "0"){
            alert("���Ƚ���վ�����վ��ҳ���ӣ�");
            return;
        }
         document.linkform.submit();
    }
</script>
</html>
