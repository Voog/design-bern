{% capture dont_render %}
  {% comment %}Assign language menu flags state{% endcomment %}
  {% if site.data.flags_state == nil %}
    {% assign flags_state = true %}
  {% else %}
    {% assign flags_state = site.data.flags_state %}
  {% endif %}

  <!-- Sets cover color lightness class -->
  {% if page.data.cover_lightness == nil or page.data.cover_lightness <= 0.5 %}
    {% assign cover_color_class = 'dark-background' %}
  {% else %}
    {% assign cover_color_class = 'light-background' %}
  {% endif %}

  <!-- Sets the "front page" cover image and color values -->
  {% if page.data.cover_image == nil %}
    {% assign cover_image = images_path | append: '/front-page-bg.jpg' %}
  {% else %}
    {% assign cover_image = page.data.cover_image %}
  {% endif %}

  {% if page.data.cover_color == nil %}
    {% assign cover_color = 'rgba(0,102,187,0.25)' %}
  {% else %}
    {% assign cover_color = page.data.cover_color %}
  {% endif %}

  <!-- Builds style tag for background image -->
  {% assign cover_image_style = '' %}
  {% unless page.data.cover_image == nil %}
    {% assign cover_image_style = ' style="background-image: ' %}
    {% if page.data.cover_image == '' %}
      {% assign cover_image_style = cover_image_style | append: 'none' %}
    {% else %}
      {% assign cover_image_style = cover_image_style | append: "url('" | append: page.data.cover_image | append: "')" %}
    {% endif %}
    {% assign cover_image_style = cover_image_style | append: ';"' %}
  {% endunless %}

  <!-- Builds style tag for background color -->
  {% assign cover_color_style = "" %}
  {% unless page.data.cover_color == nil %}
    {% assign cover_color_style = ' style="background: ' %}
    {% if page.data.cover_color == '' %}
      {% assign cover_color_style = cover_color_style | append: 'none' %}
    {% else %}
      {% assign cover_color_style = cover_color_style | append: page.data.cover_color %}
    {% endif %}
    {% assign cover_color_style = cover_color_style | append: ';"' %}
  {% endunless %}
{% endcapture %}
