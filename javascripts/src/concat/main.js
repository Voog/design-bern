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

  var bindSideClicks = function() {
    $('.content').on('mousedown', function(event) {
      if (!$(event.target).closest('.js-prevent-sideclick').length) {
        $('.js-popover').removeClass('expanded');
        $('.js-search-close-btn').trigger('click');
      };
    });
  };

  // Handles mouse clicks on different buttons and sections of the web page.
  var handleElementsClick = function() {
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

    $('.js-header-left').css('min-width', headerWidth - headerRightWidth - headerRightMargin);
  };

  // Returns the suitable version of the image depending on the viewport width.
  var getImageByWidth = function(sizes, targetWidth) {
    var prevImage;

    for (var i = 0, max = sizes.length; i < max; i++) {
      if (sizes[i].width < targetWidth) {
        return prevImage || sizes[i];
      }
      prevImage = sizes[i];
    }
    // Makes sure that smallest is returned if all images bigger than targetWidth.
    return sizes[sizes.length - 1];
  };

  var frontPageContentBgImageSizesContains = function(sizes, url) {
    for (var i = sizes.length; i--;) {
      if (url.indexOf(sizes[i].url.trim()) > -1) {
        return true;
      }
    }
    return false;
  };

  // Checks the lightness sum of header background image and color and sets the lightness class depending on it's value.
  var handlefrontPageContentLightnessClass = function() {
    if (frontPageContentCoverCombinedLightness >= 0.5) {
      $('.js-background-type').addClass('light-background').removeClass('dark-background');
    } else {
      $('.js-background-type').addClass('dark-background').removeClass('light-background');
    }
  };

  // Header background image and color preview logic function.
  var frontPageContentCoverBgPreview = function(data, frontPageContent) {
    // Defines the variables used in preview logic.

    var frontPageContentBgImagePrevious = $('.js-bgpicker-cover-image').css('background-image'),
        frontPageContentBgImageSuitable = data.imageSizes ? getImageByWidth(data.imageSizes, $(window).width()) : null,
        frontPageContentBgImage = (data.image && data.image !== '') ? 'url(' + frontPageContentBgImageSuitable.url + ')' : 'none',
        frontPageContentBgImageSizes = (data.imageSizes && data.imageSizes !== '') ? data.imageSizes : null,
        frontPageContentBgColor = (data.color && data.color !== '') ? data.color : 'rgba(0,0,0,0)',
        frontPageContentBgColorDataLightness = (data.colorData && data.colorData !== '') ? data.colorData.lightness : 1,
        colorExtractImage = $('<img>'),
        colorExtractCanvas = $('<canvas>'),
        colorExtractImageUrl = (data.image && data.image !== '') ? data.image : null;

    if (colorExtractImageUrl) {
      if (frontPageContentBgImageSizesContains(frontPageContentBgImageSizes, frontPageContentBgImagePrevious)) {
        frontPageContentCoverCombinedLightness = getCombinedLightness(frontPageContentBg.frontPageContentBgImageColor, frontPageContentBgColor);
        handlefrontPageContentLightnessClass();
      } else {
        colorExtractImage.attr('src', colorExtractImageUrl.replace(/.*\/photos/g,'/photos'));
        colorExtractImage.load(function() {
          ColorExtract.extract(colorExtractImage[0], colorExtractCanvas[0], function(data) {
            frontPageContentBg.frontPageContentBgImageColor = data.bgColor ? data.bgColor : 'rgba(255,255,255,1)';
            frontPageContentCoverCombinedLightness = getCombinedLightness(frontPageContentBg.frontPageContentBgImageColor, frontPageContentBgColor);
            handlefrontPageContentLightnessClass();
          });
        });
      };
    } else {
      frontPageContentCoverCombinedLightness = getCombinedLightness('rgba(255,255,255,1)', frontPageContentBgColor);
      handlefrontPageContentLightnessClass();
    };

    // Updates the frontPageContent background image and background color.
    $(frontPageContent).find('.js-bgpicker-cover-image').css({'background-image' : frontPageContentBgImage});
    $(frontPageContent).find('.js-bgpicker-cover-color').css({'background-color' : frontPageContentBgColor});
  };

  // Header background image and color save logic function.
  var frontPageContentCoverBgCommit = function(data, dataName) {
    var commitData = $.extend(true, {}, data);
    commitData.image = data.image || '';
    commitData.imageSizes = data.imageSizes || '';
    commitData.color = data.color || 'rgba(255,255,255,0)';
    commitData.combinedLightness = frontPageContentCoverCombinedLightness;
    pageData.set(dataName, commitData);
  }

  var colorSum = function(bgColor, fgColor) {
    if (bgColor && fgColor) {
      if (typeof bgColor == 'string') {
        bgColor = bgColor.replace(/rgba?\(/,'').replace(/\)/,'').split(',');
        $.each(bgColor, function(n, x) {bgColor[n] = +x;});
      }
      if (typeof fgColor == 'string') {
        fgColor = fgColor.replace(/rgba?\(/,'').replace(/\)/,'').split(',');
        $.each(fgColor, function(n, x) {fgColor[n] = +x;});
      }
      if (typeof bgColor == 'object' && bgColor.hasOwnProperty('length')) {
        if (bgColor.length == 3) { bgColor.push(1.0); }
      }
      if (typeof fgColor == 'object' && fgColor.hasOwnProperty('length')) {
        if (fgColor.length == 3) { fgColor.push(1.0); }
      }
      var result = [0, 0, 0, 0];
      result[3] = 1 - (1 - fgColor[3]) * (1 - bgColor[3]);
      if (result[3] === 0) { result[3] = 1e-6; }
      result[0] = Math.min(fgColor[0] * fgColor[3] / result[3] + bgColor[0] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      result[1] = Math.min(fgColor[1] * fgColor[3] / result[3] + bgColor[1] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      result[2] = Math.min(fgColor[2] * fgColor[3] / result[3] + bgColor[2] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      return $.map(result, function(e) { return Math.floor(e); });
    }
  };

  var getCombinedColor = function(bgColor, fgColor) {
    var sum = colorSum(bgColor || [255,255,255,1], fgColor || [255,255,255,1]);
    return sum;
  };

  var getCombinedLightness = function(bgColor, fgColor) {
    var combinedColor = getCombinedColor(bgColor, fgColor);
    var color = Math.round(((+combinedColor[0]) * 0.2126 + (+combinedColor[1]) * 0.7152 + (+combinedColor[2]) * 0.0722) / 2.55) / 100;
    return color;
  };

  var handleFrontPageContentCoverColorScheme = function(lightness) {
    if (typeof lightness != 'undefined') {
      if (lightness > 0.6) {
        $('.header-wrapper').addClass('light').removeClass('dark');
      } else {
        $('.header-wrapper').addClass('dark').removeClass('light');
      }
    }
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
    bindSideClicks();
    handleElementsClick();
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
    toggleFlags: toggleFlags,
    frontPageContentCoverBgPreview: frontPageContentCoverBgPreview,
    frontPageContentCoverBgCommit: frontPageContentCoverBgCommit,
    handleFrontPageContentCoverColorScheme: handleFrontPageContentCoverColorScheme
  });

  // Initiates site wide functions.
  init();
})(jQuery);
