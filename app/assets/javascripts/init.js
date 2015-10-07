
$(document).ready(function() {
 
   //dropdown
   $(".dropdown-button").dropdown({belowOrigin: true});

   // sidebar
    $('.button-collapse').sideNav();
    $('.parallax').parallax();

    //for dropdowns
     $('select').material_select();
     
      //input form
     $('input#input_text, textarea#textarea1').characterCounter();
     
     //materialbox for image
     $('.materialboxed').materialbox();
     
      //modal
    $('.modal-trigger').leanModal();  // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    
     //tabs
      $('ul.tabs').tabs();
    
    
     //datepicker
    $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 150 // Creates a dropdown of 15 years to control year
 
    
  });
});



        