// ONLY CHANGE BELOW HERE
FCKConfig.SkinPath = FCKConfig.BasePath + 'skins/silver/';

FCKConfig.Plugins.Add( 'heightline', 'en,zh,zh-cn' ) ;

FCKConfig.ToolbarSets["Plugin"] = [
    ['Source','Preview','Templates'],
    ['Undo','Redo','-','SelectAll','Cut','Copy','Paste','-','RemoveFormat','-','Find','Replace'],
    ['Link','Unlink','Anchor'],
    ['FitWindow','-','About'],
    '/',
    ['Bold','Italic','Underline','StrikeThrough','-','Subscript','Superscript'],
    ['OrderedList','UnorderedList','-','Outdent','Indent'],
    ['JustifyLeft','JustifyCenter','JustifyRight','JustifyFull'],
    ['Image','Flash','Table','Rule','Smiley'],
    '/',
    ['Style','FontFormat','FontName','FontSize'],
    ['TextColor','BGColor'],
    ['-','HeightLine']
] ;