!function () {
  'use strict';

  $("#js-shortener-form").submit(function(event) {

    /* stop form from submitting normally */
    event.preventDefault();

    /* get some values from elements on the page: */
    var $form = $(this)
    var term = $form.find('input[name="s"]').val()
    var url = $form.attr('action')

    /* Send the data using post */
    var posting = $.post(url, {
      s: term
    });

    /* Put the results in a div */
    posting.done(function(data) {
      var content = $(data).find('#content');
      $("#result").empty().append(content);
    });
  })
}()
