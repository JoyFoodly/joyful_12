# Hacky column height adjustment

jQuery ->
  setTimeout(->
    console.log "SETTING HEIGHT"
    $('[data-col-height="max"]').each ->
      $this = $(this)
      tallestColHeight = Math.max.apply(Math, $this.children().map(-> $(this).height()).get())
      $this.children().each (_, col) ->
        $(col).height(tallestColHeight)
  , 0)