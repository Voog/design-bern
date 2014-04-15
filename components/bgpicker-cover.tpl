{% editorjsblock %}
  <script src="/assets/admin/tools/0.1.0/edicy-tools.js"></script>
  <script>
    var pageData = new Edicy.CustomData({
        type: "page",
        id: "{{ page.id }}"
    });

      pageData.get({
          success: function(currentData) {

              var bgPicker = new Edicy.BgPicker($('.js-cover-bg-settings'), {
                  picture: true,
                  color: true,
                  preview: function(data) {
                      var img = (data.image && data.image !== "") ? "url('" + data.image + "')" : "",
                          col = (data.color && data.color !== "") ? data.color : "";

                      $('.js-cover-color').css({"background-color": col});
                      $('.js-cover-image').css({"background-image": img});
                  },

                  commit: function(data) {
                      if (data.image && data.image !== "") {
                          currentData["cover_image"] = data.image;
                      } else if (currentData["cover_image"]) {
                          delete currentData["cover_image"];
                      }

                      if (data.color && data.color !== "") {
                          currentData["cover_color"] = data.color;
                      } else if (currentData["cover_color"]) {
                          delete currentData["cover_color"]
                      }

                      pageData.set(currentData);
                  }
              });
          }
      });

  </script>
{% endeditorjsblock %}
