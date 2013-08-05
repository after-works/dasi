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
	$(".detail-rank").mCustomScrollbar({
		theme : "light",
		mouseWheelPixels: 500
	});

	$(".detail-comment").mCustomScrollbar({
		theme : "light",
		mouseWheelPixels: 500
	});
	
	$("#mint-list").masonry()
})

function add_songtag() {
	popup ( $("#songtag-dialog"))
}

function songtag_form_add_song() {
	var mint_title = $("input[name='add-mint-name-in-new-songtag']")[0].value;
	var mint_youtube_link = $("input[name='add-mint-youtube-link-in-new-songtag']")[0].value;
	var patt=/(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/ ]{11})/i;
	var mint_youtube_id = patt.exec(mint_youtube_link)[1];
	//잘못된 id를 넣었을 경우도 Validation Check필요할 듯. Youtube id 는 11글자인걸로 알고있음
	if(mint_title == "") {
		alert("Please type mint_title");
	} else if(mint_youtube_link == "") {
		alert("Please type mint_youtube_link");
	} else if(mint_youtube_id == null) {
		alert("Please type right youtube link");
	} else {
		$('#add-song-list-in-new-songtag').append('<li><img src="http://img.youtube.com/vi/'
									 + mint_youtube_id + '/0.jpg"/>'
									 + mint_title 
									 + '<input id="songtag_song__youtube_id" name="songtag[song][][youtube_id]" type="hidden" value="' + mint_youtube_id + '">' 
									 + '<input id="songtag_song__title" name="songtag[song][][title]" type="hidden" value="' + mint_title + '">');
	}
}
