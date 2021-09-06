;(function($) {
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
        colorExtractImage.attr('src', colorExtractImageUrl.replace(/.*\/(photos|voogstock)/g,'/photos'));
        colorExtractImage.on('load', function() {
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

  var normalizeValue = function(value) {
    if (value == null || (typeof value == 'string' && value.match(/^[\\'"]+$/))) {
      return '';
    } else {
      return value;
    }
  };

  // Header background image and color save logic function.
  var frontPageContentCoverBgCommit = function(data, dataName) {
    var commitData = $.extend(true, {}, data);
    commitData.image = data.image || '';
    commitData.imageSizes = normalizeValue(data.imageSizes);
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

  var bindCustomTexteditorStyles = function(buttonTranslation) {
    window.edy = window.edy || [];
    edy.push(['texteditorStyles', {name: buttonTranslation, tagname:'a', attribute: {'href': '#'}, classname: 'custom-btn', toggle: true}]);
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

  window.site = $.extend(window.site || {}, {
    frontPageContentCoverBgPreview: frontPageContentCoverBgPreview,
    frontPageContentCoverBgCommit: frontPageContentCoverBgCommit,
    handleFrontPageContentCoverColorScheme: handleFrontPageContentCoverColorScheme,
    bindCustomTexteditorStyles: bindCustomTexteditorStyles,
    toggleFlags:toggleFlags
  });

})(jQuery);
