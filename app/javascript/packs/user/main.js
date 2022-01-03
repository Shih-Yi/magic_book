import 'bootstrap/dist/js/bootstrap';
import "slick-carousel/slick/slick";

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})

 // page init
jQuery(function(){
	"use strict";
	// SlickSlider init

		jQuery(".product-slider").slick();
});
