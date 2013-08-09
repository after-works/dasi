// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .
//= require jquery.ui.all

$(window).load(function() {
	var window_height = $(window).height();
	var docMargin = 69;
	var videoHeight = 210 + 30 + 15 ;
	var padding = 15;

	detail_height_init ( window_height - docMargin - videoHeight -24, window_height - docMargin - 3*padding );//24이 뭔지 모르겠는데 여기저기 패딩, 마진합인듯.... 
	
	$(".detail-rank").mCustomScrollbar({
		theme : "light",
		mouseWheelPixels: 500
	});

	$(".detail-comment").mCustomScrollbar({
		theme : "light",
		mouseWheelPixels: 500
	});
	
	$("#mint-list").masonry()

	$(".detail_cmt_form #comment_context").focus();
})

function add_songtag() {
	popup ( $("#songtag-dialog"))
}

function songtag_form_add_song() {
	var mint_title = $("div.dialog-box input[name='add-mint-name-in-new-songtag']")[0].value;
	var mint_youtube_link = $("div.dialog-box input[name='add-mint-youtube-link-in-new-songtag']")[0].value;
	var patt=/(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/ ]{11})/i;
	var mint_youtube_id = patt.exec(mint_youtube_link);
	if(mint_title == "") {
		alert("Please type mint_title");
	} else if(mint_youtube_link == "") {
		alert("Please type mint_youtube_link");
	} else if(mint_youtube_id == null) {
		alert("Please type right youtube link");
	} else {
		$("div.dialog-box ul[name='add-song-list-in-new-songtag']").append('<li><img src="http://img.youtube.com/vi/'
									 + mint_youtube_id[1] + '/0.jpg"/>'
									 + mint_title 
									 + '<a href="#" onclick="sngtg_del_song($(this).parent())">제거</a>'
									 + '<input id="songtag_song__youtube_id" name="songtag[song][][youtube_id]" type="hidden" value="' + mint_youtube_id[1] + '"/>' 
									 + '<input id="songtag_song__title" name="songtag[song][][title]" type="hidden" value="' + mint_title + '"/></li>');
		if($("div.dialog-box li").length >= 15) {
			$("div.dialog-box a[name='add-song-to-table']").hide();
		}
		if($("div.dialog-box li").length > 0) {
			$("div.dialog-box input[name='commit']").removeAttr("disabled");
		}
		$('.dialog-box').mCustomScrollbar("update");
	}
}

function sngtg_del_song(elem){
	if(confirm('Delete this element?')){
		$(elem).remove();
		console.log($("div.dialog-box li").length)
		if($("div.dialog-box li").length <= 0) {
			$("div.dialog-box input[name='commit']").attr("disabled", "disabled");
		}
		if($("div.dialog-box li").length < 15) {
			$("div.dialog-box a[name='add-song-to-table']").show();
		}
		
		$('.dialog-box').mCustomScrollbar("update");
	}
}
