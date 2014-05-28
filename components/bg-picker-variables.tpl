{% capture dont_render %}
  <!-- Sets the "front page" cover image and color values -->
  {% if page.data.cover_image == nil %}
    {% assign cover_image = '/images/front-page-bg.jpg' %}
  {% else %}
    {% assign cover_image = page.data.cover_image %}
  {% endif %}

  {% if page.data.cover_color == nil %}
    {% assign cover_color = 'rgb(0, 102, 187)' %}
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
    {% assign cover_color_style = ' style="background-color: ' %}
    {% if page.data.cover_color == '' %}
      {% assign cover_color_style = cover_color_style | append: 'none' %}
    {% else %}
      {% assign cover_color_style = cover_color_style | append: page.data.cover_color %}
      {% if page.data.cover_image == '' %}
        {% assign cover_color_style = cover_color_style | append: '; opacity: 1' %}
      {% else %}
        {% assign cover_color_style = cover_color_style | append: '; opacity: 0.5' %}
      {% endif %}
    {% endif %}
    {% assign cover_color_style = cover_color_style | append: ';"' %}
  {% endunless %}
{% endcapture %}
