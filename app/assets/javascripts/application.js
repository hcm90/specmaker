// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

$(function(){ $(document).foundation(); });

$(document).ready(function() {
	$("form.select_bowl_amt").on("submit", function(e) {
		e.preventDefault();

		$.ajax({
			url: $(this).attr("action"),
			data: $(this).serialize(),
			type: "POST",
			dataType: "json",
			success: function(data) {
				console.log(data);
				var index = 0;
				for (var i=0; i < data.results.length; i++) {
				// loop over data.results {
					var foo = ich.bowls(data.results[index]);
					var index += 1;
					$("div.row").append(foo);
				 }
			}
		})
	});
})



$(function() {  
	$('#front_back').onblur(function() {
	var value = $(this).val();
  	if (value == 20) {
    	$('#colander_true').attr('enabled');
    }
  	else {
    	$('#colander_true').attr('disabled');
    }
  });
});


