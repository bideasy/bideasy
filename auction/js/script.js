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

		$('#registration_form').validate({
	    rules: {
	      fname: {
	        minlength: 2,
			maxlength: 20,
	        required: true,
			fname:true
	      },
				lname: {
	        minlength: 2,
			maxlength: 20,
	        required: true,
				lname:true
	      },
				uname: {
	        minlength: 2,
			maxlength: 20,
	        required: true
	      },
	      email: {
			maxlength: 80,
	        required: true,
	        email: true
	      },
				pass: {
	        minlength: 6,
			maxlength: 20,
	        required: true
	      },
			confirmpass: {
	        minlength: 6,
			maxlength: 20,
	        required: true,
			equalTo:"#pass"
		
	      },
			phone: {
			  phone:true,
	        minlength: 10,
			maxlength: 15,
	        required: true
			
	      },
				
	         dob: {
	      	minlength: 10,
	        required: true,
			date:true
	      },
	         address: {
	        minlength: 2,
	        required: true
	      },
			country: {
	        required: true
	      },
			state: {
	        required: true
	      },
				city: {
			maxlength: 20,
	        required: true
	      },
				zip: {
	        required: true,
				zip:true
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