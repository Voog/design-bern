;(function($) {
  var handleElementsClick = function() {
    $('html').click(function() {
      if ($('.js-popover').hasClass('expanded')) {
        $('.js-popover').removeClass('expanded');
      }

      if ($('.js-search-close-btn').hasClass('open') && $('.voog-search-modal').length === 0) {
        $('.js-search-close-btn').trigger('click');
      }
    });

    // Toggles the popover main menu (visible on smalles screens).
    $('.js-menu-btn').click(function(event) {
      event.stopPropagation();
      $(this).toggleClass('open');
      $('.js-menu-main').toggleClass('expanded');

      if ($('.js-search-close-btn').hasClass('open')) {
        $('.js-search-close-btn').trigger('click');
      }
    });

    // Toggles the popover language menu.
    $('.js-menu-lang-btn').click(function(event) {
      event.stopPropagation();
      $('.js-menu-lang-popover').toggleClass('expanded');
    });

    // Opens the search modal.
    $('.js-search-open-btn').click(function(event) {
      event.stopPropagation();
      if ($('.js-menu-main').hasClass('expanded')) {
        $('.js-menu-main').removeClass('expanded');
        $('.js-menu-btn').removeClass('open');
      }

      $(this).addClass('open');
      $('.js-search-close-btn').addClass('open');
      $('.js-search').addClass('active');
      $('.js-search-inner').css({'margin-top': '-25px'});
      $('.js-search-input').val('').focus();
    });

    // Closes the search modal.
    $('.js-search-close-btn').click(function(event) {
      event.stopPropagation();
      $(this).removeClass('open');
      $('.js-search-open-btn').removeClass('open');
      $('.js-search').removeClass('active');
      $('.voog-search-modal').remove();
    });

    // Prevents search modal closing on click
    $('.js-search').click(function(event) {
      event.stopPropagation();
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
    searchForm = $('.js-search-form');
    $('.js-search-input').focus(function() {
      searchForm.addClass('active');
    }).blur(function() {
      searchForm.removeClass('active');
    });
  };

  var handleSearchMobilePosition = function() {
    $('.js-search-form').on('submit', function() {
      searchModalHeight = $('.js-voog-search-modal').height();
      $('.js-modal').css({'top': '40px'});
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
    handleElementsClick();
    handleGalleryHover();
    handleWindowResize();
    handleSearchFocus();
    handleSearchMobilePosition();
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
