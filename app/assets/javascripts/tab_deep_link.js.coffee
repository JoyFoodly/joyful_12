jQuery ->
  hash = document.location.hash
  if $('.js-tab-link').length and hash
    $('.js-tab-link').each (index, link)->
      $link = $(link)
      setTimeout((-> $link.tab('show')), 0) if $link.attr('id') == hash.replace('#', '')
