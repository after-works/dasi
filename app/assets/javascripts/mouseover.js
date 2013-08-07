function tooltip_init (div, title, tooltip) {
	div.hover(
		function(e){//mouse over
			if ( $('.mint-tooltip').is(":visible") )
				return
			$('#'+tooltip+' .text').html ( title )
    		//$('#'+tooltip).css({top:e.clientX, left:e.clientY-50})
			$('#'+tooltip).show()
		}, 
		function(e){//mouse leave
			$('.mint-tooltip').hide()
		}
	);	
}
