;(function($) {
	var handleLangMenuClick = function() {
		$(".lang-btn").click(function() {
			$(".lang-menu-popover").fadeToggle("fast");
		});
	};

	var handleMobileMenuClick = function() {
		$(".mobile-menu-btn-wrap").click(function() {
			$(".mobile-menu-wrap .menu").slideToggle("fast");
		});
	};

	var init = function() {
		handleLangMenuClick();
		handleMobileMenuClick();
	};

	init();

})(jQuery);