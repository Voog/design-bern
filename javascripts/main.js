;(function($) {
	var handleLangMenuClick = function() {
		$(".lang-btn").click(function() {
			console.log("test");
			$(".lang-menu-popover").toggleClass("visible");
			if ($(".lang-menu-popover").hasClass("visible")) {
				$(".lang-menu-popover").fadeIn("fast");
			} else {
				$(".lang-menu-popover").fadeOut("fast");
			}
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
				langMenu.fadeOut("fast").removeClass("visible");
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