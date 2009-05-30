/*
 * Specific Styling
 * Author: Joseph Pecoraro
 */

$(function() {
	
	// Hover on each of the Quotes
	$('.q').hover(
		function() {
			// $(this).find('.num').css('display','block');
			$(this).css('backgroundColor','#FAFAFA');
			$(this).find('.author').css('opacity', 1);
			$(this).find('.tags').show();
		},
		function() {
			// $(this).find('.num').css('display','none');
			$(this).animate({backgroundColor:'white'});
			$(this).find('.author').animate({opacity:0});
			$(this).find('.tags').fadeOut();
		}
	);
	
	// States
	var $quotes = $('.q');
	var showing = 10;
	var total = $quotes.length;
	var step = 10;
	var viewPercent = document.body.scrollHeight * 0.75;

	// Automatically show the next 10 quotes when the user
	// scrolls to 75% of the page
	$(window).scroll(function() {
		var currentHeight = document.body.scrollTop + self.innerHeight;
		if ( currentHeight > viewPercent ) {
			for (var i=0; i<step && showing<total; i++) {
				$($quotes.get(i+showing)).fadeIn();
				showing++;
			};
			viewPercent = document.body.scrollHeight * 0.75;					
		}
	});
	
});