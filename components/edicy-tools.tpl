{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
  <script>
    // Front page cover image and color data preview and save logic
    var pageData = new Edicy.CustomData({
      type: 'page',
      id: '{{ page.id }}'
    });

    var bgPickerCover = new Edicy.BgPicker($('.js-bgpicker-cover-settings'), {
      picture: true,
      color: true,
      showAlpha: true,

      preview: function(data) {
        var img = (data.image && data.image !== '') ? 'url("' + data.image + '")' : 'none',
            col = (data.color && data.color !== '') ? data.color : 'none',
            colorData = (data.colorData && data.colorData !== '') ? data.colorData : '',
            lightness = colorData && colorData !== '' && colorData.lightness ? colorData.lightness : 0;

        $('.js-content-inner').removeClass('light-background dark-background').addClass(lightness <= 0.5 ? 'dark-background' : 'light-background');
        $('.js-bgpicker-cover-image').css({'background-image' : img});
        $('.js-bgpicker-cover-color').css({'background' : col});
      },

      commit: function(data) {
        pageData.set({
          'cover_image': data.image || '',
          'cover_color': data.color || '',
          'cover_colorData' : data.colorData || '',
          'cover_lightness' : data.colorData && data.colorData != '' && data.colorData.lightness ? data.colorData.lightness : 0
        });
      }
    });

    var siteData = new Edicy.CustomData({
      type: 'site'
    });

    $('.js-option-toggle-flags').on('click', function(event) {
      console.log('does it hapen?');
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
  </script>
 {% endeditorjsblock %}
