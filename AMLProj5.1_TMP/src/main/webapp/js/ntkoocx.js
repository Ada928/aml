var TANGER_OCX_bDocOpen = false;
var TANGER_OCX_filename;
var TANGER_OCX_actionURL; //For auto generate form fiields
var TANGER_OCX_OBJ; //The Control
var DocPassWord = 'ISTRETijbn2008';

//����ΪV1.7��������ʾ��
function TANGER_OCX_CreateDoc()
{
  TANGER_OCX_OBJ = document.all.item("TANGER_OCX");

  //TANGER_OCX_OBJ.CreateNew("WPS.Document");
  TANGER_OCX_OBJ.CreateNew("Word.Document");

}

//��ʾ���ع�����
function ShowToolbars(bShow)
{
  TANGER_OCX_OBJ.Toolbars = bShow;
}

function strtrim(value)
{
  return value.replace(/^\s+/,'').replace(/\s+$/,'');
}

function TANGER_OCX_doFormOnSubmit()
{

  var form = document.forms[0];
    if (form.onsubmit)
  {
      var retVal = form.onsubmit();
       if (typeof retVal == "boolean" && retVal == false)
         return false;
  }
  return true;
}

//������ֹ��ʾ�޶��������͹��߲˵��������޶���
function TANGER_OCX_EnableReviewBar(boolvalue)
{
  TANGER_OCX_OBJ.ActiveDocument.CommandBars("Reviewing").Enabled = boolvalue;
  TANGER_OCX_OBJ.ActiveDocument.CommandBars("Track Changes").Enabled = boolvalue;
  TANGER_OCX_OBJ.IsShowToolMenu = boolvalue;	//�رջ�򿪹��߲˵�
}
//���������޶�
function TANGER_OCX_AcceptAllRevisions()
{
  TANGER_OCX_OBJ.ActiveDocument.AcceptAllRevisions();
}

//�򿪻��߹ر��޶�ģʽ
function TANGER_OCX_SetReviewMode(boolvalue)
{
  TANGER_OCX_OBJ.ActiveDocument.TrackRevisions = boolvalue;
}

//������˳��ۼ�����״̬�������������������
function TANGER_OCX_SetMarkModify(boolvalue)
{
 var doctype = TANGER_OCX_OBJ.DocType;
   if(6 == doctype){
     WPSEnterRevisionMode(boolvalue);
  }else{
    TANGER_OCX_SetReviewMode(boolvalue);
    TANGER_OCX_EnableReviewBar(!boolvalue);
  }
}

//��ʾ/����ʾ�޶�����
function TANGER_OCX_ShowRevisions(boolvalue)
{
  //TANGER_OCX_OBJ.ActiveDocument.ShowRevisions = boolvalue;
}

//��ӡ/����ӡ�޶�����
function TANGER_OCX_PrintRevisions(boolvalue)
{
  TANGER_OCX_OBJ.ActiveDocument.PrintRevisions = boolvalue;
}

function TANGER_OCX_SaveToServer()
{
  if(!TANGER_OCX_bDocOpen)
  {
    alert("û�д򿪵��ĵ���");
    return;
  }

  TANGER_OCX_filename = prompt("�������Ϊ��","���ĵ�.doc");
  if ( (!TANGER_OCX_filename))
  {
    TANGER_OCX_filename ="";
    return;
  }
  else if (strtrim(TANGER_OCX_filename)=="")
  {
    alert("�����������ļ�����");
    return;
  }
  TANGER_OCX_SaveDoc();
}


//����ҳ�沼��
function TANGER_OCX_ChgLayout()
{
   try
  {
    TANGER_OCX_OBJ.showdialog(5); //����ҳ�沼��
  }
  catch(err){
    alert("����" + err.number + ":" + err.description);
  }
  finally{
  }
}

//��ӡ�ĵ�
function TANGER_OCX_PrintDoc()
{
  try
  {
    TANGER_OCX_OBJ.printout(true);
  }
  catch(err){
    alert("����" + err.number + ":" + err.description);
  }
  finally{
  }
}

function TANGER_OCX_SaveEditToServer()
{
  if(!TANGER_OCX_bDocOpen)
  {
    alert("û�д򿪵��ĵ���");
    return;
  }

  TANGER_OCX_filename = document.all.item("filename").value;

  if ( (!TANGER_OCX_filename))
  {
    TANGER_OCX_filename ="";
    return;
  }
  else if (strtrim(TANGER_OCX_filename)=="")
  {
    alert("�����������ļ�����");
    return;
  } 
  TANGER_OCX_SaveDoc();
}

function TANGER_OCX_SaveTemplateToServer()
{
  if(!TANGER_OCX_bDocOpen)
  {
    alert("û�д򿪵��ĵ���");
    return;
  }

  TANGER_OCX_filename = document.all.item("filename").value;
  if ( (!TANGER_OCX_filename))
  {
    TANGER_OCX_filename ="";
    return;
  }
  else if (strtrim(TANGER_OCX_filename)=="")
  {
    alert("�����������ļ�����");
    return;
  }
  //alert(TANGER_OCX_filename);
  TANGER_OCX_SaveTemplate();
}

function TANGER_OCX_SaveAttatchEditToServer()
{
  if(!TANGER_OCX_bDocOpen)
  {
    alert("û�д򿪵��ĵ���");
    return;
  }

  TANGER_OCX_filename = document.all.item("filename").value;
  if ( (!TANGER_OCX_filename))
  {
    TANGER_OCX_filename ="";
    return;
  }
  else if (strtrim(TANGER_OCX_filename)=="")
  {
    alert("�����������ļ�����");
    return;
  }
  TANGER_OCX_SaveDoc();
}

//������ֹ�ļ���>�½��˵�
function TANGER_OCX_EnableFileNewMenu(boolvalue)
{
  TANGER_OCX_OBJ.EnableFileCommand(0) = boolvalue;
}

//������ֹ�ļ���>�򿪲˵�
function TANGER_OCX_EnableFileOpenMenu(boolvalue)
{
  TANGER_OCX_OBJ.EnableFileCommand(1) = boolvalue;
}

//������ֹ�ļ���>�رղ˵�
function TANGER_OCX_EnableFileCloseMenu(boolvalue)
{
  TANGER_OCX_OBJ.EnableFileCommand(2) = boolvalue;
}

//������ֹ�ļ���>����˵�
function TANGER_OCX_EnableFileSaveMenu(boolvalue)
{
  TANGER_OCX_OBJ.EnableFileCommand(3) = boolvalue;
}

//������ֹ�ļ���>���Ϊ�˵�
function TANGER_OCX_EnableFileSaveAsMenu(boolvalue)
{
  TANGER_OCX_OBJ.EnableFileCommand(4) = boolvalue;
}

//������ֹ�ļ���>��ӡ�˵�
function TANGER_OCX_EnableFilePrintMenu(boolvalue)
{
  TANGER_OCX_OBJ.EnableFileCommand(5) = boolvalue;
}

//������ֹ�ļ���>��ӡԤ���˵�
function TANGER_OCX_EnableFilePrintPreviewMenu(boolvalue)
{
  TANGER_OCX_OBJ.EnableFileCommand(6) = boolvalue;
}

// ���ĵ�
function TANGER_OCX_OpenAttatchDoc(docUrl,type)
{
  TANGER_OCX_OBJ = document.all.item('TANGER_OCX');
  //alert(TANGER_OCX_OBJ);
  if(docUrl != "")
  {
    if(type=="doc"||type=="wps"){    	
      TANGER_OCX_OBJ.BeginOpenFromURL(docUrl,true,false,'Word.Document');
    }else if(type=="xls"){
      TANGER_OCX_OBJ.BeginOpenFromURL(docUrl,true,false,'Excel.Sheet');
    }else{
      TANGER_OCX_OBJ.BeginOpenFromURL(docUrl,true,false,'Word.Document');
    }
  }
}

function TANGER_OCX_OnDocumentOpened(str, obj, flag)
{
  TANGER_OCX_bDocOpen = true;
  TANGER_OCX_SetReadOnly(true);
  TANGER_OCX_EnableMenu(false);
  TANGER_OCX_OBJ.FileSave=false;
  TANGER_OCX_OBJ.FileSaveAs =false;
  //���غۼ�
  //TANGER_OCX_ShowRevisions(true);
  if (flag == 1 || flag == 2){
    // �������
    TANGER_OCX_AcceptAllRevisions();
  }
  //���ƹ�����
  ShowToolbars(false);

  //������ʾ����
  TANGER_OCX_OBJ.ActiveDocument.ActiveWindow.ActivePane.View.Zoom.PageFit = 2
}

function TANGER_OCX_OnDocumentOpened(str, obj)
{
  TANGER_OCX_bDocOpen = true;
  TANGER_OCX_SetReadOnly(true);
  TANGER_OCX_EnableMenu(true);
  TANGER_OCX_OBJ.FileSave=false;
  TANGER_OCX_OBJ.FileSaveAs =false;

  //���ƹ�����
  ShowToolbars(true);
  //alert("11:"+TANGER_OCX_OBJ.ActiveDocument.Application);
 
  //alert("12:"+TANGER_OCX_OBJ.ActiveDocument.Application.ActiveWindow.ActivePane);
  
  //������ʾ����
 // TANGER_OCX_OBJ.ActiveDocument.ActiveWindow.ActivePane.View.Zoom.PageFit = 2
}

function TANGER_OCX_OnDocumentOpenedTem(str, obj)
{
  TANGER_OCX_bDocOpen = true;
  TANGER_OCX_OBJ.ActiveDocument.ActiveWindow.ActivePane.View.Zoom.PageFit = 2;
}

function TANGER_OCX_OnDocumentClosed()
{
   TANGER_OCX_bDocOpen = false;
}

function TANGER_OCX_SaveDoc()
{
  var newwin,newdoc;

  if(!TANGER_OCX_bDocOpen)
  {
    alert("û�д򿪵��ĵ���");
    return;
  }

  try
  {
     if(!TANGER_OCX_doFormOnSubmit()) return;//������ڣ���ִ�б���onsubmit������
     //���ÿؼ���SaveToURL����
     //alert(document.forms[0].action);
     //alert(document.forms[0].filename.value);
    var retHTML = TANGER_OCX_OBJ.SaveAsOtherFormatToURL
    (
      5,
      document.forms[0].action,  //�˴�Ϊuploadedit.asp
      "EDITFILE",	//�ļ�����������,����ѡ,��������<input type=file name=..>��name�����ظ�����
      "", //��ѡ�������Զ������ݣ�ֵ�ԣ���&�ָ����磺myname=tanger&hisname=tom,һ��Ϊ��
      document.forms[0].filename.value, //�ļ���,�˴��ӱ������ȡ��Ҳ���Զ���
      "myForm" //�ؼ��������ύ���ܿ�������ͬʱ�ύѡ���ı�����������.�˴���ʹ��id�������
    ); //�˺������ȡ�ӷ������Ϸ��ص���Ϣ�����浽����ֵ�С�
    //ˢ��һ���ĵ�����
    //window.location.reload();

    // �ύ��һҳ�棬����һҳ��رյ�ǰ���ڲ��޸ķ�ҳ������
    //document.forms[0].action = document.getElementById("close_attachcontrol_url").value;
    //document.forms[0].submit();

    //��һ���´�����ʾ��������
    /*newwin = window.open("","_blank","left=200,top=200,width=400,height=300,status=0,toolbar=0,menubar=0,location=0,scrollbars=1,resizable=1",false);
    newdoc = newwin.document;
    newdoc.open();
    newdoc.write("<html><head><title>���ص�����</title></head><body><center><hr>")
    newdoc.write(retHTML+"<hr>");
    newdoc.write("<input type=button VALUE='�رմ���' onclick='window.close()'>");
    newdoc.write('</center></body></html>');
    newdoc.close();
    if(window.opener) //��������ڴ��ڣ�ˢ�²��رյ�ǰ����
    {

      window.opener.location.reload();
    }
    //window.close();
    */
  }
  catch(err){
    alert("���ܱ��浽URL��" + err.number + ":" + err.description);
  }
  finally{
  }
}

function TANGER_OCX_SaveTemplate()
{
  var newwin,newdoc;

  if(!TANGER_OCX_bDocOpen)
  {
    alert("û�д򿪵��ĵ���");
    return;
  }

  try
  {

     //if(!TANGER_OCX_doFormOnSubmit())return; //������ڣ���ִ�б���onsubmit������
     //���ÿؼ���SaveToURL����
    var retHTML = TANGER_OCX_OBJ.SaveAsOtherFormatToURL
    (
      5,
      document.forms[0].action,  //�˴�Ϊuploadedit.asp
      "EDITFILE",	//�ļ�����������,����ѡ,��������<input type=file name=..>��name�����ظ�����
      "", //��ѡ�������Զ������ݣ�ֵ�ԣ���&�ָ����磺myname=tanger&hisname=tom,һ��Ϊ��
      document.forms[0].filename.value, //�ļ���,�˴��ӱ������ȡ��Ҳ���Զ���
      "frmDocTemplate" //�ؼ��������ύ���ܿ�������ͬʱ�ύѡ���ı�����������.�˴���ʹ��id�������
    ); //�˺������ȡ�ӷ������Ϸ��ص���Ϣ�����浽����ֵ�С�
    //ˢ��һ���ĵ�����
    //window.location.reload();
    //��һ���´�����ʾ��������
    /*newwin = window.open("","_blank","left=200,top=200,width=400,height=300,status=0,toolbar=0,menubar=0,location=0,scrollbars=1,resizable=1",false);
    newdoc = newwin.document;
    newdoc.open();
    newdoc.write("<html><head><title>���ص�����</title></head><body><center><hr>")
    newdoc.write(retHTML+"<hr>");
    newdoc.write("<input type=button VALUE='�رմ���' onclick='window.close()'>");
    newdoc.write('</center></body></html>');
    newdoc.close();
    if(window.opener) //��������ڴ��ڣ�ˢ�²��رյ�ǰ����
    {

      window.opener.location.reload();
    }
    //window.close();
    */
  }
  catch(err){
    alert("���ܱ��浽URL��" + err.number + ":" + err.description);
  }
  finally{
  }
}

function TANGER_OCX_SaveAsHTML()
{
  var newwin,newdoc;

  if(!TANGER_OCX_bDocOpen)
  {
    alert("û�д򿪵��ĵ���");
    return;
  }
  try
  {
    //���ÿؼ���PublishAsHTMLToURL����
    var retHTML = TANGER_OCX_OBJ.PublishAsHTMLToURL
      (
        "uploadhtmls.jsp",
        "HTMLFILES", //�ļ�����������,����ѡ,��������ļ����Դ����ϴ�
        "",
        document.forms[0].htmlfile.value
        //�˴�ʡ���˵�5��������HTML FORM����������id.����,�����ύ������
        //ֻ�ύ���е�html�ļ���ص��ļ�
      );
    newwin = window.open("","_blank","left=200,top=200,width=400,height=300,status=0,toolbar=0,menubar=0,location=0,scrollbars=1,resizable=1",false);
    newdoc = newwin.document;
    newdoc.open();
    newdoc.write("<center><hr>"+retHTML+"<hr><input type=button VALUE='�رմ���' onclick='window.close()'></center>");
    newdoc.close();
    newwin.focus();
    if(window.opener) //��������ڴ��ڣ�ˢ�²��رյ�ǰ����
    {
      window.opener.location.reload();
    }
  }
  catch(err){
    alert("���ܱ��浽URL��" + err.number + ":" + err.description);
  }
  finally{
  }
}

// �ĵ�����
function SetReadOnly(IsReadOnly){
  TANGER_OCX_OBJ.SetReadOnly(IsReadOnly,DocPassWord);
}

//�л��ĵ���ֻ��״̬���ĵ�����״̬��
function TANGER_OCX_SetReadOnly(boolvalue)
{
  var i;
  try
  {
    if (boolvalue) TANGER_OCX_OBJ.IsShowToolMenu = false;
    with(TANGER_OCX_OBJ.ActiveDocument)
    {
      if (TANGER_OCX_OBJ.DocType == 1) //word
      {
        if ( (ProtectionType != -1) &&  !boolvalue)
        {
          Unprotect();
        }
        if ( (ProtectionType == -1) &&  boolvalue)
        {
          Protect(2,true,"");
        }
      }else if(TANGER_OCX_OBJ.DocType == 6)//wps word
      {
        if ( (ProtectionType != -1) &&  !boolvalue)
        {
          Unprotect();
        }
        if ( (ProtectionType == -1) &&  boolvalue)
        {
          Protect(2,true,"");
        }
      }
      else if(TANGER_OCX_OBJ.DocType == 2)//excel
      {
        for(i=1;i<=Application.Sheets.Count;i++)
        {
          if(boolvalue)
          {
            Application.Sheets(i).Protect("",true,true,true);
          }
          else
          {
            Application.Sheets(i).Unprotect("");
          }
        }
        if(boolvalue)
        {
          Application.ActiveWorkbook.Protect("",true);
        }
        else
        {
          Application.ActiveWorkbook.Unprotect("");
        }
      }else if(TANGER_OCX_OBJ.DocType == 7)//kingsoft sheet
      {
        for(i=1;i<=Application.Sheets.Count;i++)
        {
          if(boolvalue)
          {
            Application.Sheets(i).Protect("",true,true,true);
          }
          else
          {
            Application.Sheets(i).Unprotect("");
          }
        }
        if(boolvalue)
        {
          Application.ActiveWorkbook.Protect("",true);
        }
        else
        {
          Application.ActiveWorkbook.Unprotect("");
        }
      }
    }
  }
  catch(err){
    //alert("����" + err.number + ":" + err.description);
  }
  finally{}

}

//�����û���
function TANGER_OCX_SetDocUser(cuser)
{
  with(TANGER_OCX_OBJ.ActiveDocument.Application)
  {
    UserName = cuser;
  }
}
//���β˵�
function TANGER_OCX_EnableMenu(boolvalue){
    //�½�
  TANGER_OCX_EnableFileNewMenu((boolvalue));
  //��
  TANGER_OCX_EnableFileOpenMenu(boolvalue);
  //�ر�
  TANGER_OCX_EnableFileCloseMenu(boolvalue);
  //����
  TANGER_OCX_EnableFileSaveMenu(boolvalue);
  //���Ϊ
  TANGER_OCX_EnableFileSaveAsMenu(boolvalue);

}

//�׺�ͷ
function TANGER_OCX_DoPaiBan(URL1,FieldArray){
   try{
       TANGER_OCX_SetReadOnly(false);
       if(TANGER_OCX_OBJ.ActiveDocument.TrackRevisions){
         TANGER_OCX_SetMarkModify(false);
       }

    //ѡ�����ǰ�ĵ�����������
    var curSel = TANGER_OCX_OBJ.ActiveDocument.Application.Selection;
    //
    curSel.WholeStory();
    curSel.Cut();
    //����ģ��
    TANGER_OCX_OBJ.AddTemplateFromURL(URL1);

    var BookMarkName = "����";
    if(!TANGER_OCX_OBJ.ActiveDocument.BookMarks.Exists(BookMarkName))
    {
      alert("Word ģ���в���������Ϊ��\""+BookMarkName+"\"����ǩ��");
      return;
    }
    var bkmkObj = TANGER_OCX_OBJ.ActiveDocument.BookMarks(BookMarkName);
    var saverange = bkmkObj.Range
    //saverange.Paste();
    saverange.Select();
        TANGER_OCX_OBJ.ActiveDocument.Application.Selection.Paste();
    TANGER_OCX_OBJ.ActiveDocument.Bookmarks.Add(BookMarkName,saverange);
    //TANGER_OCX_SetMarkModify(true);
    //�滻������ǩ
    TANGER_OCX_ReplaceBookMarks(FieldArray);
  }
  catch(err)
  {
    alert("����" + err.number + ":" + err.description);
  }
}
//wps��������ģʽ
function WPSEnterRevisionMode(BoolValue)
{
    var doc = TANGER_OCX_OBJ.ActiveDocument;
    var app = doc.Application;
    var doctype = TANGER_OCX_OBJ.DocType;
    if( 6 != doctype)
    {
      alert("�˹�����Ҫʹ��WPS��");
      return;
    }
    var cmdbars = app.CommandBars;
    TANGER_OCX_OBJ.IsShowToolMenu =true ;	//�رջ�򿪹��߲˵� !BoolValue
    doc.TrackRevisions = BoolValue;
    cmdbars("Reviewing").Enabled = false;
  cmdbars("Reviewing").Visible = false;
  cmdbars(40).Enabled = false;
  cmdbars(40).Visible = false;

  //cmdbars("Reviewing").Enabled = !BoolValue;
  //cmdbars("Reviewing").Visible = !BoolValue;
  //RevisionTextPopupMenuOntbShortcutMenus ��ֹ�Ҽ��˵��������ʹ���ַ������С�
  //cmdbars(40).Enabled = !BoolValue;
  //cmdbars(40).Visible = !BoolValue;
}
//ѭ��ȡ��ǩ�������׺죨������ǩ���⣩
function TANGER_OCX_ReplaceBookMarks(FieldArray){
  var i=0;
  var k=0;
  var BookMarks = TANGER_OCX_OBJ.ActiveDocument.BookMarks;
  var BookMarkCount = BookMarks.count;
  for(i=BookMarkCount; i>0;i-- ){
    var FieldLength =FieldArray.length;
    var bookMarkname= BookMarks(i).Name ;
    //alert(bookMarkname);
    //ѭ���滻
    for(k=0; k<FieldLength;k++){
     if(bookMarkname==FieldArray[k][k].FieldName){
        var MarkName =FieldArray[k][k].FieldName;
        var MarkValue =FieldArray[k][k].FieldValue;
        //�滻
       TANGER_OCX_OBJ.SetBookmarkValue(bookMarkname,MarkValue);
       }
    }
  }
}