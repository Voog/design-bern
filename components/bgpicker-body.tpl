{% editorjsblock %}
    <script src="/assets/admin/tools/0.1.0/edicy-tools.js"></script>
    <script>
        var pageData = new Edicy.CustomData({
            type: "page",
            id: "{{ page.id }}"
        });

        pageData.get({
            success: function(currentData) {

                var bgPicker = new Edicy.BgPicker($('.bg-settings-toggle'), {
                    picture: true,
                    color: true,
                    preview: function(data) {
                        var img = (data.image && data.image !== "") ? "url('" + data.image + "')" : "",
                            col = (data.color && data.color !== "") ? data.color : "";

                        $('body').css({
                          "background-image": img,
                          "background-color": col
                        });
                    },

                    commit: function(data) {
                        if (data.image && data.image !== "") {
                            currentData["background_image"] = data.image;
                        } else if (currentData["background_image"]) {
                            delete currentData["background_image"];
                        }

                        if (data.color && data.color !== "") {
                            currentData["background_color"] = data.color;
                        } else if (currentData["background_color"]) {
                            delete currentData["background_color"]
                        }

                        pageData.set(currentData);
                    }
                });
            }
        });

    </script>
  {% endeditorjsblock %}
