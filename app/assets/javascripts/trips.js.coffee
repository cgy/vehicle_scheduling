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
    "sDom": "<'row'<'span3'l><'span2'r><'span4'f>>t<'row'<'span4'i><'span4 offset1'p>>"



