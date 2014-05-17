$(function() {
$(" #e_datepicker" ).datepicker({
    	dateFormat: 'yy/mm/dd',
    	changeMonth: true,
    	changeYear: true,
    	minDate: '+1d',
    	maxDate: '+15d'
    });
});