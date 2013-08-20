ACC.common = {

	refreshScreenReaderBuffer: function ()
	{
		// changes a value in a hidden form field in order
		// to trigger a buffer update in a screen reader
		$('#accesibility_refreshScreenReaderBufferField').attr('value', new Date().getTime());
	},

	bindAll: function ()
	{
		ACC.common.bindToUiCarouselLink();
		ACC.common.bindShowProcessingMessageToSubmitButton();
	},

	bindToUiCarouselLink: function ()
	{
		$("ul.carousel > li a.popup").colorbox({
			onComplete: function ()
			{
				ACC.common.refreshScreenReaderBuffer();
				$.colorbox.resize()
			},

			onClosed: function ()
			{
				ACC.common.refreshScreenReaderBuffer();
			}
		});
	},
	
	processingMessage: $("<img src='" + ACC.config.commonResourcePath + "/images/spinner.gif'/>"),

	bindShowProcessingMessageToSubmitButton : function () {
		
		$(':submit.show_processing_message').each(function(){
			$(this).on("click",ACC.common.showProcessingMessageAndBlockForm)			
		});
	},
	
	showProcessingMessageAndBlockForm: function ()
	{
		var form = $(this).parents('form:first');
		form.block({ message: ACC.common.processingMessage });  
	},

	blockFormAndShowProcessingMessage: function (submitButton)
	{
		var form = submitButton.parents('form:first');
		form.block({ message: ACC.common.processingMessage });  
	}
	
};

$(document).ready(function ()
{
	ACC.common.bindAll();
});

