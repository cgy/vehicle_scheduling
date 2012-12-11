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
    "sDom": "<'span6'<'row'<'span3'l><'span1'r><'span2'f>>><'span6't><'span6'<'row'<'span3'i><'span3'p>>>"
    #禁用第三、七列排序
    "aoColumnDefs": [
      { "bSortable": false, "aTargets": [ 3 ] }
    ]

    #首次打开默认以第六列排序
    "aaSorting": [[ 0, "asc" ]]

    "bAutoWidth": false
    "sScrollX": "100%"
    "oTableTools": {
      "sRowSelect": "multi"
    }


  $(".form-horizontal").hide()
