jQuery.noConflict();
(function($){ 
  $(function(){
$(document).ready(function(){
/******* all begin *******/
     var ie  = $.browser.msie;
	 var bversion = $.browser.version;
	 
/*** ѡ����ݲ��� ***/  
	 
	 //��ѯ������.cond: ����.cond-t
	 $('.cond .cond-t span a:last').css('background','none');
	 
	 //��ѯ������.cond: ������ť
	 var smallbtn = $('.cond-t span a');
	 if(smallbtn.length>0)
	  smallbtn.hover(function(){
			var imgsrc = $('img',$(this)).attr('src');
		    imghover = (imgsrc.replace(/.gif/g,"a.gif"));
		    $('img',$(this)).attr('src',imghover);
		 },function(){
			var imgsrc = $('img',$(this)).attr('src');
			imghover = (imgsrc.replace(/a.gif/g,".gif"));
		    $('img',$(this)).attr('src',imghover);
	   });
	  
	 //��ѯ������.cond: �����ı���
	 $('input:text,input:password').addClass('tools-text-input');
	 
	 //��ť
	 $('input:button,input:reset,input:submit').addClass('awp_button').hover(function(){
																		$(this).removeClass().addClass('awp_button_hover');},function(){
																		$(this).removeClass().addClass('awp_button');});
	 
	 //��ѯ������.cond: �����ʽ
	 $('.cond').each(function(){
	    $('table',$(this)).each(function(){
		    $('td:even',$(this)).attr('align','right');
			$('td:odd',$(this)).attr('align','left');
			
			if($(this).width()>$(this).parent().width() && ie && bversion < "8.0" ){
			   $(this).css('margin-bottom','18px');
			}
		});	 
		
		$(this).after('<div class="tools-hr" />');
	 });
	 
	 //�����б���
	 $('.tools-list').each(function(){
		var itwrap = $(this);
	    $('table',itwrap).each(function(){
			
		   var one = $('tr:eq(0)',$(this));
		   var all_sum = 0;
		   var h_sum = 0;		   
		   var notone = false;
		   
		   $('td',one).addClass('t-r');
		   
		   $('tr:even',$(this)).addClass('oddbg');
		   one.removeAttr('class');
		   
		   $('tr',$(this)).each(function(){
										 
			      if($('td',$(this)).length==$('td',one).length){		
				  
				   	   $('td:last',$(this)).removeAttr('class').css('border-right','0');
				
			      }else{
					   
					   $(this).removeClass().addClass('notone_t');
					   one.removeClass().addClass('notone_t');
					   notone = true;	
				  }
				  if($(this).index()<18){
					   h_sum+= parseInt($('td:first',$(this)).height());
				  }
			      all_sum+=parseInt($('td:first',$(this)).height());
		   });
		   
		   $('tr:gt(0)',$(this)).hover(function(){$(this).addClass('hoverbg');},function(){$(this).removeClass('hoverbg');});
		   
		   if($(this).width()>$(this).parent().width() && ie && bversion < "8.0" ){
			   $(this).css('margin-bottom','18px');
		   }
		   
		   if(all_sum>h_sum){
			   	  
			      var maxh = h_sum + one.height() + 'px';
				  itwrap.css({'height':maxh,'position':'relative','overflow':'auto'}).prepend('<div class="fixtitle"><table><tr>'+one.html()+'</tr></table></div>');
				 
				  if(notone){
						  var onetr = $('.fixtitle tr',itwrap);
						  onetr.addClass('notone_t');
						  $('tr',$(this)).each(function(){
									
									if($('td',$(this)).length!=$('td',one).length){
										 $('.fixtitle table',itwrap).append('<tr class="notone_t newh">'+$(this).html()+'</tr>');
									}
						  });
				  }
				 
				  $('.fixtitle tr:first td',itwrap).each(function(){
						var w = $('td:eq('+$(this).index()+')',one).width() + 4 + 'px';
						$(this).css('width',w);
				  });
				 
				  itwrap.scroll(function(){
						 $('.fixtitle',$(this)).css({'top':$(this).scrollTop()});	
				  });
		   }
		  
		   
		   
	    });	 
	 });
	 
	 
 });
// All End
  });
})(jQuery);