function popup ( div ) {
	var maskHeight  = $(document).height();
	var maskWidth = $(document).width();

    var dialogTop;  
    var dialogLeft; 
    
    $('.dialog-box').html(div.html());
    
    $(".dialog-box").mCustomScrollbar("update")

    dialogTop =  (maskHeight/2) - ($('.dialog-box').height()/2);
	dialogLeft = (maskWidth/2) - ($('.dialog-box').width()/2); 

	if ( dialogTop <0 )
		dialogTop = 0

    $('.dialog-overlay').css({height:maskHeight, width:maskWidth}).show();
    $('.dialog-box').css({top:dialogTop, left:dialogLeft}).show();

    $(".dialog-box").mCustomScrollbar({
        theme : "light",
        mouseWheelPixels: 500
    });
}

function popdown () {
    $('.dialog-overlay, .dialog-box').hide();
}
