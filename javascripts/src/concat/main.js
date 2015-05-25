;(function($) {
  var editmode = $('html').hasClass('editmode');

  // Remove comments if debouncing is used.
  // Function to limit the rate at which a function can fire.
  // var debounce = function(func, wait, immediate) {
  //   var timeout;
  //   return function() {
  //     var context = this, args = arguments;
  //     var later = function() {
  //       timeout = null;
  //       if (!immediate) func.apply(context, args);
  //     };
  //     var callNow = immediate && !timeout;
  //     clearTimeout(timeout);
  //     timeout = setTimeout(later, wait);
  //     if (callNow) func.apply(context, args);
  //   };
  // };

  // Handles mouse clicks on different buttons and sections of the web page.
  var handleElementsClick = function() {
    // Hides opened popups and modals if clicked on any other element.
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
      $('body').addClass('search-open');
      $('.js-search-close-btn').addClass('open');
      $('.js-search').addClass('active');
      $('.js-search-inner').css({'margin-top': '-25px'});
      $('.js-search-input').val('').focus();
    });

    // Closes the search modal.
    $('.js-search-close-btn').click(function(event) {
      $(this).removeClass('open');
      $('body').removeClass('search-open');
      $('.js-search-open-btn').removeClass('open');
      $('.js-search').removeClass('active');
    });

    // Prevents search modal closing on click
    $('.js-search').click(function(event) {
      event.stopPropagation();
    });
  };

  // Reduces opacity of the gallery images that are not under the cursor.
  var handleGalleryHover = function() {
    $('.edys-gallery').mouseover(function() {
      $(this).find('.edys-gallery-item').addClass('inactive');
    });

    $('.edys-gallery').mouseout(function() {
      $(this).find('.edys-gallery-item').removeClass('inactive');
    });
  };

  // Scrolls to the comment-form if comment submit failed (to show the error messages to the user)
  var focusFormWithErrors = function() {
    $(document).ready(function() {
      if ($('.comment-form').hasClass('form_with_errors')) {
        $('html, body').scrollTop($('.comment-form').offset().top);
      } else if ($('form').find('.form_error, .form_notice').length > 0) {
        $('html, body').scrollTop($('.form_error, .form_notice').closest('form').offset().top);
      }
    });
  };

  // Wraps tables in the container to support horizontal scrolling for tables that are wider than the content area.
  // TODO: Remove if Voog is going to wrap tables with the container.
  var wrapTables = function() {
    if (editmode === false) {
      $.each($('.content-formatted'), function() {
        if (!$(this).hasClass('js-custom-content-formatted')) {
          $(this).find('table').wrap('<div class="table-container overthrow"></div>');
        }
      });
    }
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

  var toggleFlags = function() {
    $('.js-option-toggle-flags').on('click', function(event) {
      event.stopPropagation();

      if ($(this).hasClass('js-flag-disable-btn')) {
        var flagsState = false;
      } else {
        var flagsState = true;
      }

      siteData.set("flags_state", flagsState);

      $(this).toggleClass('js-flag-disable-btn');
      $('.js-menu-lang').toggleClass('flags-enabled flags-disabled');
    });
  };

  var bindFallbackHeaderLeftWidthCalculation = function() {
    var headerWidth = $('.js-header').width(),
        headerRight = $('.js-header-right'),
        headerRightWidth = headerRight.width(),
        headerRightMargin = parseInt(headerRight.css('margin-left')) + 1;

        console.log(headerRightMargin);

    $('.js-header-left').css('min-width', headerWidth - headerRightWidth - headerRightMargin);
  };

  // Initiates the functions when window is resized.
  var handleWindowResize = function() {
    // Add functions that should be trgiggered while resizing the window here.
    // Example:
    // $(window).resize(debounce(yourFunctionName, 3000));
  };

  // Initiations
  var initFrontPage = function(animation) {
    // Add front page layout specific functions here.
  };

  var initBlogPage = function() {
    // Add blog listing layout specific functions here.
  };

  var initArticlePage = function() {
    // Add single post layout specific functions here.
  };

  var initCommonPage = function() {
    // Add common page specific functions here.
    handleFormFieldClick();
  };

  var init = function() {
    // Add site wide functions here.
    handleElementsClick();
    handleGalleryHover();
    focusFormWithErrors();
    handleWindowResize();
    handleSearchFocus();
    handleSearchMobilePosition();
    wrapTables();

    if (!Modernizr.flexbox && editmode) {
      bindFallbackHeaderLeftWidthCalculation();
    };
  };

  // Enables the usage of the initiations outside this file.
  // For example add "<script>site.initBlogPage();</script>" at the end of the "Blog & News" page to initiate blog listing view functions.
  window.site = $.extend(window.site || {}, {
    initBlogPage: initBlogPage,
    initArticlePage: initArticlePage,
    initCommonPage: initCommonPage,
    toggleFlags: toggleFlags
  });

  // Initiates site wide functions.
  init();
})(jQuery);
