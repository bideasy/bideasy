//
//	jQuery Validate example script
//
//	Prepared by David Cochran
//
//	Free for your use -- No warranties, no guarantees!
//

$(document).ready(function(){

	// Validate
	// http://bassistance.de/jquery-plugins/jquery-plugin-validation/
	// http://docs.jquery.com/Plugins/Validation/
	// http://docs.jquery.com/Plugins/Validation/validate#toptions

		$('#sell_form').validate({
	    rules: {

			pimage: {
				required: true
			},
			 
			pname: {
	        minlength: 2,
			maxlength: 20,
	        required: true,
	      },
			reserved_price: {
	        required: true,
			reserved_price:true
	      },
			start_price: {
	        required: true,
			start_price:true
	      },
	         
			category: {
	        required: true
		 },
	        description: {
	        minlength: 10,
			maxlength: 150,
	        required: true
	      }
	    },
			highlight: function(element) {
				$(element).closest('.control-group').removeClass('success').addClass('error');
			},
			success: function(element) {
				element
				.text('VALID').addClass('valid')
				.closest('.control-group').removeClass('error').addClass('success');
			}
	  });

}); // end document.ready