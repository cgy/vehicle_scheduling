jQuery ->
  $("#form-wapper").html("<%= j render(:partial => 'edit_form', :locals => {:worker => @worker}) %>")
  $("#form-wapper").show()
  $("#edit_worker").enableClientSideValidations()
  $(".cancle").click ->
    $("#form-wapper").hide()

  $("#alert-info").html('')
