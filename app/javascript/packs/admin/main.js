import 'bootstrap/dist/js/bootstrap';
import "slick-carousel/slick/slick";

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})

// page init
jQuery(function(){
	"use strict";
	initSlickSlider();
});

// page init
function initSlickSlider() {

	jQuery(".product-slider").slick();

	jQuery('.pagg-slider').slick({
		slidesToShow: 4,
		slidesToScroll: 1,
		centerPadding: '0',
		asNavFor: '.product-slider',
		focusOnSelect: true,
		responsive: [
		{
		  breakpoint: 1024,
		  settings: {
		    slidesToShow: 3,
		  }
		}
		]
	});
};
