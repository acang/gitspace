//注册Code命令.
FCKCommands.RegisterCommand('Media', new FCKDialogCommand('Media', FCKLang.MediaDlgTitle, FCKPlugins.Items['media'].Path + 'media.html', 600, 250));

// 注册名为”Media”的工具栏按钮
var oMediaItem = new FCKToolbarButton('Media', FCKLang.MediaBtn) ;
oMediaItem.IconPath = FCKPlugins.Items['media'].Path + 'media.gif';

FCKToolbarItems.RegisterItem('Media', oMediaItem);


// 创建FCKCodes对象，通过FCKCodes对象处理工具栏按钮的操作
var FCKMedias = new Object() ;

FCKMedias.Add = function (mediaHeight, mediaWidth, mediaFile) {
    var oMedia = FCK.CreateElement('EMBED');
    oMedia.src = mediaFile;
    oMedia.Height = mediaHeight;
    oMedia.Width = mediaWidth;
}