//ע��Code����.
FCKCommands.RegisterCommand('Media', new FCKDialogCommand('Media', FCKLang.MediaDlgTitle, FCKPlugins.Items['media'].Path + 'media.html', 600, 250));

// ע����Ϊ��Media���Ĺ�������ť
var oMediaItem = new FCKToolbarButton('Media', FCKLang.MediaBtn) ;
oMediaItem.IconPath = FCKPlugins.Items['media'].Path + 'media.gif';

FCKToolbarItems.RegisterItem('Media', oMediaItem);


// ����FCKCodes����ͨ��FCKCodes������������ť�Ĳ���
var FCKMedias = new Object() ;

FCKMedias.Add = function (mediaHeight, mediaWidth, mediaFile) {
    var oMedia = FCK.CreateElement('EMBED');
    oMedia.src = mediaFile;
    oMedia.Height = mediaHeight;
    oMedia.Width = mediaWidth;
}