
function popup ( div ) {
	var maskHeight  = $(document).height();
	var maskWidth = $(document).width();

    var dialogTop;  
    var dialogLeft; 
    
    $('.dialog-box').html(div.html());
    
    dialogTop =  (maskHeight/2) - ($('.dialog-box').height());  
	dialogLeft = (maskWidth/2) - ($('.dialog-box').width()/2); 

	if ( dialogTop <0 )
		dialogTop = 0

    $('.dialog-overlay').css({height:maskHeight, width:maskWidth}).show();
    $('.dialog-box').css({top:dialogTop, left:dialogLeft}).show();
}

function popdown () {
    $('.dialog-overlay, .dialog-box').hide();
}
