function popup ( div ) {
	var maskHeight  = $(document).height();
	var maskWidth = $(document).width();

    var dialogTop =  (maskHeight/2) - ($('.dialog-box').height());  
    var dialogLeft = (maskWidth/2) - ($('.dialog-box').width()/2); 
    
    $('.dialog-overlay').css({height:maskHeight, width:maskWidth}).show();
    $('.dialog-box').css({top:dialogTop, left:dialogLeft}).show();
    
    // display the message
    $('#dialog-message').html(div.html());
}

function popdown () {
    $('.dialog-overlay, .dialog-box').hide();
}