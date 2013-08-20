ACCMOB.address = {

	defaultDialogConfig: {
		mode: 'blank',
		dialogForce: false,
		showModal: true,
		headerText: '',
		headerClose: true,
		animate: false,
		zindex: 9999,
		blankContent: '',
		themeDialog: 'b',
		themeInput: 'e',
		themeButtonDefault: false,
		themeHeader: 'a',
		callbackOpen: ACCMOB.common.lockScreen,
		callbackClose: ACCMOB.common.unlockScreen
	},

	bindCountrySpecificAddressForms: function ()
	{
		$('#countrySelector :input').on("change", function ()
		{
			var options = {
				'addressCode': '',
				'countryIsoCode': $(this).val()
			};

			ACCMOB.address.displayCountrySpecificAddressForm(options, ACCMOB.address.showAddressFormButtonPanel);
		})
	},

	showAddressFormButtonPanel: function ()
	{
		if ($('#countrySelector :input').val() !== '')
		{
			$('#addressform_button_panel').show();
		}
	},

	displayCountrySpecificAddressForm: function (options, callback)
	{
		$.ajax({
			url: ACCMOB.config.contextPath + '/my-account/addressform',
			async: true,
			data: options,
			dataType: "html",
			beforeSend: function ()
			{
				$.mobile.showPageLoadingMsg();
			}
		}).done(function (data)
				{
					$("#i18nAddressForm").html($(data).html());
					ACCMOB.address.updateFormElements();
					if (typeof callback == 'function')
					{
						callback.call();
					}
					$.mobile.hidePageLoadingMsg();
				});
	},

	displayCountrySelector: function ()
	{
		$('#countrySelector').show();
	},

	displaySuggestedAddressesPopup: function ()
	{
		var config = ACCMOB.address.defaultDialogConfig;
		$.extend(config, {blankContent: $("#popup_suggested_delivery_addresses").html()});
		var dialog = $(document.createElement('div'));
		dialog.simpledialog2(config);
	},

	initSuggestedAddressesPopup: function ()
	{
		var status = $('.add_edit_delivery_address_id').attr('status');
		if (status != null && "hasSuggestedAddresses" == status)
		{
			$("#use_suggested_address_button").live("click", function ()
			{
				$("#use_suggested_address form").submit();
			})

			$("#submit_address_as_is_button").live("click", function ()
			{
				$("#submit_as_is form").submit();
			})

			// NOTE: Jquery events were not triggering properly in this case.
			// This native js did the trick.
			document.onreadystatechange = function ()
			{
				if (document.readyState === "complete")
				{
					ACCMOB.address.displaySuggestedAddressesPopup();
				}
			}
		}
	},

	updateFormElements: function ()
	{
		$("div.i18nAddressForm input[type='checkbox']").checkboxradio();
		$("div.i18nAddressForm input[type='text']").textinput();
		$("div.i18nAddressForm [data-role=button]").button();
		$("div.i18nAddressForm fieldset").controlgroup();
		$("div.i18nAddressForm select").selectmenu();
	},

	initialize: function ()
	{
		with (ACCMOB.address)
		{
			displayCountrySelector();
			bindCountrySpecificAddressForms();
			initSuggestedAddressesPopup();
			showAddressFormButtonPanel();
		}
	}
};

$(document).ready(function ()
{
	ACCMOB.address.initialize();
});
