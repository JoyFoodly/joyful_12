$ ->
	$("#signin-box").click(->
		$("#signin_form").submit()
	)

$ ->
	$("#signup_button").click( ->
		data_obj = $('#strip-data').data()
		token = (res) ->
			inputs = []
			inputs[0] = $('<input type=hidden name=stripeToken />').val(res.id)
			inputs[1] = $('<input type=hidden name=stripeBillingName />').val(res.card.name)
			inputs[2] = $('<input type=hidden name=stripeEmail />').val(res.email)

			$('#signup_form').append(inputs).submit();
		data_obj['token'] = token
		data_obj['address'] = true

		StripeCheckout.open(data_obj)
		false;
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
	# Gotta fix this because of how Stripe adds an inline element style. :(
	$(".stripe-button-el span").css('display', 'inline-block')
