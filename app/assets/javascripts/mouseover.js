function tooltip_init (div, title, tooltip) {
	div.hover(
		function(e){//mouse over
			if ( $('.mint-tooltip').is(":visible") )
				return
			$('#'+tooltip+' .text').html ( title )
    		//$('#'+tooltip).css({top:e.clientX, left:e.clientY})
    		$('#'+tooltip).css({"background-color":"white"})
    		$('#'+tooltip).css({"border":"3px solid #01a5b3"})
    		$('#'+tooltip).css({"padding":"5px"})
			$('#'+tooltip).show()
		}, 
		function(e){//mouse leave
			$('.mint-tooltip').hide()
		}
	);	
}
