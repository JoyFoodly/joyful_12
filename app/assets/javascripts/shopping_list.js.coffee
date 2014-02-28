jQuery ->
  $('[data-shopping-list-submit="true"] form').on('ajax:success', ->
    $parent = $(this).parent()
    if $parent.find('.submit-success').length
      # Already added
    else
      $submitSuccess = $('<div class="submit-success"><p>Success! <a href="/shopping_lists/current/edit">View shopping list ></a></p></div>')
      $parent.append($submitSuccess)
  )