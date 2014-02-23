jQuery ->
  $(document).on 'click.bs.modal.data-api', '[data-toggle="modal"]', ->
    $this   = $(this)
    href    = $this.attr('href')
    $target = $($this.attr('data-target') || (href && href.replace(/.*(?=#[^\s]+$)/, ''))) # strip for ie7
    galleryIndex = $this.data('galleryIndex')
    if galleryIndex?
      $target.find('.carousel').carousel(galleryIndex)
