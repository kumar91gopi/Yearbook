(function($){
  $(function(){

    $('.button-collapse').sideNav();
    $('.parallax').parallax();

  }); // end of document ready
})(jQuery); // end of jQuery name space

//for dropdowns

 $(document).ready(function() {
    $('select').material_select();
  });
  
  
  //input form
  
  $(document).ready(function() {
    $('input#input_text, textarea#textarea1').characterCounter();
  });
        
  //date picker
   $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 150 // Creates a dropdown of 15 years to control year
  });