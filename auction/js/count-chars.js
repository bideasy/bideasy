function countChars(textbox, counter, max) {
  var count = max - document.getElementById(textbox).value.length;
  if (count <= 0) 
	  { document.getElementById(counter).innerHTML =
	  "<span style=\"color: red;\">" +"exceeded maximum length :"+max + "</span>"; 
alert('feedback must be less than 1024 characters');
 document.getElementById('textbox').value='';
  
  }
  else { document.getElementById(counter).innerHTML = count; }
}