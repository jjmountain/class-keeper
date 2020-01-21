//= require jquery
//= require rails-ujs
//= require_tree .

$(function () {
  $(document).on('change', '.remote-select', function (e) {
    var target = $(this).attr('data-target')
    var url = $(this).find(":selected").attr('data-url')
    if (url){
      $.ajax({
        url: url,
        method: 'GET',
        success: function (json) {
          console.log(json)
          var target_select = $(target)
          target_select.empty()
          json.map(function (item) {
            value = $('<option></option>').attr('value', item.id).text(item.name)
            target_select.append(value)
          })
        },
        error: function () { }
      })
    }
  })
})