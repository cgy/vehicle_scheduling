jQuery ->
  $("#form-wapper").html("<%= j render(:partial => 'new_form', :locals => {:worker => @worker}) %>")
  $("#form-wapper").show()
  $("#new_worker").enableClientSideValidations()
  $(".cancle").click ->
    $("#form-wapper").hide()

  $("#alert-info").html('')

