$(document).ready(function() {
	$('#new_upload').uploadProgress({
		jqueryPath: "/js/jquery.js",
		uploadProgressPath: "/js/jquery.uploadProgress.js",
		progressBar: "#progressbar",
		progressUrl: "/progress",
		interval: 1000,
		dataType: 'jsonp',
		start: unhide
    });

});

function unhide() {
	$('#upload_progress').fadeIn().removeClass('hidden');
}
