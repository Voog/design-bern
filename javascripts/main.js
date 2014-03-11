;(function($) {
  var toggleMainMenu = function() {
        $('#mobile-menu-toggle').click(function() {
            $(this).toggleClass('open');
            $('.main-menu').toggleClass('expanded');
        });
  };
  
    var toggleLangMenu = function() {
        $('#lang-menu-toggle').click(function(event) {
            event.stopPropagation();
            $('#toggleable-lang-menu').toggleClass('expanded');
        });
    };
    
  var handlePopoverMenuHide = function() {
    $("html").click(function() {
      if ($("#toggleable-lang-menu").hasClass("expanded")) {
        $("#toggleable-lang-menu").removeClass("expanded");
      }
    });
  };
    
    var handleFormFieldClick = function() {
        $('.form_field_with_errors').click(function() {
            $(this).removeClass('form_field_with_errors');
        });
    };
    
  var wrapTables = function() {
        $('.content-formatted table').wrap('<div class="table-container overthrow"></div>');
  };
  
  var checkScrollBar = function() {
        jQuery.fn.hasScrollBar = function(direction) {
            if (direction == 'vertical') {
                return this.get(0).scrollHeight > this.innerHeight();
            } else if (direction == 'horizontal') {
                return this.get(0).scrollWidth > this.innerWidth();
            }
            return false;
        }
  };
  
  var handleTableHorizontalScrolling = function() {
        $.each($('.table-container'), function() {
            if ($(this).hasScrollBar('horizontal') === true) {
                $(this).addClass('horizontal-scroll');
            } else {
                $(this).removeClass('horizontal-scroll');
            }
        });
  };
  
  var handleWindowResize = function() {
        $(window).resize(function() {
            handleTableHorizontalScrolling();
        });
  };
    
    // Initiations
    var initCommonPage = function() {
        handleFormFieldClick();
    };
    
    var initBlogPage = function() {
    };
    
    var initArticlePage = function() {
        handleFormFieldClick();
    };
    
    var init = function() {
        toggleMainMenu();
        toggleLangMenu();
        handlePopoverMenuHide();
        handleWindowResize();
        wrapTables();
        if ($('.table-container').length > 0) {
            checkScrollBar();
            handleTableHorizontalScrolling();
        }
    };
    
    window.site = {
        initCommonPage: initCommonPage,
        initBlogPage: initBlogPage,
        initArticlePage: initArticlePage
    };
    
    init();
})(jQuery);