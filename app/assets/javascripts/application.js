//= require jquery
//= require rails-ujs
//= require_tree .
//= require datatables


$(function () {
  $(document).on('change', '.remote-select', function (e) {
    var url = $(this).find(':selected').attr('data-url')
    var target = $(this).attr('data-target')

    if (url) {
      $.ajax({
        url: url,
        method: 'GET',
        success: function (json) {
          var target_select = $(target)
          console.log('target select:', target_select)
          target_select.empty()
          json.map(function (item) {
            value = $('<option></option>').attr('value', item.id).text(item.name)
            console.log('Item:', item, 'value:', value)
            target_select.append(value)
          })
          // target_select.trigger('chosen:updated')
        },
        error: function () {}
      })
    }
  })
})

$(document).ready(function() {
  $("#dttb").dataTable(
    {
      "lengthMenu": [[25, -1], [25, "All"]],
      "scrollY": 200,
      "paging":   false,
      "info": false
    }
  );
});