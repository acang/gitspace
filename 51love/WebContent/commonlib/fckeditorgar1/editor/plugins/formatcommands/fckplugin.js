/*
 * FCKeditor - The text editor for internet
 * Copyright (C) 2003-2006 Frederico Caldeira Knabben
 *
 * Licensed under the terms of the GNU Lesser General Public License:
 *         http://www.opensource.org/licenses/lgpl-license.php
 *
 * For further information visit:
 *         http://www.fckeditor.net/
 *
 * "Support Open Source software. What about a donation today?"
 *
 * File Name: fckplugin.js
 *     Plugin for Format168 background
 *
 *
 * File Authors:
 *         Yogananthar Ananthapavan (rollbond@gmail.com)
 */

// Create the "Format168" toolbar button

var oFormat168Item = new FCKToolbarButton('Format168', FCKLang.Format168Btn);

//���ð�ť��ͼ��·��
oFormat168Item.IconPath = FCKPlugins.Items['formatcommands'].Path + 'format168.jpg';
//ע�ᰴť��
FCKToolbarItems.RegisterItem('Format168', oFormat168Item);

// The object used for all Format168 operations.
var FCKFormat168 = new Object();

FCKFormat168 = function(name) {
    this.Name = name;
}

//FCK_TRISTATE_ONΪĬ����ѡ��״̬
//���������������ʵ�ֽӿڵ���������ķ���������ᱨ�ű�����
FCKFormat168.prototype.GetState = function() {
    return FCK_TRISTATE_OFF;
}

//�˷����ǵ����ť��Ҫ��ɵĲ���
FCKFormat168.prototype.Execute = function() {
    FormatText();
}

//���¶���ʵ�ֹ��ܵķ���
function FormatText() {
    var oEditor = FCK ;
    if (oEditor.EditMode == FCK_EDITMODE_WYSIWYG)
    {
        var temps = new Array();
        var sec = oEditor.EditorDocument.selection.createRange();
        var tmpText = sec.text;
        alert(tmpText)
        var isPart = tmpText != null && tmpText.trim().length > 0;
        isPart = false;
        //��ʱ�޷�ʵ�־ֲ���ʽ��
        if (!isPart) {
            var imgs = oEditor.EditorDocument.images;
            if (imgs != null && imgs.length > 0) {
                for (j = 0; j < imgs.length; j++) {
                    var t = document.createElement("IMG");
                    t.alt = imgs[j].alt;
                    t.src = imgs[j].src;
                    t.width = imgs[j].width;
                    t.height = imgs[j].height;
                    t.align = imgs[j].align;
                    temps[temps.length] = t;
                }
                var formatImgCount = 0;
                for (j = 0; j < imgs.length;) {
                    imgs[j].outerHTML = "#FormatImgID_" + formatImgCount + "#";
                    formatImgCount++;
                }
            }
            var html = processFormatText(oEditor.EditorDocument.body.innerText);
            if (temps != null && temps.length > 0) {
                for (j = 0; j < temps.length; j++) {
                    var imghtml = "<img src=\"" + temps[j].src + "\" alt=\"" + temps[j].alt + "\" width=\"" + temps[j].width + "\" height=\"" + temps[j].height + "\" align=\"" + temps[j].align + "\">";
                    html = html.replace("#FormatImgID_" + j + "#", imghtml);
                }
            }
            oEditor.SetHTML(html);
        } else {
            var html = processFormatText(tmpText);
            sec.pasteHTML(html);
        }
    }
    else
        alert('���������ģʽ�²�����');
}

function DBC2SBC(str) {
    var result = '';
    for (var i = 0; i < str.length; i++) {
        code = str.charCodeAt(i);
        // ��65281���ǡ���������65373���ǡ���������65292���ǡ���������ת��"��"

        if (code >= 65281 && code < 65373 && code != 65292 && code != 65306) {
            //  ��65248����ת�����
            result += String.fromCharCode(str.charCodeAt(i) - 65248);
        } else {
            result += str.charAt(i);
        }
    }
    return result;
}

function processFormatText(textContext) {
    var text = DBC2SBC(textContext);
    var prefix = "����";
    var tmps = text.split("\n");
    var html = "";
    for (i = 0; i < tmps.length; i++) {
        var tmp = tmps[i].trim();
        if (tmp.length > 0) {
            html += "<p>����" + tmp + "</p>\n";
        }
    }
    return html;
}

String.prototype.trim = function()
{
    return this.replace(/(^[\s��]*)|([\s��]*$)/g, "");
};

String.prototype.leftTrim = function()
{
    return this.replace(/(^\s*)/g, "");
};

String.prototype.rightTrim = function()
{
    return this.replace(/(\s*$)/g, "");
};


// Register the related command
FCKCommands.RegisterCommand('Format168', new FCKFormat168('Format168'));