import "bootstrap";

import "controllers"

import "../plugins/flatpickr"

import 'bootstrap/dist/js/bootstrap'
import 'bootstrap/dist/css/bootstrap'

import 'assets/javascripts/scripts.js'
import 'assets/stylesheets/styles.css'

import '@fortawesome/fontawesome-free/js/all'
import '@fortawesome/fontawesome-free/css/all.css'

require('./nested-forms/addFields');
require('./nested-forms/removeFields');

// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// copied from application.js in assets pipeline

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
        },
        error: function () {}
      })
    }
  })
})

// $(document).ready(function() {
//   $("#dttb").dataTable(
//     {
//       "lengthMenu": [[10, 25, -1], [10, 25, "All"]],
//       "info": false,
//       scrollCollapse: true,
      
//     }
//   );
// });