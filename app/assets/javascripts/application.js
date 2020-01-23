//= require jquery
//= require rails-ujs
//= require_tree .

// const remoteSelect = document.querySelector('.remote-select');
// remoteSelect.addEventListener('change', () => {
//   const target = remoteSelect.dataset.target
//   console.log(target)
//   const url = remoteSelect.options[remoteSelect.selectedIndex].dataset.url
  
//   if (url) {
//     fetch(url)
//       .then(data => {
//         const target_select = document.querySelector('#course_faculty')
//         console.log(target_select)

//       }).catch(error => {

//       });
//     }
//   })



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