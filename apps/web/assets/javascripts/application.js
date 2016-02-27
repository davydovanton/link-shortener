!function () {
  'use strict';

  $("#js-shortener-form").submit(function(event) {
    var $form = $(this)
    var link = $form.find('input[name="link[url]"]').val()
    var url = $form.attr('action')

    $.ajax({
      type: "POST",
      url: url,
      data: { url: link },
      success: function(params) {
        displayShortenerLink(params)
      }
    })

    event.preventDefault();
  })

  function displayShortenerLink(params) {
    var $form = $("#js-shortener-form")

    if(params.status == 'ok') {
      $form.find('input[name="link[url]"]').val(window.location.href + params.link)
    }
  }
}()
