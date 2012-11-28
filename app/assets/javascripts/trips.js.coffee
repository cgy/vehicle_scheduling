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
    "sDom": "<'row'<'span9'l><'span9'f>r>t<'row'<'span9'i><'span9'p>>"
    sAjaxSource: $('#trips').data('source')
    "oLanguage": {
    "sLengthMenu": "_MENU_ records per page"
    }

