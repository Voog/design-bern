{% capture dont_render %}
  <!-- Sets the "front page" cover image and color values -->
  {% if page.data.cover_image == nil %}
    {% assign bg_image = '/images/front-page-bg.jpg' %}
  {% else %}
    {% assign bg_image = page.data.cover_image %}
  {% endif %}

  {% if page.data.cover_color == nil %}
    {% assign bg_color = 'rgb(0, 102, 187)' %}
  {% else %}
    {% assign bg_color = page.data.cover_color %}
  {% endif %}

  <!-- Builds style tag for background image -->
  {% assign bg_image_style = '' %}
  {% unless page.data.cover_image == nil %}
    {% assign bg_image_style = ' style="background-image: ' %}
    {% if page.data.cover_image == '' %}
      {% assign bg_image_style = bg_image_style | append: 'none' %}
    {% else %}
      {% assign bg_image_style = bg_image_style | append: "url('" | append: page.data.cover_image | append: "')" %}
    {% endif %}
    {% assign bg_image_style = bg_image_style | append: ';"' %}
  {% endunless %}

  <!-- Builds style tag for background color -->
  {% assign bg_color_style = "" %}
  {% unless page.data.cover_color == nil %}
    {% assign bg_color_style = ' style="background-color: ' %}
    {% if page.data.cover_color == '' %}
      {% assign bg_color_style = bg_color_style | append: 'none' %}
    {% else %}
      {% assign bg_color_style = bg_color_style | append: page.data.cover_color %}
      {% if page.data.cover_image == '' %}
        {% assign bg_color_style = bg_color_style | append: '; opacity: 1' %}
      {% else %}
        {% assign bg_color_style = bg_color_style | append: '; opacity: 0.5' %}
      {% endif %}
    {% endif %}
    {% assign bg_color_style = bg_color_style | append: ';"' %}
  {% endunless %}
{% endcapture %}
