jQuery ->
  $("#form-wapper").html("<%= j render(:partial => 'form', :locals => {:car => @car}) %>")
  $("#form-wapper").show()
  $(".cancle").click ->
    $("#form-wapper").hide()

  $("#alert-info").html('')
