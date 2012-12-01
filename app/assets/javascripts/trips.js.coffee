# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('.chzn-select').chosen()
  $('.chzn-select-deselect').chosen({ allow_single_deselect:true })

  $('#trips').dataTable
    sPaginationType: "bootstrap"
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#trips').data('source')
    #排版
    "sDom": "<'row'<'span3'l><'span2'r><'span4'f>>t<'row'<'span5'i><'span4'p>>"
    #禁用第三、七列排序
    "aoColumnDefs": [
      { "bSortable": false, "aTargets": [ 2 ] },
      { "bSortable": false, "aTargets": [ 7 ] }
    ]
    #首次打开默认以第六列排序
    "aaSorting": [[ 5, "desc" ]]

    "bAutoWidth": false,
    "sScrollX": "100%",
    "aoColumns": [
      { "sWidth": "65px", "aTargets": [ 0 ] },
      { "sWidth": "40px", "aTargets": [ 1 ] },
      { "sWidth": "145px", "aTargets": [ 2 ] },
      { "sWidth": "50px", "aTargets": [ 3 ] },
      { "sWidth": "65px", "aTargets": [ 4 ] },
      { "sWidth": "65px", "aTargets": [ 5 ] },
      { "sWidth": "45px", "aTargets": [ 6 ] },
      { "sWidth": "25px", "aTargets": [ 7 ] },
    ]




