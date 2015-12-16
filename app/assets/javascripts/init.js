
$(document).ready(function() {
 
   //dropdown
   $('.dropdown-button').dropdown({
      inDuration: 300,
      outDuration: 225,
      constrain_width: true, // Does not change width of dropdown to that of the activator
      hover: false, // Activate on hover
      gutter: 0, // Spacing from edge
      belowOrigin: false, // Displays dropdown below the button
      alignment: 'left' // Displays dropdown with edge aligned to the left of button
    }
  );

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



        