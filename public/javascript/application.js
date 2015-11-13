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

  $('#login_window').on('click',hideWindow)
  $('#hide_window').on('click',hideWindow)
  function hideWindow(){
    $('#login_window').hide();
  }

  $('.login_text').on('click',preventClick)
  function preventClick(e){
    // debugger
    e.stopPropagation
    ();
  }


});
