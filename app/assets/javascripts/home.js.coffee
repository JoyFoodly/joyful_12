$ ->
  $("#signin-box").click( ->
    $("#signin_form").submit()
  )

$ -> 
	$("#hamburger_icon").click( ->
		# Have to do this because Bootstrap CSS interferes with the normal flow of jQuery toggle behavior :( Gah.
		current_vis = $('#loginbox').css('display')
		if current_vis == 'block'
			new_vis = 'none'
		else
			new_vis = 'block'

		# This won't work in <=IE8 but we only need it on mobile where IE8 has mercifully disappeared.
		$('#loginbox')[0].style.setProperty('display', new_vis, 'important')
		null
	)

$ ->
	$('.modal').on('shown.bs.modal', ->
		$(this).find('[autofocus]').focus()
	)
