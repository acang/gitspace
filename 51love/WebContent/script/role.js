function doAddRole(){
   var form=document.getElementById("roleAddFrm");
  if(isBlank(form.name.value+"")){
      alert("����д��ɫ����");
       form.name.focus();
       return;
  }
  form.submit();
}

function doUpdateRole(){
   var form=document.getElementById("roleUpdateFrm");
  if(isBlank(form.name.value+"")){
      alert("����д��ɫ����");
       form.name.focus();
       return;
  }
  form.submit();
}

function doShowHide(tblName){
     var objFunctionTbl=document.getElementById("functionTbl");
     var privilegesTbl=document.getElementById("privilegesTbl");
     var privilegesTitle=document.getElementById("privilegesTitle");
     var functionTitle=document.getElementById("functionTitle");
     if(tblName=="functionTbl"){
          if(objFunctionTbl.style.display=="none"){
                  objFunctionTbl.style.display="block";
                  functionTitle.innerHTML=">>>��Ŀ����ģ��";
          }else{
                   objFunctionTbl.style.display="none";
                   functionTitle.innerHTML="<<<��Ŀ����ģ��";
          }
     }
      if(tblName=="privilegesTbl"){
          if(privilegesTbl.style.display=="none"){
                  privilegesTbl.style.display="block";
                  privilegesTitle.innerHTML=">>>Ȩ�޹���ģ��";
          }else{
                   privilegesTbl.style.display="none";
                   privilegesTitle.innerHTML="<<<Ȩ�޹���ģ��";
          }
     }
}

function doUpdatePrivileges(){
  var result=getCheckedID("actionid");
  var form=document.getElementById("privilegedFrm");
  form.actionidlist.value=result[1];
  form.submit();
}

function goPage(pageNum){
   var form=document.getElementById("turnFrm");
     if(pageNum+""==""){
       alert("������ҳ����");
       return;
     }
     if(!isNumber(pageNum)){
         alert("����ȷ����ҳ����");
         return;
     }
 form.submit();
 }

function doDelRole(roleid){
    if(confirm("���Ƿ����ȷ��Ҫɾ����")){
         window.location="role.do?action=del&roleid="+roleid;
    }
}
 function selectAll2(parentName){
      var objParent=document.getElementById(parentName);
      var checked=true;
      if(objParent.checked){
            checked=true;
      }else{
            checked=false;
      }
     for(var i=0;i<document.all.length;i++){
            var box=document.all[i];
            if(box.name==parentName)continue;
            if((box.id+"").indexOf(parentName+"")>=0)box.checked=checked;
     }
}
