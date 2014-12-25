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