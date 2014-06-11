;(function($) {
  // Shows/hides the popover main menu (visible on smalles screens).
  var toggleMainMenu = function() {
    $('.js-menu-btn').click(function(event) {
      event.stopPropagation();
      $(this).toggleClass('open');
      $('.js-menu-main').toggleClass('expanded');
    });
  };

  // Shows/hides the popover language menu.
  var toggleLangMenu = function() {
    $('.js-menu-lang-btn').click(function(event) {
      event.stopPropagation();
      $('.js-menu-lang-popover').toggleClass('expanded');
    });
  };

  // Hides the popover menus if clicked anywhere else than the menu itself.
  var handlePopoverMenuHide = function() {
    $('html').click(function() {
      if ($('.js-menu-popover').hasClass('expanded')) {
        $('.js-menu-popover').removeClass('expanded');
      }
    });
  };

  // Reduces opacity of the gallery images that are not under the cursor.
  var handleGalleryHover = function() {
    $('.edys-gallery-item').mouseover(function() {
      $(this).siblings('.edys-gallery-item').find('.edys-gallery-image').addClass('inactive');
    });

    $('.edys-gallery-item').mouseout(function() {
      $(this).siblings('.edys-gallery-item').find('.edys-gallery-image').removeClass('inactive');
    });
  };

  // Scrolls to the comment-form if comment submit failed (to show the error messages to the user).
  var focusCommentsWithErrors = function() {
    $(document).ready(function() {
      if ($('.form_field').hasClass('form_field_with_errors') === true) {
        $('html, body').scrollTop($('.comment-form').offset().top);
      }
    });
  };

  // Wraps tables in the container.
  // TODO: remove if edicy is going to wrap table with the container.
  var wrapTables = function() {
    $('.content-formatted table').wrap('<div class="table-container overthrow"></div>');
  };

  // Checks the presence of the table scrollbar.
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

  // Adds horizontal scroll to tables that don't fit into the content area.
  var handleTableHorizontalScrolling = function() {
    $.each($('.table-container'), function() {
      if ($(this).hasScrollBar('horizontal') === true) {
        $(this).addClass('horizontal-scroll');
      } else {
        $(this).removeClass('horizontal-scroll');
      }
    });
  };

  // Adds/removes active class to search box if input is focused.
  var handleSearchFocus = function() {
    searchWrap = $('.js-search');
    $('.js-search-input').focus(function() {
      searchWrap.addClass('active');
    }).blur(function() {
      searchWrap.removeClass('active');
    });
  };

  // Initiates the functions when window is resized.
  var handleWindowResize = function() {
    $(window).resize(function() {
      handleTableHorizontalScrolling();
    });
  };

  // Initiations
  var initBlogPage = function() {
    // Add blog listing layout specific functions here.
  };

  var initArticlePage = function() {
    // Add single post layout specific functions here.
    focusCommentsWithErrors();
  };

  var initCommonPage = function() {
    // Add common page specific functions here.
    handleFormFieldClick();
    focusCommentsWithErrors();
  };

  var init = function() {
    // Add site wide functions here.
    toggleMainMenu();
    toggleLangMenu();
    handlePopoverMenuHide();
    handleGalleryHover();
    handleWindowResize();
    handleSearchFocus();
    wrapTables();
    if ($('.table-container').length > 0) {
      checkScrollBar();
      handleTableHorizontalScrolling();
    }
  };

  // Enables the usage of the initiations outside this file.
  // For example add "<script>site.initBlogPage();</script>" at the end of the "Blog & News" page to initiate blog listing view functions.
  window.site = $.extend(window.site || {}, {
    initBlogPage: initBlogPage,
    initArticlePage: initArticlePage,
    initCommonPage: initCommonPage
  });

  // Initiates site wide functions.
  init();
})(jQuery);
