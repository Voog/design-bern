{% editorjsblock %}
  <script src='/assets/admin/tools/0.1.1/edicy-tools.js'></script>
  <script>
    // Front page cover image and color data preview and save logic
    var pageData = new Edicy.CustomData({
      type: 'page',
      id: '{{ page.id }}'
    });

    var bgPickerCover = new Edicy.BgPicker($('.js-bgpicker-cover-settings'), {
      picture: true,
      color: true,
      preview: function(data) {
        var img = (data.image && data.image !== '') ? 'url("' + data.image + '")' : '',
            col = (data.color && data.color !== '') ? data.color : '';

        $('.js-bgpicker-cover-image').css({'background-image' : img});
        $('.js-bgpicker-cover-color').css({'background-color' : col});

        if (data.image === null || data.image === '') {
          $('.js-bgpicker-cover-color').css({'opacity' : 1});
        } else {
          $('.js-bgpicker-cover-color').css({'opacity' : 0.5});
        }
      },

      commit: function(data) {
        pageData.set({
          'cover_image': data.image || '',
          'cover_color': data.color || ''
        });
      }
    });

  </script>
{% endeditorjsblock %}
