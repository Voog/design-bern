{% comment %} TODO: Optimize the logic.{% endcomment %}
{% capture dont_render %}
  {% comment %}Assign language menu flags state{% endcomment %}
  {% if site.data.flags_state == nil %}
    {% assign flags_state = true %}
  {% else %}
    {% assign flags_state = site.data.flags_state %}
  {% endif %}

  {%- comment -%}Assign variables for ecommerce layouts{%- endcomment -%}
  {% assign product_list_layout = "Product list" %}
  {% assign product_layout = "Product" %}

  {% comment %}Assign variables based on page type.{% endcomment %}
  {% assign fallback_cover_image = page.data.cover_image %}
  {% assign fallback_cover_color = page.data.cover_color %}
  {% assign fallback_cover_colorData = page.data.cover_colorData %}
  {% assign fallback_cover_lightness = page.data.cover_lightness %}

  {% assign front_page_content_cover = page.data.front_page_content_cover %}
  {% assign front_page_content_cover_image = front_page_content_cover.image %}
  {% assign front_page_content_cover_image_sizes = front_page_content_cover.imageSizes %}
  {% assign front_page_content_cover_color = front_page_content_cover.color %}
  {% assign front_page_content_cover_color_data = front_page_content_cover.colorData %}
  {% assign front_page_content_cover_combined_lightness = front_page_content_cover.combinedLightness %}

  {% comment %}Sets the body background type.{% endcomment %}
  {% if front_page_content_cover %}
    {% if front_page_content_cover_combined_lightness %}
      {% if front_page_content_cover_combined_lightness > 0.5 %}
        {% assign front_page_content_cover_type = 'light-background' %}
      {% else %}
        {% assign front_page_content_cover_type = 'dark-background' %}
      {% endif %}
    {% else %}
      {% if front_page_content_cover_color_data.a >= 0.5 %}
        {% if front_page_content_cover_color_data.lightness >= 0.5 %}
          {% assign front_page_content_cover_type = 'light-background' %}
        {% else %}
          {% assign front_page_content_cover_type = 'dark-background' %}
        {% endif %}
      {% else %}
        {% assign front_page_content_cover_type = 'light-background' %}
      {% endif %}
    {% endif %}
  {% else %}
    {% if fallback_cover_colorData != nil and front_page_content_cover_color_data == nil %}
      {% if fallback_cover_colorData.a >= 0.5 %}
        {% if fallback_cover_lightness >= 0.5 %}
          {% assign front_page_content_cover_type = 'light-background' %}
        {% else %}
          {% assign front_page_content_cover_type = 'dark-background' %}
        {% endif %}
      {% else %}
        {% assign front_page_content_cover_type = 'light-background' %}
      {% endif %}
    {% else %}
      {% assign front_page_content_cover_type = 'dark-background' %}
    {% endif %}
  {% endif %}

  {% if fallback_cover_image != nil and front_page_content_cover.image == nil %}
    {% assign front_page_content_cover_image = fallback_cover_image %}
  {% else %}
    {% if front_page_content_cover_image == nil %}
      {% assign front_page_content_cover_image = images_path | append: '/front-page-bg_block.jpg' %}
    {% endif %}
  {% endif %}

  {% if fallback_cover_image != nil and front_page_content_cover.image == nil %}
    {% assign front_page_content_cover_image_sizes_str = '[{"url": "' | append: fallback_cover_image | append: '", "width": 0, "height": 0}]' %}
  {% else %}
    {% if front_page_content_cover_image_sizes == nil %}
      {% assign front_page_content_cover_image_sizes_str = '[{"url":"' | append: images_path | append: '/front-page-bg.jpg", "width":1880, "height":1050}, {"url":"' | append: images_path | append: '/front-page-bg_large.jpg", "width":800, "height":447}]' %}
    {% else %}
      {% assign front_page_content_cover_image_sizes_str = front_page_content_cover_image_sizes | json %}
    {% endif %}
  {% endif %}

  {% if fallback_cover_color != nil and front_page_content_cover.color == nil %}
    {% assign front_page_content_cover_color = fallback_cover_color %}
  {% else %}
    {% if front_page_content_cover_color == nil %}
      {% assign front_page_content_cover_color = 'rgba(0,102,187,0.25)' %}
    {% endif %}
  {% endif %}

  {% if front_page_content_cover_color_data == nil %}
    {% assign front_page_content_cover_color_data_str = '{"r": 0, "g": 102, "b": 187, "a": 0.25, "lightness": 0.34}' %}
  {% else %}
    {% assign front_page_content_cover_color_data_str = front_page_content_cover_color_data | json %}
  {% endif %}


  {% comment %}=================================================================
  | Design editor variables.
  ============================================================= {% endcomment %}
  {% capture base_font_set %}
    [
      {
        "type": "group",
        "title": "Sans Serif",
        "list": [
          {
            "title": "Avenir Next",
            "value": "\"Avenir Next\", \"Avenir\", \"Helvetica Neue\", \"Helvetica\", \"Segoe UI\", sans-serif"
          },
          {
            "title": "Fira Sans",
            "value": "\"Fira Sans\", sans-serif"
          },
          {
            "title": "Lato",
            "value": "\"Lato\", sans-serif"
          },
          {
            "title": "Montserrat",
            "value": "\"Montserrat\", sans-serif"
          },
          {
            "title": "Open Sans",
            "value": "\"Open Sans\", sans-serif"
          },
          {
            "title": "PT Sans",
            "value": "\"PT Sans\", sans-serif"
          },
          {
            "title": "Raleway",
            "value": "\"Raleway\", sans-serif"
          },
          {
            "title": "Roboto",
            "value": "\"Roboto\", sans-serif"
          },
          {
            "title": "Source Sans Pro",
            "value": "\"Source Sans Pro\", sans-serif"
          },
          {
            "title": "Ubuntu",
            "value": "\"Ubuntu\", sans-serif"
          }
        ]
      },
      {
        "type": "group",
        "title": "Serif",
        "list": [
          {
            "title": "Arvo",
            "value": "\"Arvo\", serif"
          },
          {
            "title": "Crimson Text",
            "value": "\"Crimson Text\", serif"
          },
          {
            "title": "Georgia",
            "value": "\"Georgia\", serif"
          },
          {
            "title": "Lora",
            "value": "\"Lora\", serif"
          },
          {
            "title": "Noto Serif",
            "value": "\"Noto Serif\", serif"
          },
          {
            "title": "Playfair Display",
            "value": "\"Playfair Display\", serif"
          },
          {
            "title": "PT Serif",
            "value": "\"PT Serif\", serif"
          },
          {
            "title": "Roboto Slab",
            "value": "\"Roboto Slab\", serif"
          }
        ]
      },
      {
        "type": "group",
        "title": "Monospace",
        "list": [
          {
            "title": "Anonymous Pro",
            "value": "\"Anonymous Pro\", monospace"
          },
          {
            "title": "Cousine",
            "value": "\"Cousine\", monospace"
          },
          {
            "title": "Roboto Mono",
            "value": "\"Roboto Mono\", monospace"
          },
          {
            "title": "Ubuntu Mono",
            "value": "\"Ubuntu Mono\", monospace"
          }
        ]
      }
    ]
  {% endcapture %}

  {% capture base_alignment_set %}
    [
      {
        "titleI18n": "left",
        "value": "left"
      },
      {
        "titleI18n": "center",
        "value": "center"
      },
      {
        "titleI18n": "right",
        "value": "right"
      }
    ]
  {% endcapture %}

  {% capture base_toggle_set %}
    [
      {
        "titleI18n": "off",
        "value": "0px"
      },
      {
        "titleI18n": "on",
        "value": "4px"
      }
    ]
  {% endcapture %}

  {% capture base_number_of_columns_set %}
    [
      {
        "title": "1",
        "value": "100%"
      },
      {
        "title": "2",
        "value": "50%"
      },
      {
        "title": "4",
        "value": "25%"
      }
    ]
  {% endcapture %}

  {% capture base_border_style_set %}
    [
      {
        "titleI18n": "solid",
        "value": "solid"
      },
      {
        "titleI18n": "none",
        "value": "hidden"
      }
    ]
  {% endcapture %}

  {% comment %}VOOG intro popover targets. Add them where applicable popovers should appear.{% endcomment %}
  {% capture edy_intro_add_page %}{% if editmode %}data-edy-intro-popover="edy-add-page"{% endif %}{% endcapture %}
  {% capture edy_intro_add_lang %}{% if editmode %}data-edy-intro-popover="edy-add-lang"{% endif %}{% endcapture %}
  {% capture edy_intro_edit_text %}{% if editmode %}data-edy-intro-popover="edy-edit-text"{% endif %}{% endcapture %}

{% endcapture %}
