/*
 * Specific Styling
 * Author: Joseph Pecoraro
 */
jQuery = jQuery.noConflict(true);
jQuery(function() {
	
	// Hover on each of the Quotes
	jQuery('.q').hover(
		function() {
			// jQuery(this).find('.num').css('display','block');
			jQuery(this).css('backgroundColor','#FAFAFA');
			jQuery(this).find('.author').css('opacity', 1);
			jQuery(this).find('.tags').show();
		},
		function() {
			// jQuery(this).find('.num').css('display','none');
			jQuery(this).animate({backgroundColor:'white'});
			jQuery(this).find('.author').animate({opacity:0});
			jQuery(this).find('.tags').fadeOut();
		}
	);
	
	// States
	var $quotes = jQuery('.q');
	var showing = 10;
	var total = $quotes.length;
	var step = 10;
	var viewPercent = document.body.scrollHeight * 0.75;

	// Automatically show the next 10 quotes when the user
	// scrolls to 75% of the page
	jQuery(window).scroll(function() {
		var currentHeight = document.body.scrollTop + self.innerHeight;
		if ( currentHeight > viewPercent ) {
			for (var i=0; i<step && showing<total; i++) {
				jQuery($quotes.get(i+showing)).fadeIn();
				showing++;
			};
			viewPercent = document.body.scrollHeight * 0.75;					
		}
	});
	
});


function mark_for_remove(elem) {
	$(elem).next('.should_remove').value = 1;
	$(elem).up('.tag').hide();
}