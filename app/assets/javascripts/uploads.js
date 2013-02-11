$(document).ready(function() {
	$('#new_upload').uploadProgress({
		jqueryPath: "/js/jquery.js",
		uploadProgressPath: "/js/jquery.uploadProgress.js",
		progressBar: "#progressbar",
		progressUrl: "/progress",
		interval: 1000,
		dataType: 'jsonp',
		start: unhide,
        complete: hide
    });

});

function unhide() {
    $('#upload_button').attr('disabled','disabled');
	$('#upload_progress').fadeIn().removeClass('hidden');
}

function hide () {
    $('#upload_button').removeAttr('disabled');
    $('#upload_progress').fadeOut().addClass('hidden');
    $('#progressbar').width(0);
}
