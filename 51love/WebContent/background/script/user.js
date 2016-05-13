function doAddUser(){
  var form=document.getElementById("userAddFrm");
  if(isBlank(form.userName.value+"")){
      alert("����д�ʼ���ַ");
       form.userName.focus();
       return;
  }
  form.email.value=form.userName.value+"@"+form.domain.value;
    if(!isValidEmail(form.email.value+"")){
      alert("����ȷ��д�ʼ���ַ");
       form.userName.focus();
       return;
  }
   if(isBlank(form.name.value+"")){
      alert("����д�û���ʵ����");
       form.name.focus();
       return;
  }
  var objType=form.usertypeid;
  if(objType.options[objType.selectedIndex].value==-1){
       alert("��ѡ���û����͡�");
       objType.focus();
       return;
   }
   var objSexType=form.sex;
   if(objSexType.options[objSexType.selectedIndex].value==-1){
       alert("��ѡ���û��Ա�");
       objSexType.focus();
       return;
   }
    if(isBlank(form.idcardno.value+"")){
      alert("����д���֤��");
       form.idcardno.focus();
       return;
  }
    if(!((form.idcardno.value+"").length==15||(form.idcardno.value+"").length==18)){
      alert("����д15λ��18λ�����֤��");
       form.idcardno.focus();
       return;
  }

      if(isValidIdenNo(form.idcardno.value) == false){
       alert("����ȷ�������֤�ţ�");
       form.idcardno.focus();
       return;
       }
  form.submit();
}

    /**
     * ��֤���֤���Ƿ�Ϸ�
     *
     * @param idenNo
     * @return ����Ϸ�����true,���򷵻�false
     */
    function isValidIdenNo( idenNo) {
        var strValidateNumber = "0123456789";
        var strValidateChar = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        //15λȫΪ����
        if(idenNo.length == 15){
             if( isNumber(idenNo)==false)
                 return false;
   }
        if(idenNo.length == 18){
            for (i=0;i<idenNo.length-1;i++)
            {
                j=strValidateNumber.indexOf(idenNo.charAt(i));

                if (j == -1)
                {
                    return false;
                }
            }
             if (strValidateChar.indexOf(idenNo.charAt(i))==-1)
             {
                 return false;
             }

        }

        return true;
    }

  function doQuery(){
      var form=document.getElementById("queryFrm");
      if(form.userName.value+""!=""){
            form.email.value=form.userName.value+"@"+form.domain.value;
      }
      form.submit();
  }

 function goNextPage(nextPage){
      var form=document.getElementById("queryFrm");
      if(form.userName.value+""!=""){
            form.email.value=form.userName.value+"@"+form.domain.value;
      }
      form.pageNum.value=nextPage;
      form.submit();
 }
 function goPage(pageNum){
     if(pageNum+""==""){
       alert("������ҳ����");
       return;
     }
     if(!isNumber(pageNum)){
         alert("����ȷ����ҳ����");
         return;
     }
     goNextPage(pageNum);
 }

 function doDisable(){
   var result=getCheckedID("userid");
   if(result[0]=="0"){
         alert("��ѡ��Ҫ���õĶ���");
         return;
    }
   var form=document.getElementById("queryFrm");
   form.action="User.do?action=disable";
   form.method="post";
   form.userids.value=result[1];
   doQuery();
 }
 function doDel(){
       var result=getCheckedID("userid");
      if(result[0]=="0"){
         alert("��ѡ��Ҫɾ���Ķ���");
         return;
      }
    if(confirm("���Ƿ����ȷ��Ҫɾ����")){
         var form=document.getElementById("queryFrm");
         form.action="User.do?action=del";
         form.method="post";
        form.userids.value=result[1];
        doQuery();
 }

 }

 function doEnable(){
   var result=getCheckedID("userid");
         if(result[0]=="0"){
         alert("��ѡ��Ҫ��ͨ�Ķ���");
         return;
      }
   var form=document.getElementById("queryFrm");
   form.action="User.do?action=enable";
   form.method="post";
   form.userids.value=result[1];
   doQuery();
 }

 function doUpdateUserRoles(){
    var form=document.getElementById("userrolefrm");
    var result=getCheckedID("roleid");
    form.roleidlist.value=result[1];
    form.submit();
 }
 function doInitPwd(){

 }
