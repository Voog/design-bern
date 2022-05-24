<!DOCTYPE html>
{%- include "template-settings" -%}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign front_page = true %}
  {% include "edicy-tools-variables" %}
  {% include "html-head" %}
  {% include "edicy-tools-styles" %}
  {% if editmode %}<link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">{% endif %}
</head>

<body class="front-page">
  <div class="container js-container">
    {% include "header" %}

    <main class="content js-front-page-content" role="main">
      {% comment %}{% if editmode %}<button class="bgpicker-btn js-front-page-content-cover-settings" data-bg-image="{{ cover_image }}" data-bg-color="{{ cover_color }}"></button>{% endif %}{% endcomment %}
      {% if editmode %}<button class="bgpicker-btn js-front-page-content-cover-settings" {% unless front_page_content_cover_image == '' %}data-bg-image="{{ front_page_content_cover_image }}"{% endunless %} {% unless front_page_content_cover_image_sizes == '' %}data-bg-image-sizes="{{ front_page_content_cover_image_sizes_str | escape }}"{% endunless %} {% unless front_page_content_cover_color == nil or front_page_content_cover_color == 'rgba(255,255,255,0)' %}data-bg-color="{{ front_page_content_cover_color }}"{% endunless %} {% unless front_page_content_cover_color_data == nil %}data-bg-color-data="{{ front_page_content_cover_color_data_str | escape }}"{% endunless %}></button>{% endif %}
      {% if cover_image != '' or editmode %}<div class="background-image stretch js-bgpicker-cover-image"{{ cover_image_style }}></div>{% endif %}
      {% if cover_color != '' or editmode %}<div class="background-color stretch js-bgpicker-cover-color"{{ cover_color_style }}></div>{% endif %}
      <div class="content-inner js-content-inner js-background-type {{ front_page_content_cover_type }}">
        <section class="content-body content-formatted">
          {%- assign content_default_title = "content" | lce -%}
          {%- assign content_default_title_tooltip = "content_tooltip_specific_page" | lce -%}
          {% content title=content_default_title title_tooltip=content_default_title_tooltip %}
        </section>
      </div>
    </main>
    {% include "footer" %}
  </div>

  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "edicy-tools" front_page: true %}
</body>
</html>
