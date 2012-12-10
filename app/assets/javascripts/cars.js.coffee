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

    "bAutoWidth": false,
    "sScrollX": "100%",
  $(".form-horizontal").hide()
#  giRedraw = false
#
#  $(document).ready ->
#    # Add a click handler to the rows - this could be used as a callback
#    $("#cars tbody").click ->
#      $(oTable.fnSettings().aoData).each ->
#        $(this.nTr).removeClass('row_selected')
#
#      $(event.target.parentNode).addClass('row_selected')
#
#      # Add a click handler for the delete row
#    $('#delete').click ->
#      anSelected = fnGetSelected( oTable )
#      oTable.fnDeleteRow( anSelected[0] )
#
#    # Init the table
#    oTable = $('#cars').dataTable()
#
#    # Get the rows which are currently selected
#  fnGetSelected: (oTableLocal) ->
#    aReturn = new Array()
#    aTrs = oTableLocal.fnGetNodes()
#    for i in [0..(aTrs.length -1)]
#      if $(aTrs[i]).hasClass('row_selected')
#        aReturn.push( aTrs[i] )
#    aReturn
