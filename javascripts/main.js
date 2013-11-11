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

	var handleWindowResize = function() {
		$(window).resize(function() {
			if ($(window).width() > 900) {
				$(".mobile-menu-wrap .menu").hide();
			}
		});
	};

	var handlePopoverMenuHide = function() {
		$(document).mouseup(function (e) {
			var langMenu = $(".lang-menu-popover");

			if (!langMenu.is(e.target) && langMenu.has(e.target).length === 0) {
				langMenu.fadeOut("fast");
			}
		});
	};

	var init = function() {
		handleLangMenuClick();
		handleMobileMenuClick();
		handleWindowResize();
		handlePopoverMenuHide();
	};

	init();

})(jQuery);