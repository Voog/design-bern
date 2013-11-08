;(function($) {
	var handleLangMenuClick = function() {
		$(".lang-btn").click(function() {
			$(".lang-menu-popover").fadeToggle("fast");
		});
	};

	var init = function() {
		handleLangMenuClick();
	};

	init();

})(jQuery);