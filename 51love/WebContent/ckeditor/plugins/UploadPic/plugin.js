(function () {
 CKEDITOR.plugins.add('UploadPic',
{    init: function(editor)
    {
        var pluginName = 'UploadPic';
        CKEDITOR.dialog.add(pluginName, this.path + 'dialogs/UploadPic.js');
        editor.addCommand(pluginName, new CKEDITOR.dialogCommand(pluginName));
        editor.ui.addButton('UploadPic',
            {
                label: '�ϴ�ͼƬ',
                command: pluginName,
				icon: CKEDITOR.plugins.getPath('UploadPic') + 'uploadpic.png'
            });
    }
}); 

 })();