;(function($) {
	var handleLangMenuClick = function() {
		$(".lang-btn").click(function(event) {
			event.stopPropagation();
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
			$(".mobile-menu-wrap").slideToggle("fast");
		});
	};

	var handleWindowResize = function() {
		$(window).resize(function() {
			if ($(window).width() > 900) {
				$(".mobile-menu-wrap").hide();
			}
		});
	};

	var handlePopoverMenuHide = function() {
		$("html").click(function() {
			if ($(".lang-menu-popover").hasClass("visible")) {
				$(".lang-menu-popover").removeClass("visible").fadeOut("fast");
			}
		});
	};

	var handleCheckboxClick = function() {
		$(".form_field_label").click(function() {
			$(this).toggleClass("checked");
		});
	};

	var handleRadioClick = function() {
		$(".radio_label").click(function() {
			$(".radio_label").removeClass("checked");
			$(this).addClass("checked");
		});
	};

	var init = function() {
		handleLangMenuClick();
		handleMobileMenuClick();
		handleWindowResize();
		handlePopoverMenuHide();
		handleCheckboxClick();
		handleRadioClick();
	};

	init();

})(jQuery);