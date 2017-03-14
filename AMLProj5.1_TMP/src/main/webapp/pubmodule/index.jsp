<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����Ƽ�</title>
<style>
* { padding:0; margin:0;  }
html,body { width:100%; height:100%;overflow:hidden }
iframe { width:100%; height:100%; border:0; }
</style>
<link id="skincss" href="css/aml_blue.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/aml.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.14.custom.min.js"></script> 
<script>
jQuery.noConflict();
(function($){ 
  $(function(){
		$(document).ready(function(){
			var tool = $('.tools'); 
			
			$('body').append('<div class="toolsmask" /><div class="dragrange" />');
		    $('.dragrange').css({left:0,top:0,height:$(window).height(),width:$(window).width()});
			
			function fisrtposition(){//��������ʼλ��
				var l = $(window).width()-tool.width()-3;//�������λ�ã����ڿ��-���������-������޸ĵ���ֵ��
				var t = '80px';//���붥��λ��
				tool.css({left:l,top:t});
			}
			fisrtposition();
			
			$(window).bind('resize',fisrtposition);
			
			tool.draggable({
				  distance: 3, 
				  cursor: "move",
				  iframeFix: true,
				  handle: ".toolstitle",
				  containment: '.dragrange', 
				  scroll: false,
				  start: function() {
					$('.toolsmask').css('display','block');
				  },
				  drag: function() {		
				  },
				  stop: function() {
					$('.toolsmask').css('display','none');
				  }
			});
			
			if(tool.attr('state')=='min'){
				$('.toolstitle div',tool).addClass('reg');
				$('.toolscot').hide();
			}else{
				$('.toolstitle div',tool).removeClass('reg');
			}
			
			$('.toolstitle div').click(function(){
					  if($(this).attr('class')=='reg'){
							$(this).removeAttr('class');
							$('.toolscot').slideDown();
					  }else{
							$(this).addClass('reg');
							$('.toolscot').slideUp();
					  }
			  });
			
			$('.toolscot span').hover(function(){$(this).addClass('hoverstyle')},function(){$(this).removeClass('hoverstyle')});
			
		});
  });
})(jQuery);
</script>
</head>
<body><!--  
<div class="tools" style="width:90px;" state="min"><!--state="min"Ĭ����С����state="max"Ĭ�����-->
	<!--  <div class="toolstitle"><div></div></div>
	<div class="toolscot" style="height:100px;">
		<span><img src="images/blue/toolsicon01.gif" />��������</span><br/>
		<span><img src="images/blue/toolsicon02.gif" />һ�β�¼</span><br/>
		<span><img src="images/blue/toolsicon03.gif" />���β�¼</span><br/>
		<span><img src="images/blue/toolsicon04.gif" />�������</span><br/>
	</div>
</div>-->
<%
String systemkey=(String)request.getAttribute("systemkey");
String url=request.getContextPath()+"/pubmodule/index_home.jsp?systemkey="+systemkey;
 %>
<iframe src=<%=url%> id="iframeID"></iframe>
</body>
</html>
