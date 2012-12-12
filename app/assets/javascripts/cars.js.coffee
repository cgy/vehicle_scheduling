# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

  $('#cars').dataTable
    sPaginationType: "bootstrap"
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#cars').data('source')
    #排版
    #"sDom": "<'span6'<'row'<'span3'l><'span1'r><'span2'f>>><'span6't><'span6'<'row'<'span3'i><'span3'p>>>"
    "sDom": "<'span6'<'row'<'span2'l><'span1'T><'span1'r><'span2'f>>><'span6't><'span6'<'row'<'span3'i><'span3'p>>>"

    #首次打开默认以第六列排序
    "aaSorting": [[ 0, "asc" ]]

    "bAutoWidth": false
    "sScrollX": "100%"
    "oTableTools": {
      "sRowSelect": "single"
      "aButtons": [
        {
          "sExtends":    "xls",
          "sButtonText": "导出"
        }
      ]
    }



  $(".cancle").click ->
    $("#form-wapper").hide()


  $("#alert-info").html('')
