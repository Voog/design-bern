<style>
  {% comment %}/* Body background image */{% endcomment %}
  {% if front_page %}
    {% if fallback_cover_image != nil and front_page_content_cover.image == nil %}
      .content .background-image {
        background-image: url("{{ fallback_cover_image }}");
      }
    {% else %}
      {% if front_page_content_cover.imageSizes != nil %}
        {% if front_page_content_cover.imageSizes == "" %}
          .content .background-image {
            background-image: none;
          }
        {% else %}
          {% for imageSize in page.data.front_page_content_cover.imageSizes %}
            {% if forloop.first %}
              .content .background-image {
                background-image: url("{{ imageSize.url }}");
              }
            {% else %}
              @media screen and (max-width: {{ imageSize.width }}px) {
                .content .background-image {
                  background-image: url("{{ imageSize.url }}");
                }
              }
            {% endif %}
          {% endfor %}
        {% endif %}

      {% else %}
        {% assign bg_image_prefix = images_path | append: "/front-page-bg" %}

        .content .background-image {
          background-image: url("{{ bg_image_prefix }}.jpg");
        }

        @media screen and (max-width: 1280px) {
          .content .background-image {
            background-image: url("{{ bg_image_prefix }}_large.jpg");
          }
        }
      {% endif %}
    {% endif %}

    {% comment %}/* Body Background color */{% endcomment %}
    {% if fallback_cover_color != nil and front_page_content_cover.color == nil %}
      .content .background-color {
        background-color: {{ fallback_cover_color }};
      }
    {% else %}
      .content .background-color {
        background-color: {{ front_page_content_cover_color }};
      }
    {% endif %}
  {% endif %}
</style>
