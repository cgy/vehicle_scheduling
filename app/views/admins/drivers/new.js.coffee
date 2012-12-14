jQuery ->
  $("#form-wapper").html("<%= j render(:partial => 'new_form', :locals => {:driver => @driver}) %>")
  $("#form-wapper").show()
  $("#new_driver").enableClientSideValidations()
  $(".cancle").click ->
    $("#form-wapper").hide()

  $("#alert-info").html('')

