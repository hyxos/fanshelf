$(document).ready(function() {

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $('#login_bttn').on('click',loginWindowClick)
  function loginWindowClick(){
    $('#login_window').show();
  }

  $('#hide_window').on('click',hideWindow)
  function hideWindow(){
    $('#login_window').hide();
  }

});
