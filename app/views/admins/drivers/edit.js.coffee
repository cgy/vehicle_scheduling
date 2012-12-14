jQuery ->
  $("#form-wapper").html("<%= j render(:partial => 'edit_form', :locals => {:driver => @driver}) %>")
  $("#form-wapper").show()
  $("#edit_driver").enableClientSideValidations()
  $(".cancle").click ->
    $("#form-wapper").hide()

  $("#alert-info").html('')
