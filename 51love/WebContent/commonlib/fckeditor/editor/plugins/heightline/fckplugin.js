FCKCommands.RegisterCommand('HeightLine', new FCKDialogCommand('HeightLine', FCKLang.HeightlineDlgTitle, FCKPlugins.Items['heightline'].Path + 'heightline.html', 200, 150));

var oHeightLineItem = new FCKToolbarButton('HeightLine', FCKLang.HeightlineBtn) ;
oHeightLineItem.IconPath = FCKPlugins.Items['heightline'].Path + 'heightline.gif';

FCKToolbarItems.RegisterItem('HeightLine', oHeightLineItem);


// ����FCKCodes����ͨ��FCKCodes������������ť�Ĳ���
var FCKHeightLine = new Object() ;

FCKHeightLine.AddHeightLine = function (heightline_value) {
    var A = FCK.EditorDocument;
    var select = A.selection.createRange();
    if (select.text != "") {
        var p = select.parentElement();
        if (p.tagName == "P") {
            p.style.lineHeight = heightline_value;
        } else if (p.tagName == "SPAN") {
            var B = p.parentNode;
            B.style.lineHeight = heightline_value;
        }
    } else {
        var B = A.getElementsByTagName("P");
        for (var i = 0; i < B.length; i ++) {
            B[i].style.lineHeight = heightline_value;
        }
    }
}