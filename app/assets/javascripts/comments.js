function show_recmt_form ( cmt_id ) {
	if ( $("#detail-re-cmt-form-"+cmt_id).is(":visible") ) {
		return ;
	}
	hide_all_recmt_form();
	$("#detail-re-cmt-form-"+cmt_id).show('fast')
	$("#detail-re-cmt-form-"+cmt_id + " #comment_context").focus()
}

function hide_all_recmt_form () {
	var i;
	var selector = $(".detail-re-cmt-form");
	
	for (i=0 ; i<selector.length ; i++ ){
		selector.eq(i).hide()
	}
}