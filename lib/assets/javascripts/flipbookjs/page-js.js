/*-----------------------------------------------------------------------------------*/
/*	jQuery for Pages
/*-----------------------------------------------------------------------------------*/

/* Table Of Content */
jQuery(document).ready(function($) {
	var flipbook = $('div.flipbook');
	//console.log('start jq');
	flipbook.find('div.page-content div.preview-content.toc ul.toc li').hover(function(){ 
		console.log('hover');
		$(this).find('span.number, span.text').clearQueue();
		$(this).find('span.number, span.text').animate( { backgroundColor: '#f68747' }, 200);
		    /* #892667 */
	}, function() {
		//$(this).find('span.number, span.text').clearQueue();
		$(this).find('span.number, span.text').animate( { backgroundColor: '#a9a5b2' }, 200);
		   /*orig color #A6B0BB*    '#606060' */
	});
});
