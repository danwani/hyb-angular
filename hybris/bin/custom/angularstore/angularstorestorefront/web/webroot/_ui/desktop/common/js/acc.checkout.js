ACC.checkout = {
	spinner: $("<img id='taxesEstimateSpinner' src='" + ACC.config.commonResourcePath + "/images/spinner.gif' />"),

	bindAll: function ()
	{
		this.bindCheckO();
	},

	bindCheckO: function ()
	{
		var cartEntriesError = false;
		$('.doCheckoutBut').click(function ()
		{
			cartEntriesError = ACC.pickupinstore.validatePickupinStoreCartEntires();
			if (!cartEntriesError)
			{
				window.location = checkoutUrl;
			}
			return false;
		});


		// Alternative checkout flows options
		$('.doFlowSelectedChange').change(function ()
		{
			if ('multistep-pci' == $('#selectAltCheckoutFlow').attr('value'))
			{
				$('#selectPciOption').css('display', '');
			}
			else
			{
				$('#selectPciOption').css('display', 'none');

			}
		});

		// Alternative checkout flows version of the doCheckout method to handle the checkout buttons on the cart page.
		$('.doCheckoutBut').click(function ()
		{
			if (!cartEntriesError)
			{
				var flow = $('#selectAltCheckoutFlow').attr('value');
				if ('' == flow)
				{
					// No alternate flow specified, fallback to default behaviour
					window.location = checkoutUrl;
				}
				else
				{
					// Fix multistep-pci flow
					if ('multistep-pci' == flow)
					{
						flow = 'multistep';
					}
					var pci = $('#selectPciOption').attr('value');

					// Build up the redirect URL
					var redirectUrl = checkoutUrl + '/select-flow?flow=' + flow + '&pci=' + pci;
					window.location = redirectUrl;
				}
			}
			return false;
		});

		$('#estimateTaxesButton').click(function ()
		{
		    $('#zipCodewrapperDiv').removeClass("form_field_error");
            $('#countryWrapperDiv').removeClass("form_field_error");
            $('div#selectAValidZipCode').hide();
            $('div#selectAValidCountry').hide();


			if ($('#zipCode').val() == "")
            {
            	$('div#selectAValidZipCode').show().focus();
            	$('#zipCodewrapperDiv').addClass("form_field_error")
            } else if ($('#countryIso').val() == "")  {
            	$('div#selectAValidCountry').show().focus();
                $('#countryWrapperDiv').addClass("form_field_error")
            } else {
            	$("#order_totals_container").append(ACC.checkout.spinner);
				$.getJSON("cart/estimate", {zipCode: $('#zipCode').val(), isocode: $('#countryIso').val()  }, function(estimatedCartData) {
			  				$("#estimatedTotalTax").text(estimatedCartData.totalTax.formattedValue)
			  				$("#estimatedTotalPrice").text(estimatedCartData.totalPrice.formattedValue)
                			$(".estimatedTotals").show();
                			$(".realTotals").hide();
                			$("#taxesEstimateSpinner").remove();

			  	});


			}
   		});
	}

};

$(document).ready(function ()
{
	ACC.checkout.bindAll();
});
