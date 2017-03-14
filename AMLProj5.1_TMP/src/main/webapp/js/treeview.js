//***********************************************************
//
//  ����һ����, ��������Ϊ"TREE".
//
//
//***********************************************************
function CreateTree() {
	TREE = new _TreeView_Object();
}
//
//  ��������Ӧ����¼�����, һ�����Ϊ onclick="clickTree(this);" .
//
function clickTree(obj) {
	TREE.onClick(obj.id);
}
//***********************************************************
//
//  ��������.
//
//***********************************************************
function _TreeView_Object() {
	//ͼ����ʼ�ο�λ��
	var path= '';

	var codebase = '../../images/img/';

	this.ICON_BASE=codebase;

	//ͨ�����ڵ�����ͼ��
	//΢���׼������ṹͼ��
	this.TEXT_NORMAL=null;
	this.TEXT_BRIGHT=null;

	this.TREE_ROOT=this.ICON_BASE+'web.gif';
	this.TREE_BLANK=this.ICON_BASE+'empty.gif';
	this.TREE_BRANCH_BOTTOM=this.ICON_BASE+'L1.gif';
	this.TREE_BRANCH_MIDDLE=this.ICON_BASE+'T1.gif';
	this.TREE_BRANCH_NONE=this.ICON_BASE+'I1.gif';
	this.TREE_CLOSED_BOTTOM=this.ICON_BASE+'plus_end.gif';
	this.TREE_CLOSED_MIDDLE=this.ICON_BASE+'Tplus.gif';
	this.TREE_OPEN_BOTTOM=this.ICON_BASE+'minus_end.gif';
	this.TREE_OPEN_MIDDLE=this.ICON_BASE+'Tminus.gif';
	this.TREE_FOLDER_OPEN=this.ICON_BASE+'open.gif';
	this.TREE_FOLDER_CLOSED=this.ICON_BASE+'close.gif';
	this.TREE_LEAF=this.ICON_BASE+'file2.gif';

	this.baseId=null;
	this.targetId=null;
	this.targetWin=null;
	this.queryString='';

	// ��ǰ������ڽڵ�
	this.selectedNode=null;

	this.nodeList=new Array();

        this.nodeListLength=0;

        this.nodeListIndex=new Array();

	this.insertNode=_tv_insertNode;  // �����µĽڵ�
        this.add=_tv_addNode;  // �����µĽڵ�
	this.show=_tv_show; // ��ʾ��
	this.onClick=_tv_onClick;  // ��Ӧ���Ϸ����ĵ���¼�
	this.findNode=_tv_findNode; // ����ID ���ҽڵ�

	this.setTarget=_tv_setTarget;  // ���ò�ѯ�����Ŀ��
	this.setQueryString=_tv_setQueryString; // ���ò�ѯ�ַ���

}
//
// ���ò�ѯ�ַ���
//
function _tv_setQueryString(s) {
	this.queryString=s;
}
//
//  ����һ���½ڵ�.
//
function _tv_insertNode(nd) {
	var idx;
	//if(nd.type==null)
		idx=nd.id;
	//else
	//	idx=nd.type+nd.id;
	this.nodeList[idx]=nd;

        this.nodeListIndex[idx]=this.nodeListLength;
        this.nodeListLength=eval(this.nodeListLength+1);


}

//
//  ����һ���½ڵ�.
//
function _tv_addNode(id,parentId,title,remark) {
	var nd=new Node(id,title,null,null,parentId,remark,null,null);
        this.insertNode(nd);
}
//
//  ��Ӧ����¼�.
//
function _tv_onClick(srcElementId) {
	id=srcElementId.substring(3);
	region=srcElementId.substring(0,3);

	var nd=this.nodeList[id];

	if(region=="TB_") {
		nd.startExpand();
	}
	else if(region=="TT_" || region=="TI_") {
		if(!(nd.status=='opened')){//��״̬���õ���չ����ʽ
			nd.expand();
		}
		nd.startQuery();
	}
}
//
// ����ID ���ҽڵ�
//
function _tv_findNode(id) {
	var idx;
	for(idx in this.nodeList) {
		if(this.nodeList[idx].id==id)
			return this.nodeList[idx];
	}
	return null;
}
//
//  ����������: baseId;
//  ���������: targetId(������NoFrame �����ʽ,�����Frame ,����Ϊ null);
//  ���������: targetWin(������Frame �����ʽ,�����NoFrame ,����Ϊ null);
//
function _tv_setTarget(baseId,targetId,targetWin) {
	this.baseId=baseId;
	this.targetId=targetId;
	this.targetWin=targetWin;
}
//
//  ��ʾ��,�Զ�չ�����ڵ㼰����һ��.
//
function _tv_show() {
	// ���û�нڵ����,�򷵻�


	if(this.nodeList.length==0)
		return false;

	// ���Ҹ��ڵ�
	var found=false;
	var idx;



	for (idx in this.nodeList){
		if(this.nodeList[idx].parentId==null) {
			found=true;
			break;
		}
	}
	// ���û���ҵ����ڵ�,�򷵻�
	if(!found)
		return false;



	// �õ����ڵ�,ֻ��һ�����ڵ�
	var nd=this.nodeList[idx];
	var id=nd.id;
	var name=nd.title;

	//
	// TB=Tree Branch;  TI=Tree node Image;  TT=Tree branch Text;  TX=Tree eXpand tree
	//
	s="<nobr><div style=\"font-size:9pt;height:0px;position:relative;margin: 0px;marginLeft:0px;marginTop:0px;marginTop:0px; marginBottom:0px;\">"+
//		"<nobr><img style=\"cursor:hand\" id=\"TB_"+id+"\" onClick=\"clickTree(this);\" src=\""+this.TREE_ROOT+"\" border=0 align=absmiddle>"+
		"<span style=\"cursor:hand\" id=TT_"+id+" onClick=\"clickTree(this);\" color=\""+this.TEXT_NORMAL+"\">"+name+"</span></nobr></div>";
	s+="<font style=\"font-size:9pt;\" id=TX_"+id+"></font></nobr>";
	//
	// �����.
	//
	eval('document.all["'+this.baseId+'"].innerHTML=s');

	nd.startExpand();
	nd.setFocus();
}

//
// ���ڵ������:
//    id          : �ڵ��ID
//    title       : �ڵ������
//    type        : �ڵ������Զ��壩
//    flag        : �ڵ�״̬���Զ��壩
//    selected    : �ڵ��Ƿ�ѡ��
//    parentId    : �ڵ�ĸ��ڵ�ID
//    remark      : ��ע
//    iconOpen    : �Է�֧�ڵ�,��ʾ�ڵ�򿪵�ͼ�꣬��Ҷ�ӽڵ��ʾ�������λ��
//    iconClose   : �Է�֧�ڵ�,��ʾ�ڵ�رյ�ͼ�꣬��Ҷ�ӽڵ��ʾ�����ȥ
//
// ����¼��򷽷�:
//    startExpand : �ڵ���������չ��/�ر�
//    startQuery  : �ڵ��ѯ
//    setFocus    : ���ýڵ���״̬
//    locate      : ��ѯ�붨λ
//    expand      : չ������
//    collapse    : �ر�����
//
// ��䷽��,�ɳ���Ա��д:
//    getChildren   : ���ص�ǰ�ڵ㺢���ǽڵ�����,��������,�����ӽڵ�.
//    getQuery      : ���ص�ǰ�ڵ��ѯ���,�����NoFrame��ʽ,��Ϊ��ʽ��HTML �ַ���,����ΪURL ��ʽ���ַ���.
//
function Node(id,title,type,flag,parentId,remark,iconOpen,iconClose) {
	// �ڵ����Գ�ʼ������

	this.id=id;
	this.title=title;
	this.type=type;
	this.flag=flag;
        this.parentId=parentId;
	this.remark=remark;
	this.status="closed"; // expand set to "opened"

	// �ڵ��Զ���ͼ��
	if(iconOpen != null && iconClose != null) {
		this.NODE_FOLDER_OPEN=iconOpen;
		this.NODE_FOLDER_CLOSED=iconClose;
	}
	else { // Ĭ��
		if(parentId==null) {
			this.NODE_FOLDER_OPEN=TREE.TREE_ROOT;
			this.NODE_FOLDER_CLOSED=TREE.TREE_ROOT;
		}
		else {
			//this.NODE_FOLDER_OPEN=TREE.TREE_FOLDER_OPEN;
			//this.NODE_FOLDER_CLOSED=TREE.TREE_FOLDER_CLOSED;
			this.NODE_FOLDER_OPEN=null;
			this.NODE_FOLDER_CLOSED=null;
		}
	}

	// �ڵ���󷽷�����
	this.locate=_nd_locate;
	this.startExpand=_nd_startExpand;
	this.startQuery=_nd_startQuery;
	this.setFocus=_nd_setFocus;
	this.expand=_nd_expand;
	this.collapse=_nd_collapse;

	this.getChildren=_getChildren;
	this.getQuery=_getQuery;

//        alert(this.id);

}

function _getChildren() {
	return null;
}
//
//  չ��.
//
function _nd_expand() {
	if(this.status=='opened')
		return true;

        //����Ҷ�ӽڵ㣬������չ������
        var yy=eval('document.all["TB_'+this.id+'"]');
    	if(yy!=null){
        	var src=yy.src;
                if(src.substring(src.lastIndexOf('/'))==TREE.TREE_BRANCH_MIDDLE.substring(TREE.TREE_BRANCH_MIDDLE.lastIndexOf('/')) || src.substring(src.lastIndexOf('/'))==TREE.TREE_BRANCH_BOTTOM.substring(TREE.TREE_BRANCH_BOTTOM.lastIndexOf('/'))){
                    	this.status=='opened';
                	return true;
                }
        }

        var xx=eval('document.all["TX_'+this.id+'"]');
//	xx.innerHTML='';

	if(xx.style.display!='none'){



	var middleNodeList=new Array();
	var k=0;
	middleNodeList[k]=this;
	var nd=null;
	// ������صĵ����ڵ����·,�������ڵ�
	while(this.parentId!=null) {
		for(idx in TREE.nodeList) {
			nd=TREE.nodeList[idx];
			if(nd.id==middleNodeList[k].parentId) {
				middleNodeList[k+1]=nd;
				k++;
				break;
			}
		}
		if(nd.parentId==null)
			break;
	}
	// �õ�չ�����ӽڵ�ǰ���ͼ��,�����ַ���s1 ��
	var ww=0;
	var s1='';
	for(ww=0;ww<middleNodeList.length-1;ww++){
		var hasUncle=false;
		idx="0";
		for(idx in TREE.nodeList) {
			nd=TREE.nodeList[idx];
			if(nd.parentId==middleNodeList[ww].parentId && TREE.nodeListIndex[nd.id]>TREE.nodeListIndex[middleNodeList[ww].id]) {
				hasUncle=true;
				break;
			}
		}

		if(hasUncle){//�ϼ����Ų������һ�����ţ�
			s1="<img align=absmiddle src=\""+TREE.TREE_BRANCH_NONE+"\" border=0>"+s1;

		}
		else{//�ϼ����������һ�����ţ�
			s1="<img align=absmiddle src=\""+TREE.TREE_BLANK+"\" border=0>"+s1;
		}
	}
	// ׼�����ӽڵ�,���ӽڵ������
	var ndLst=this.getChildren();
	// �����鵽�ĺ��ӽڵ��������
	//alert('before new node:'+TREE.nodeList.length);
	if(ndLst!=null) {
		idx="0";
		for(idx in ndLst) {
			TREE.insertNode(ndLst[idx]);
		}
	}
	//alert('after new node:'+TREE.nodeList.length);

	var s='';
	var idx,idx2;
	s='';
	idx="0";
	for(idx in TREE.nodeList){
		nd=TREE.nodeList[idx];
		// ��Ҷ�ӽڵ�,����չ������
		if(nd.parentId==this.id){
			nd.status='closed';
			haveSub=false;
			haveNext=false;
			for(idx2 in TREE.nodeList){ //�ж��Ƿ����¼�
				nd2=TREE.nodeList[idx2];
				if(nd2.parentId==nd.id){
					haveSub=true;
				}
				if(nd2.parentId==this.id && TREE.nodeListIndex[idx2]>TREE.nodeListIndex[idx]) { // �ж��Ƿ��к������ֵܽڵ�
					haveNext=true;
				}
				if(haveSub && haveNext)
					break;
			}
			if(haveSub){
				if(nd.NODE_FOLDER_OPEN==null) nd.NODE_FOLDER_OPEN=TREE.TREE_FOLDER_OPEN;
				if(nd.NODE_FOLDER_CLOSED==null) nd.NODE_FOLDER_CLOSED=TREE.TREE_FOLDER_CLOSED;

				if(haveNext){
					s+="<nobr><div style=\"font-size:9pt;height:0px;position:relative;margin: 0px;marginLeft:0px;marginTop:0px;marginTop:0px; marginBottom:0px;\"><nobr>"+
						s1+
						"<img style=\"cursor:hand\" id=\"TB_"+nd.id+"\" onClick=\"clickTree(this);\" src=\""+TREE.TREE_CLOSED_MIDDLE+"\" border=0 align=absmiddle>"+
//						"<img style=\"cursor:hand\" id=\"TI_"+nd.id+"\" onClick=\"clickTree(this);\" src=\""+nd.NODE_FOLDER_CLOSED+"\" border=0 align=absmiddle>"+
						"<span style=\"cursor:hand\" id=TT_"+nd.id+" onClick=\"clickTree(this);\" color=\""+TREE.TEXT_NORMAL+"\">"+nd.title+"</span></nobr></div>";
					s+="<font style=\"font-size:9pt\" id=TX_"+nd.id+"></font></nobr>";
				}
				else{
					s+="<nobr><div style=\"font-size:9pt;height:0px;position:relative;margin: 0px;marginLeft:0px;marginTop:0px;marginTop:0px; marginBottom:0px;\"><nobr>"+
						s1+
						"<img style=\"cursor:hand\" id=\"TB_"+nd.id+"\" onClick=\"clickTree(this);\" src=\""+TREE.TREE_CLOSED_BOTTOM+"\" border=0 align=absmiddle>"+
//						"<img style=\"cursor:hand\" id=\"TI_"+nd.id+"\" onClick=\"clickTree(this);\" src=\""+nd.NODE_FOLDER_CLOSED+"\" border=0 align=absmiddle>"+
						"<span style=\"cursor:hand\" id=TT_"+nd.id+" onClick=\"clickTree(this);\" color=\""+TREE.TEXT_NORMAL+"\">"+nd.title+"</span></nobr></div>";
					s+="<font style=\"font-size:9pt\" id=TX_"+nd.id+"></font></nobr>";
				}
			}
			else{
				if(nd.NODE_FOLDER_OPEN==null) nd.NODE_FOLDER_OPEN=TREE.TREE_LEAF;
				if(nd.NODE_FOLDER_CLOSED==null) nd.NODE_FOLDER_CLOSED=TREE.TREE_LEAF;

				if(haveNext){
					s+="<nobr><div style=\"font-size:9pt;height:0px;position:relative;margin: 0px;marginLeft:0px;marginTop:0px;marginTop:0px; marginBottom:0px;\"><nobr>"+
						s1+
						"<img style=\"cursor:hand\" id=\"TB_"+nd.id+"\" onClick=\"clickTree(this);\" src=\""+TREE.TREE_BRANCH_MIDDLE+"\" border=0 align=absmiddle>"+
//						"<img style=\"cursor:hand\" id=\"TI_"+nd.id+"\" onClick=\"clickTree(this);\" src=\""+nd.NODE_FOLDER_CLOSED+"\" border=0 align=absmiddle>"+
						"<span style=\"cursor:hand\" id=TT_"+nd.id+" onClick=\"clickTree(this);\" color=\""+TREE.TEXT_NORMAL+"\">"+nd.title+"</span></nobr></div>";
					s+="<font style=\"font-size:9pt\" id=TX_"+nd.id+"></font></nobr>";
				}
				else{
					s+="<nobr><div style=\"font-size:9pt;height:0px;position:relative;margin: 0px;marginLeft:0px;marginTop:0px;marginTop:0px; marginBottom:0px;\"><nobr>"+
						s1+
						"<img style=\"cursor:hand\" id=\"TB_"+nd.id+"\" onClick=\"clickTree(this);\" src=\""+TREE.TREE_BRANCH_BOTTOM+"\" border=0 align=absmiddle>"+
//						"<img style=\"cursor:hand\" id=\"TI_"+nd.id+"\" onClick=\"clickTree(this);\" src=\""+nd.NODE_FOLDER_CLOSED+"\" border=0 align=absmiddle>"+
						"<span style=\"cursor:hand\" id=TT_"+nd.id+" onClick=\"clickTree(this);\" color=\""+TREE.TEXT_NORMAL+"\">"+nd.title+"</span></nobr></div>";
					s+="<font style=\"font-size:9pt\" id=TX_"+nd.id+"></font></nobr>";
				}
			}
		} // ��Ҷ�ӽڵ�չ����������
	}


        xx.innerHTML=s;


	}
	else{
    		xx.style.display='';

   	}


	this.status='opened';

	// ��������֧��ͼ��ʽ��
	if(this.parentId==null) // ���ڵ����
		return true;


    	var yy=eval('document.all["TB_'+this.id+'"]');
    	if(yy!=null){
        	var src=yy.src;

                if(src.substring(src.lastIndexOf('/'))==TREE.TREE_CLOSED_MIDDLE.substring(TREE.TREE_CLOSED_MIDDLE.lastIndexOf('/'))){
                	src=TREE.TREE_OPEN_MIDDLE;
                }
                else if(src.substring(src.lastIndexOf('/'))==TREE.TREE_CLOSED_BOTTOM.substring(TREE.TREE_CLOSED_BOTTOM.lastIndexOf('/'))){
                	src=TREE.TREE_OPEN_BOTTOM;
                }
                yy.src=src;
        }

        /*
	haveSub=false;
	haveNext=false;
	idx="0";
	for(idx in TREE.nodeList) { // ���ҵ�ǰ�����±�
		nd=TREE.nodeList[idx];
		if(nd.id==this.id)
			break;
	}
	idx2="0";
	for(idx2 in TREE.nodeList){ //�ж��Ƿ����¼�
		nd2=TREE.nodeList[idx2];
		if(nd2.parentId==this.id){
			haveSub=true;
		}
		if(nd2.parentId==this.parentId && idx2>idx) { // �ж��Ƿ��к������ֵܽڵ�
			haveNext=true;
		}
		if(haveSub && haveNext)
			break;
	}
	var src;
	if(haveSub) {
		if(haveNext) {
			src=TREE.TREE_OPEN_MIDDLE;
		}
		else {
			src=TREE.TREE_OPEN_BOTTOM;
		}
		yy=eval('document.all["TB_'+this.id+'"]');
		if(yy!=null)
			yy.src=src;
	}
        */

	return true;
}
//
//  �ر�
//
function _nd_collapse() {
	var nd=null;
	if(this.status=='closed')
		return true;
	this.status='closed';
	// ����,���й�괦��
	if(TREE.selectedNode!=null) {
		nd=TREE.selectedNode;
		while(nd.parentId!=null && nd.parentId!=this.id) {
			nd=TREE.findNode(nd.parentId);
		}
		if(nd.parentId==this.id) {
			this.setFocus();
		}
	}
	//var xx=eval('window.TX_'+this.id);
	var xx=eval('document.all["TX_'+this.id+'"]');
//	xx.innerHTML='';

	xx.style.display='none';



	// �޸�����֧ͼ��ʽ��
	if(this.parentId==null) // ���ڵ����
		return true;

        var yy=eval('document.all["TB_'+this.id+'"]');

        if(yy!=null){
        	var src=yy.src;

                if(src.substring(src.lastIndexOf('/'))==TREE.TREE_OPEN_MIDDLE.substring(TREE.TREE_OPEN_MIDDLE.lastIndexOf('/'))){
                	src=TREE.TREE_CLOSED_MIDDLE;
                }
                else if(src.substring(src.lastIndexOf('/'))==TREE.TREE_OPEN_BOTTOM.substring(TREE.TREE_OPEN_BOTTOM.lastIndexOf('/'))){
                	src=TREE.TREE_CLOSED_BOTTOM;
                }
                yy.src=src;
        }

        /*
	haveSub=false;
	haveNext=false;
	for(idx in TREE.nodeList) { // ���ҵ�ǰ�����±�
		nd=TREE.nodeList[idx];
		if(nd.id==this.id)
			break;
	}
	for(idx2 in TREE.nodeList){ //�ж��Ƿ����¼�
		nd2=TREE.nodeList[idx2];
		if(nd2.parentId==this.id){
			haveSub=true;
		}
		if(nd2.parentId==this.parentId && idx2>idx) { // �ж��Ƿ��к������ֵܽڵ�
			haveNext=true;
		}
		if(haveSub && haveNext)
			break;
	}
	var src;
	if(haveSub) {
		if(haveNext) {
			src=TREE.TREE_CLOSED_MIDDLE;
		}
		else {
			src=TREE.TREE_CLOSED_BOTTOM;
		}
		//yy=eval('window.TB_'+this.id);
		yy=eval('document.all["TB_'+this.id+'"]');
		if(yy!=null)
			yy.src=src;
	}
        */
	this.status='closed';
}
//
//  չ��/�ر�,����Ӧ������¼�
//
function _nd_startExpand() {
	if(this.status=='opened')
		return this.collapse();
	else if(this.status=='closed')
		return this.expand();
}
//
//  ��λ�ڵ�
//
function _nd_locate() {
	var k=0;
	var middleNodeList = new Array();
	middleNodeList[k]=this;
	while(middleNodeList[k].parentId!=null) {
		k++;
		middleNodeList[k]=TREE.nodeList[middleNodeList[k-1].parentId];
	}
	for(i=k;i>=0;i--) {
		middleNodeList[i].expand();
	}
	this.setFocus();
}
//
//  ���нڵ����ݲ�ѯ
//
function _nd_startQuery() {
	//alert("this is _nd_startQuery:"+this.title);
	var s=this.getQuery();
	if(TREE.targetId!=null && s!=null) {
		//eval("window."+TREE.targetId+".innerHTML=s;");
		eval('document.all["'+TREE.targetId+'"].innerHTML=s;');
	}
	else if(TREE.targetWin!=null && s!=null) {
		eval("parent."+TREE.targetWin+".location=\""+s+"\"");
	//	eval("parent."+TREE.targetWin+".location.reload();");
	}
	// then, set focus on the node
	this.setFocus();
}
//
// ���ù������ָ���ڵ�
//
function _nd_setFocus() {

	var tt_id;
	var tt_obj;
	// ȡ��ǰ�ι�����ڽڵ���Ŀ״̬
	if(TREE.selectedNode!=null) {
		var nd=TREE.selectedNode;
		tt_id='TT_'+nd.id;
		tt_obj=eval('document.all["'+tt_id+'"].style');
		if(tt_obj!=null && tt_obj!='undefined'){  // BUG
//			tt_obj.color=TREE.TEXT_NORMAL;
//			tt_obj.fontWeight='';

			tt_obj.background='';
                         tt_obj.color='';

		}

                //����ǰ��״̬�ķ�֧�ڵ�ͼ����Ϊ�ر�״̬
		var nd=TREE.selectedNode;
		var yy=eval('document.all["TI_'+nd.id+'"]');
		if(yy!=null){
			yy.src=nd.NODE_FOLDER_CLOSED;
		}

	}

	tt_id='TT_'+this.id;
	tt_obj=eval('document.all["'+tt_id+'"].style');
	if(tt_obj!=null){
//		tt_obj.color=TREE.TEXT_BRIGHT;
//		tt_obj.fontWeight='bold';

		tt_obj.background='#001177';
                tt_obj.color='#ffffff';

	}
	// ���õ�ǰѡ�нڵ�Ϊ��ǰ�ڵ�
	TREE.selectedNode=this;

//	// �����д�״̬�ķ�֧�ڵ�ͼ����Ϊ�ر�״̬
//	for(idx in TREE.nodeList) {
//		var nd=TREE.nodeList[idx];
//		var yy=eval('document.all["TI_'+nd.id+'"]');
//		if(yy!=null){
//			yy.src=nd.NODE_FOLDER_CLOSED;
//		}
//	}
	// ����ǰչ���ڵ�ͼ������Ϊ��״̬
	var yy=eval('document.all["TI_'+this.id+'"]');
	if(yy!=null) {
		yy.src=this.NODE_FOLDER_OPEN;
	}
}

