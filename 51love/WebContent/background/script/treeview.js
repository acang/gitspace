/*---------------------------------------
 ImageList��(��дΪ:Ilt)
 length:���ImageList�ĳ���
 add:����һ��Image��add
 remove:ɾ��һ��Image��
 removeAll:���ImageList
---------------------------------------*/
function ImageList() {
	this.length = 0;
	this.add = IltAdd;
	this.remove = IltRemove;
	this.clear = IltClear;
}

/*---------------------------------------
 ����һ��Image��
 imageURL:Image�ĵ�ַ
 index:�����λ��,���ʡ�ԣ����������
---------------------------------------*/
function IltAdd(imageURL,index) {
	var image = new Image();
	image.src = imageURL;

	if (typeof(index) != "number" || (typeof(index) == "number" && index >= this.length)) {
		index = this.length;
	}

	this.length ++;

	if (index < this.length -2) {
		for (var i = this.length - 2;i >= index;i --)
			this[i + 1] = this[i];
	}
	this[index] = image;
	delete image;
	return this[index];
}

/*---------------------------------------
 ɾ��һ��Image��
 index:Ҫɾ����λ��
---------------------------------------*/
function IltRemove(index) {
	if (typeof(index) != "number") return false;
	if (index < 0 || index > this.length) return false;
	var i = -1;
	for (i = index;i < this.length - 1;i ++)
		this[i] = this[i + 1];
	delete	this[length - 1];
	this.length --;
	return true;
}

/*---------------------------------------
 ���ImageList
---------------------------------------*/
function IltClear() {
	var i = -1;
	for (i = 0;i < this.length;i ++)
		delete	this[i];
	this.length = 0;
}

//var sTreeviewImageDir = "images/treeview/";
var sCollapseImage = sTreeviewImageDir + "collapse.gif";
var sExpandImage = sTreeviewImageDir + "expand.gif";
var sHLineImage = sTreeviewImageDir + "hline.gif";
var sVineImage = sTreeviewImageDir + "vline.gif";
var sVTopLineImage = sTreeviewImageDir + "vtopline.gif";
var sVCenterLineImage = sTreeviewImageDir + "vcenterline.gif";
var sVBottomLineImage = sTreeviewImageDir + "vbottomline.gif";
var sSpaceImage = sTreeviewImageDir + "space.gif";

var TvwCollapse = 0;
var TvwExpand = 1;
var TvwHLine = 2;
var TvwVLine = 3;
var TvwVTopLine = 4;
var TvwVCenterLine = 5;
var TvwVBottomLine = 6;
var TvwSpace = 7;

var TvwImageList = new ImageList();
TvwImageList.add(sCollapseImage);
TvwImageList.add(sExpandImage);
TvwImageList.add(sHLineImage);
TvwImageList.add(sVineImage);
TvwImageList.add(sVTopLineImage);
TvwImageList.add(sVCenterLineImage);
TvwImageList.add(sVBottomLineImage);
TvwImageList.add(sSpaceImage);

var TvwFirst = 0;		// ��������ͬ���ֵܽڵ���ǰ
var TvwLast = 1;		// ��������ͬ���ֵܽڵ����
var TvwNext = 2;		// ����ͬ���ֵܽڵ�֮��
var TvwPrevious = 3;	// ����ͬ���ֵܽڵ�֮ǰ
var TvwChild = 4;		// ������ؽڵ���ֽڵ��ֵܵ����

function TreeView(name,left,top,width,height,borderStyle) {
	// ����
	this.borderStyle = borderStyle;
	this.checkBoxs = false;
	this.font = "messagebox"; //8pt MS Sans Serif;9pt ����;8pt Tahoma
	this.hotTracking = true;
	this.imageList = null;
	this.length = 0;
	this.name = name;
	this.sorted = false;
	this.showed = false;
	this.showLines = true;
	this.showPlusMinus = true;
	this.showRootLines = true;
	this.top = top;
	this.left = left;
	this.width = width;
	this.height = height;
	this.selectedNode = null
	this.selectedNodeObject = null;

	// �ڵ㼯��
	this.nodes = new Nodes();

	// ����
	this.collapse = TvwCollapseNode;
	this.show = TvwShow;
	this.refresh = TvwRefresh;
	this.refreshItemText = TvwRefresh1;
	this.expand = TvwExpandNode;
	this.expandRoot = TvwExpandRootNode;
	this.expandTo = TvwExpandToNode;

	// �¼�
	this.onNodeClick = null;
	this.onContextMenu = null;
	this.onKeyDown = null;

	this.nodeClick = TvwNodeClick;
	this.keyHandle = TvwKeyHandle;
	this.plusMinusClick = TvwPlusMinusClick;
	this.contextMenu = TvwContextMenu;

	// ��������������
	var sTreeviewScript = "";
	sTreeviewScript = sTreeviewScript + "<DIV LANGUAGE=javascript oncontextmenu=\"event.returnValue=false;\" ondragstart=\"event.returnValue=false;\" onselectstart=\"event.returnValue=false;\"";
	sTreeviewScript = sTreeviewScript + "id=" + this.name + " style=\"" + "LEFT: " + this.left + ";TOP:" + this.top;
	sTreeviewScript = sTreeviewScript + ";WIDTH: " + this.width + ";HEIGHT:" + this.height+ ";" + "BORDER: " + borderStyle;
	sTreeviewScript = sTreeviewScript + ";OVERFLOW: auto;POSITION: absolute;PADDING: 1px;CURSOR: default;\">" + "</DIV>";

	document.write(sTreeviewScript) ;
}

function Nodes() {
	this.length = 0;					// �ڵ㼯���нڵ������
	this.add = TvwAdd;					// �ڼ���������һ���ڵ�
	this.clear = TvwClear;				// ������нڵ�
	this.remove = TvwRemove;			// ɾ��ĳ���ڵ�
	this.item = TvwItem;				// ����ĳ���ڵ�
	this.children = new Array();
	this.keys = new ActiveXObject("Scripting.Dictionary");
}

function Node() {
	this.checked = 0;					// �ýڵ��Ƿ�ѡ��(0:Unchecked;1:Gray;2:Checked)
	this.child = null;					// �ýڵ�ĵ�һ�����ӵ�ָ��
	this.children = new Array();		// �ýڵ㺢��
	this.expanded = false;				// �ýڵ��Ƿ�չ��
	this.expandedImage = "";			// �ýڵ��չ��ͼ��
	this.firstSibling = null;			// �ýڵ�ĵ�һ���ֵ�
	this.image = "";					// �ýڵ��ͼ��
	this.index = -1;					// �ڽڵ㼯���е�Ψһ���
	this.indent = "";
	this.key = "";						// �ڽڵ㼯���е�Ψһ��ֵ
	this.lastSibling = null;			// �ýڵ�����һ���ֵ�
	this.next = null;					// �ýڵ����һ���ֵ�
	this.parent = null;					// �ýڵ�ĸ�һ���ڵ�
	this.previous = null;				// �ýڵ��ǰһ���ֵ�
	this.root = null;					// �Ը��ڵ������
	this.selected = false;				// �Ƿ�ѡ��
	this.selectedImage = "";			// ��ѡ��ʱ��ͼ��
	this.siblingIndex = -1;				// �ֵ�˳��ֵ
	this.sorted = false;				// �Ƿ���ĸ˳������
	this.tag = "";						// �ýڵ�ı�ǩ
	this.text = "";						// ��ʾ�ı�
	this.pagePath="";       //�����ڵ�ʱ��Ҫ��ʾҳ���·��/*����� 2004.4.14 20:20*/

	this.getFirstChild = TvwGetFirstChild;
	this.getFirstSibling = TvwGetFirstSibling;
	this.getLastSibling = TvwGetLastSibling;
	this.getNextSibling = TvwGetNextSibling;
	this.getPreviousSibling = TvwGetPreviousSibling;
}

function TvwGetFirstChild() {
	if (this.children.length == 0) return null;

}

function TvwGetFirstSibling() {

}

function TvwGetLastSibling() {

}

function TvwGetNextSibling() {

}

function TvwGetPreviousSibling() {

}

function TvwAdd(relative, relationship, key, text, image, selectedImage) {
	if (relative != "") {
		if (! this.keys.Exists(relative)) {
			//window.alert("���ڵ㲻����!");
			return null;
		}
	}
	if (key == "") {
		//window.alert("�ڵ�Ĺؼ��ֲ���Ϊ��!");
		return null;
	}
	if (this.keys.Exists(key)) {
		//window.alert("�ڵ�Ĺؼ����Ѿ�����!");
		return null;
	}
	if (typeof(image) != "number")
		image = -1;
	if (typeof(selectedImage) != "number")
		selectedImage = -1;

	var index = this.length ++;

	var node=new Node();
	node.index =  index;
	node.key = key;
	node.text = text;
	node.image = image;
	node.selectedImage = selectedImage;


	this.keys.Add(key,index);

	var children = new Array();
	var parent;
	var startIndex = 0;
	var endIndex = -1;
	var nodeIndex = 0;
	if (relative == "") {
		children = this.children;
		parent = null;
	}
	else {
		nodeIndex = this.keys.Item(relative);
		if ((relative != "" ) &&
			(relationship == 0 || relationship == 1 ||
			relationship == 2 || relationship == 3)) {
			parent = this[nodeIndex].parent;
			if (parent == null)
				children = this.children;
			else
				children = parent.children;
			startIndex = this[nodeIndex].siblingIndex;
		}
		else {
			children = this[nodeIndex].children;
			parent = this[nodeIndex];
			relationship = 4;
		}
	}

	node.parent = parent;

	switch (relationship) {
		case 0:
			startIndex = 0;
			break;
		case 1:
			startIndex = children.length;
			break;
		case 2:
			startIndex ++;
			if (startIndex > children.length)
				startIndex = children.length;
			break;
		case 3:
			startIndex --;
			if (startIndex < 0)
				startIndex = 0;
			break;
		default:
			startIndex = children.length;
			break;

	}
	endIndex = children.length - 1;
	children.length ++;
	for (var i = endIndex; i >= startIndex;i --) {
		children[i].siblingIndex = i + 1;
		children[i + 1] = children[i];
	}
	node.siblingIndex = startIndex;
	children[startIndex] = node;

	this[index] = node;

	delete node;
	return this[index];
}

function TvwRemove(item) {
	var index;
	var node;

	if (typeof(item) == "number" && Math.round(item) == item)
		index = item;
	else if (typeof(item) == "string") {
		node = this.item(item);
		if (node != null)
			index = node.index;
		else
			index = -1;
	}
	else
		index = -1;

	if (index != -1) {
		var sIndex = this[index].siblingIndex;
		node = this[index].parent;
		for (var i = sIndex + 1; i < node.children.length;i ++) {
			node.children[i].siblingIndex = i - 1;
			node.children[i - 1] = node.children[i];
		}
		node.children.length -- ;
		this.keys.Remove(this[index].key);
	}
}

function TvwClear() {
	this.children = new Array();
	var i;
	for (i = 0;i< this.children.length;i ++) {
		delete this.children[i];
	}
	this.children.length = 0;
	for (i = 0;i< this.length;i ++)
		delete this[i];
	this.length = 0;
	this.keys.RemoveAll();
}

function TvwItem(key) {
	if (! this.keys.Exists(key)) return null;
	var index;
	index = this.keys.Item(key);

	return this[index];
}

function TvwPlusMinusClick(index) {
	if (this.nodes[index].expanded) {
		this.collapse(index);
	}
	else {
		this.expand(index);
	}
}

function TvwCollapseNode(index) {
	if (this.nodes[index].children.length > 0) {
		var childObject = document.all[this.name + "_NODE_" + index + "_CHILD"];
		var plusObject = document.all[this.name + "_NODE_" + index + "_PLUS"];
		if (this.nodes[index].expanded) {
			if (typeof(plusObject) == "object")
				plusObject.src = TvwImageList[TvwCollapse].src;
			childObject.style.display = "none";
			this.nodes[index].expanded = false;
		}
	}
}

function TvwExpandNode(index) {
	if (this.nodes[index].children.length > 0) {
		var childObject = document.all[this.name + "_NODE_" + index + "_CHILD"];
		var plusObject = document.all[this.name + "_NODE_" + index + "_PLUS"];
		if (! this.nodes[index].expanded) {
			if (typeof(plusObject) == "object")
				plusObject.src = TvwImageList[TvwExpand].src;
			childObject.style.display = "";
			this.nodes[index].expanded = true;
		}
	}
}

function TvwExpandToNode(item) {
	var index;
	var node;
	if (typeof(item) == "number" && Math.round(item) == item)
		index = item;
	else if (typeof(item) == "string") {
		node = this.nodes.item(item)
		if (node != null)
			index = node.index;
		else
			index = -1;
	}
	else
		index = -1;
	if (index != -1) {
		node = this.nodes[index];
		do {
			index = node.index;
			this.expand(index);
			node = node.parent;
		} while (node != null)
	}
}

function TvwExpandRootNode() {
	for (var i = 0;i < this.nodes.children.length;i ++)
		this.expand(this.nodes.children[i].index);
}

function TvwCreate(treeview,node,indent,imageString) {
	// �ڵ�ĺ�������Ϊ0,���ؿմ�
	if (node.children.length == 0) return "";

	var sCreate = "";
	var i;

	for (i = 0;i < node.children.length;i ++) {
		sCreate = sCreate + TvwCreateNode(treeview,node.children[i],indent,imageString);
	}
	return sCreate;
}

function TvwCreateNode(treeview,node,indent,imageString) {
	if (typeof(indent) != "string") indent = "";
	if (typeof(imageString) != "string") imageString = "";

	var sCreate = "";
	var i;
	var bShowRootLines= treeview.showRootLines;
	var bShowLines = treeview.showLines;
	var bShowPlusMinus = treeview.showPlusMinus;
	if (! bShowLines && ! bShowPlusMinus) bShowRootLines = false;

	var sPlusMinus = "";
	var sLine = "";
	var sIndent = "";
	var sImageString = "";
	var nSelectedImage;
	var sPlusID;

	sCreate = sCreate + "<DIV NOWRAP id=" + treeview.name + "_NODE_" + node.index;
	sCreate = sCreate + " style=\"" + "FONT: " + treeview.font + ";WIDTH: 100%" + "\">";
	sPlusID = "";
	if (bShowPlusMinus) {
		if  (node.children.length == 0) {
			sPlusMinus = TvwImageList[TvwSpace].src;
			sPlusID = "id=" + treeview.name + "_NODE_" + node.index + "_PLUS ";
			sPlusID = sPlusID + " LANGUAGE=javascript onclick=\"" + treeview.name + ".plusMinusClick("+ node.index + ");\" ";
		}
		else {
			sPlusMinus =((node.expanded == true) ? TvwImageList[TvwExpand].src : TvwImageList[TvwCollapse].src);
			sPlusID = "id=" + treeview.name + "_NODE_" + node.index + "_PLUS ";
			sPlusID = sPlusID + " LANGUAGE=javascript onclick=\"" + treeview.name + ".plusMinusClick("+ node.index + ");\" ";
		}
	}
	else
		sPlusMinus = TvwImageList[TvwSpace].src;
	if (bShowLines) {
		// ���Ҫ��ʾ����
		sCreate = sCreate + imageString;
		if (bShowRootLines && node.parent == null) {
			// Ҫ��ʾ���ڵ�����,���Һ��ӵĸ����ڵ�Ϊ��(�������ǵ�һ���ڵ�)
			if (treeview.nodes.children.length == 1) {
				// ֻ��һ������
				sLine = TvwImageList[TvwHLine].src;
				sIndent = indent + "0";
				sImageString = imageString + "<IMG align=absMiddle width=20 height=16 src=\"" + TvwImageList[TvwSpace].src + "\">";
			}
			else {
				// �Զ�����ӵĴ���
				if (node.siblingIndex == 0) {
					sLine = TvwImageList[TvwVTopLine].src;
					sIndent = indent + "1";
					sImageString = imageString + "<IMG align=absMiddle width=20 height=16 src=\"" + TvwImageList[TvwVLine].src + "\">";
				}
				else if (node.siblingIndex == treeview.nodes.children.length - 1) {
					sLine = TvwImageList[TvwVBottomLine].src;
					sIndent = indent + "0";
					sImageString = imageString + "<IMG align=absMiddle width=20 height=16 src=\"" + TvwImageList[TvwSpace].src + "\">";
				}
				else {
					sLine = TvwImageList[TvwVCenterLine].src;
					sIndent = indent + "1";
					sImageString = imageString + "<IMG align=absMiddle width=20 height=16 src=\"" + TvwImageList[TvwVLine].src + "\">";
				}
			}

			sCreate = sCreate + "<IMG " + sPlusID + "align=absMiddle width=20 height=16 style=\"";
			sCreate = sCreate + "BACKGROUND-IMAGE: url(" + sLine + "); ";
			sCreate = sCreate + "WIDTH: 20px; HEIGHT: 16px \" ";
			sCreate = sCreate + " src=\"" + sPlusMinus + "\">";
		}
		else if (! bShowRootLines && node.parent == null) {
			// ��Ҫ��ʾ���ڵ�����,���Һ��ӵĸ����ڵ�Ϊ��(�������ǵ�һ���ڵ�)
		}
		else {
			// �ǵ�һ���ڵ�Ĵ���
			if (node.siblingIndex == node.parent.children.length - 1) {
				sLine = TvwImageList[TvwVBottomLine].src;
				sIndent = indent + "0";
				sImageString = imageString + "<IMG align=absMiddle width=20 height=16 src=\"" + TvwImageList[TvwSpace].src + "\">";
			}
			else {
				sLine = TvwImageList[TvwVCenterLine].src;
				sIndent = indent + "1";
				sImageString = imageString + "<IMG align=absMiddle width=20 height=16 src=\"" + TvwImageList[TvwVLine].src + "\">";
			}
			sCreate = sCreate + "<IMG " + sPlusID + "align=absMiddle width=20 height=16 style=\"";
			sCreate = sCreate + "BACKGROUND-IMAGE: url(" + sLine + "); ";
			sCreate = sCreate + "WIDTH: 20px; HEIGHT: 16px \" ";
			sCreate = sCreate + " src=\"" + sPlusMinus + "\">";
		}
	}
	else {
		// ��Ҫ��ʾ����
		sCreate = sCreate + imageString;
		if (bShowRootLines && node.parent == null) {
			// Ҫ��ʾ���ڵ�����,���Һ��ӵĸ����ڵ�Ϊ��(�������ǵ�һ���ڵ�)
			sIndent = indent + "0";
			sImageString = imageString + "<IMG align=absMiddle width=20 height=16 src=\"" + TvwImageList[TvwSpace].src + "\">";
			sCreate = sCreate + "<IMG " + sPlusID + "align=absMiddle width=20 height=16 style=\"";
			sCreate = sCreate + "WIDTH: 20px; HEIGHT: 16px \" ";
			sCreate = sCreate + " src=\"" + sPlusMinus + "\">";
		}
		else if (! bShowRootLines && node.parent == null) {
			// ��Ҫ��ʾ���ڵ�����,���Һ��ӵĸ����ڵ�Ϊ��(�������ǵ�һ���ڵ�)
		}
		else {
			// �ǵ�һ���ڵ�Ĵ���
			sIndent = indent + "0";
			sImageString = imageString + "<IMG align=absMiddle width=20 height=16 src=\"" + TvwImageList[TvwSpace].src + "\">";
			sCreate = sCreate + "<IMG " + sPlusID + "align=absMiddle width=20 height=16 style=\"";
			sCreate = sCreate + "WIDTH: 20px; HEIGHT: 16px \" ";
			sCreate = sCreate + " src=\"" + sPlusMinus + "\">";
		}
	}
	node.indent = sIndent;

	sCreate = sCreate + "<FONT id=" + treeview.name + "_NODE_" + node.index + "_TEXT style=\"Cursor:hand;HEIGHT:100%;\" LANGUAGE=javascript onclick=\"" + treeview.name + ".nodeClick(" + node.index + ");\" nodeIndex=\"" + node.index + "\" ";
	sCreate = sCreate + "ondblclick=\"" + treeview.name + ".plusMinusClick("+ node.index + ");\" oncontextmenu=\"" + treeview.name + ".contextMenu(" + node.index + ");\" title=\"" + node.text + "\">";
	if ((treeview.imageList != null) && (node.image >= 0 && node.image < treeview.imageList.length)) {
		if (node.selectedImage >= 0 && node.selectedImage < treeview.imageList.length)
			nSelectedImage = node.selectedImage;
		else
			nSelectedImage = -1;
		sCreate = sCreate + "<IMG normalIMG=\"" + node.image + "\" selectedIMG=\"" + nSelectedImage + "\" align=absMiddle style=\"WIDTH: 16px;HEIGHT: 16px;MARGIN-RIGHT: 2px;\" src=\"" + treeview.imageList[node.image].src + "\">"
	}
	sCreate = sCreate + "<FONT id=" + treeview.name + "_NODE_" + node.index + "_ITEMTEXT style=\"PADDING-RIGHT: 2px;PADDING-LEFT: 2px;COLOR: windowtext;FONT: " + treeview.font + "\">" + node.text + "</FONT>";
	sCreate = sCreate + "</FONT>"
	sCreate = sCreate + "</DIV>" + "\n";
	if (node.children.length != 0) {
		sCreate = sCreate + "<DIV NOWRAP id=" + treeview.name + "_NODE_" + node.index + "_CHILD style=\"display:" + ((node.expanded == true) ? "" : "none") + ";\">" + "\n";
		sCreate = sCreate + TvwCreate(treeview,node,sIndent,sImageString);
		sCreate = sCreate + "</DIV>" + "\n";
	}
	return sCreate;
}

function TvwNodeClick(index) {
	if (! this.nodes[index].selected) {
		var selectedNode =(this.selectedNodeObject == null) ? null : document.all[this.selectedNodeObject];
		var nIndex;
		if (selectedNode != null) {
			if (selectedNode.children.length == 2) {
				nIndex = parseInt(selectedNode.children[0].selectedIMG);
				if (nIndex != -1) {
					nIndex = parseInt(selectedNode.children[0].normalIMG)
					selectedNode.children[0].src = this.imageList[nIndex].src;
				}
				selectedNode.children[1].style.backgroundColor = "";
				selectedNode.children[1].style.color = "windowtext";
			}
			else {
				selectedNode.children[0].style.backgroundColor = "";
				selectedNode.children[0].style.color = "windowtext";
			}
			nIndex = parseInt(selectedNode.nodeIndex)
			this.nodes[nIndex].selected = false;
		}
		if (this.onNodeClick != null) {
			this.onNodeClick(index);
		}
		selectedNode = document.all[this.name + "_NODE_" + index + "_TEXT"];
		if (selectedNode.children.length == 2) {
			nIndex = parseInt(selectedNode.children[0].selectedIMG);
			if (nIndex != -1) {
				selectedNode.children[0].src = this.imageList[nIndex].src;
			}
			selectedNode.children[1].style.backgroundColor = "highlight";
			selectedNode.children[1].style.color = "highlighttext";
		}
		else {
			selectedNode.children[0].style.backgroundColor = "highlight";
			selectedNode.children[0].style.color = "highlighttext";
		}
		this.selectedNodeObject = this.name + "_NODE_" + index + "_TEXT";
		this.selectedNode = this.nodes[index];
		this.nodes[index].selected = true;
	}
	else
	        if (this.onNodeClick != null) {
			this.onNodeClick(index);
		}
}

function TvwContextMenu(index) {
	if (this.onContextMenu != null) {
		this.onContextMenu(index);
	}
}

function TvwKeyHandle() {

}

function TvwShow() {
	var sCreateTree = "";
	sCreateTree = TvwCreate(this,this.nodes,"");
	document.all[this.name].innerHTML = sCreateTree;
}

function TvwRefresh(item) {
	var index;
	if (typeof(item) == "number" && Math.round(item) == item)
		index = item;
	else if (typeof(item) == "string") {
		var node;
		node = this.nodes.item(item);
		if (node != null)
			index = node.index;
		else
			index = -1;
		delete node;
	}
	else
		index = -1;

	if (index == -1) {
		this.show();
		return;
	}

	var sCreateTree = "";
	var i = 0;
	var sImageIndent = "";
	var sIndent = "";

	var objNode = document.all[this.name + "_NODE_" + index];

	if (objNode != null) {
		var sPlusMinusID = this.name + "_NODE_" + index + "_PLUS";
		var sChildDivID = this.name + "_NODE_" + index + "_CHILD";
		var sCreateHTML = objNode.outerHTML;
		if (document.all[sChildDivID] != null)
			document.all[sChildDivID].outerHTML = "";
		if (this.nodes[index].children.length > 0) {
			sIndent = this.nodes[index].indent;
			for (i = 0;i < sIndent.length; i ++)
				sImageIndent += ((sIndent.charAt(i) == "1") ? "<IMG align=absMiddle width=20 height=16 src=\"" + TvwImageList[TvwVLine].src + "\">" : "<IMG align=absMiddle width=20 height=16 src=\"" + TvwImageList[TvwSpace].src + "\">");
			sCreateTree = sCreateTree + "<DIV NOWRAP id=" + this.name + "_NODE_" + index + "_CHILD style=\"display:" + ((this.nodes[index].expanded == true) ? "" : "none") + ";\">" + "\n";
			sCreateTree = sCreateTree + TvwCreate(this,this.nodes[index],sIndent,sImageIndent);
			sCreateTree = sCreateTree + "</DIV>" + "\n";
		}
		objNode.outerHTML = sCreateHTML + sCreateTree;
		if (this.nodes[index].children.length > 0)
			document.all[sPlusMinusID].src = (this.nodes[index].expanded == true) ? TvwImageList[TvwExpand].src : TvwImageList[TvwCollapse].src;
		else
			document.all[sPlusMinusID].src = TvwImageList[TvwSpace].src;
	}
	else {
		if (this.nodes[index].parent != null)
			sIndent = this.nodes[index].parent.indent;
		for (i = 0;i < sIndent.length; i ++)
			sImageIndent += ((sIndent.charAt(i) == "1") ? "<IMG align=absMiddle width=20 height=16 src=\"" + TvwImageList[TvwVLine].src + "\">" : "<IMG align=absMiddle width=20 height=16 src=\"" + TvwImageList[TvwSpace].src + "\">");
		sCreateTree = sCreateTree + TvwCreateNode(this,this.nodes[index],sIndent,sImageIndent);
	}
}

function TvwRefresh1(item,sNewItemText) {
		var index;
	if (typeof(item) == "number" && Math.round(item) == item)
		index = item;
	else if (typeof(item) == "string") {
		var node;
		node = this.nodes.item(item);
		if (node != null)
			index = node.index;
		else
			index = -1;
		delete node;
	}
	else
		index = -1;

	if (index == -1) {
		return;
	}

	var objNode = document.all[this.name + "_NODE_" + index];

	if (objNode != null) {
		var itemTextObject = document.all[this.name + "_NODE_" + index + "_ITEMTEXT"];
		this.nodes[index].text = sNewItemText;
		itemTextObject.innerText = sNewItemText;
	}
}