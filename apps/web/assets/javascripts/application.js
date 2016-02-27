!function () {
  'use strict';

  $("#js-shortener-form").submit(function(event) {
    event.preventDefault();

    var $form = $(this)
    var link = $form.find('input[name="link[url]"]').val()
    var url = $form.attr('action')

    $.ajax({
      type: "POST",
      url: url,
      data: { url: link }, // serializes the form's elements.
      success: function(data) {
        alert(data); // show response from the php script.
      }
    })
  })
}()
