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
//= require_tree .

// $(function(){ $(document).foundation(); });

// function handle_bowl_update() {

// }

$(document).ready(function() {
	$("form.select_bowl_amt").on("submit", function(e) {
		e.preventDefault();

		$.ajax({
			url: $(this).attr("action"),
			data: $(this).serialize(),
			type: "POST",
			dataType: "json",
			success: function(data) {
				// console.log(data);
				var index = 0;
				for (var i=0; i < data.results.length; i++) {
					var foo = ich.bowls(data.results[index]);
					index += 1;
					$("div#update-bowl-container").append(foo);
					// if (index === 0) {
					// 	$(".bowl-form legend").replaceWith("Single Bowl Measurements")
					// }

 				}
			 	$("div#bowl-number").prop('disabled',true);
				$("div#bowl-number").children().prop('disabled',true);
				$("div#bowl-number").find("#button").hide();
				var number_of_bowls = $(".bowl-form").length;
				if (number_of_bowls === 1) {
					$(".bowl-form").addClass("large-12 columns");
				}
				else if (number_of_bowls === 2) {
					$(".bowl-form").addClass("large-6 columns");
				}
				else if (number_of_bowls === 3) {
					$(".bowl-form").addClass("large-4 columns");
				}
			}
		})
	});

	$("div#update-bowl-container").on("submit", function(e) {
		e.preventDefault();

		var data = [];
		$(this).find("form").each(function(index) {
			data[index] = $(this).serializeObject();
		});
		// console.log(data);

		$.ajax({
			url: $("form.edit_bowl").first().attr("action"),
			data: { _method: "PATCH", bowls: data },
			type: "POST",
			dataType: "json",
			success: function(data) {
				// console.log(data);
			}
		})
		

	});
})

$.fn.serializeObject = function()
{
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

// $(function() {
//     $("div#update-bowl-container").submit(function() {
//         $('#result').text(JSON.stringify($('form').serializeObject()));
//         return false;
//     });
// });


