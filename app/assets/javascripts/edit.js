$('.callout').hide();
$(document).ready(function(){

	$('input[type=radio]').click(function(){

			    $('input[type=radio]').removeAttr("disabled");
	       		$('.callout').fadeOut();

		if (((this.id == '10mm') || (this.id == '25mm') || (this.id == '55mm')) && ($('#overmount').is(':checked'))){
					$("#undermount").prop("checked", true);
					$('#overmount').attr("disabled", "disabled");
					$('#error_installation').fadeIn();
		}
  
       	if (((this.id == '10mm') || (this.id == '25mm') || (this.id == '55mm')) && ($('#divider_lower').is(':checked'))){
					$("#divider_normal").prop("checked", true);
					$('#divider_lower').attr("disabled", "disabled");
					$('#error_divider_lower').fadeIn();
		}

		if (((this.id == '25mm') || (this.id == '55mm')) && ($('#divider_thin').is(':checked'))){
					$("#divider_normal").prop("checked", true);
					$('#divider_lower, #divider_thin').attr("disabled", "disabled");
					$('#error_divider_thin').fadeIn();
		}

		if ((this.id == 'overmount') && ($('#10mm, #25mm, #55mm').is(':checked'))){
					$("#0mm").prop("checked", true);
					$('#10mm, #25mm, #55mm').attr("disabled", "disabled");
					$('#error_corner_radius_installation').fadeIn();
       	}

       	if ((this.id == 'divider_lower') && ($('#10mm, #25mm, #55mm').is(':checked'))){
					$("#0mm").prop("checked", true);
					$('#10mm, #25mm, #55mm').attr("disabled", "disabled");
					$('#error_corner_radius_lower_divider').fadeIn();
       	}

		if ((this.id == 'divider_thin') && ($('#25mm, #55mm').is(':checked'))){
					$("#0mm").prop("checked", true);
					$('#25mm, #55mm').attr("disabled", "disabled");
					$('#error_corner_radius_thin_divider').fadeIn();
		}
	});
});


