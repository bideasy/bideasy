$(function() {
	$( "#s_datepicker" ).datepicker({
		dateFormat : 'yy/mm/dd',
        changeMonth :false,
        changeYear : false,
        yearRange: '+1y:c+nn',
        minDate: '0d',
        maxDate: '0d'
    });

});