$(document).ready(function(){

//Need to pull off the "#" from the string
	var data = window.location.hash.substring(1);

	//if the string is empty that means there is no data and
	//the browser does not support the API.
	if (data != ""){
		data = JSON.parse(data);
		showW3cNavPerformanceData(data);
	}else{
		$(document.body).html($("#w3c-nav-bookmarklet-notsupported").render({}));
	}
});
