jQuery ->
  $("#form-wapper").html("<%= j render(:partial => 'edit_form', :locals => {:worker => @worker}) %>")
  $("#form-wapper").show()
  $("#edit_worker").enableClientSideValidations()
  $(".cancle").click ->
    $("#form-wapper").hide()

  $("#worker_password").val("000000")
  $("#worker_password_confirmation").val("000000")

  $("#password-group").hide()
  $("#password-confirmation-group").hide()

  $("input[type=checkbox]").change ->
    if $(this).is(":checked")
      $("#password-group").show()
      $("#password-confirmation-group").show()
      $("#worker_password").val("")
      $("#worker_password_confirmation").val("")
    else
      $("#password-group").hide()
      $("#password-confirmation-group").hide()

  $("#alert-info").html('')
