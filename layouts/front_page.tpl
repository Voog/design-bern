<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign front_page = true %}
  {% include "html-head" %}
  {% if editmode %}<link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">{% endif %}
  {% include "edicy-tools-variables" %}
</head>

<body class="front-page">
  <div class="container">
    {% include "header" %}

    <main class="content" role="main">
      {% if editmode %}<button class="bgpicker-btn js-bgpicker-cover-settings" data-bg-image="{{ cover_image }}" data-bg-color="{{ cover_color }}"></button>{% endif %}
      {% if cover_image != '' or editmode %}<div class="background-image stretch js-bgpicker-cover-image"{{ cover_image_style }}></div>{% endif %}
      {% if cover_color != '' or editmode %}<div class="background-color stretch js-bgpicker-cover-color"{{ cover_color_style }}></div>{% endif %}
      <div class="content-inner js-content-inner {{ cover_color_class }}">
        <section class="content-body content-formatted">{% content %}</section>
      </div>
    </main>
    {% include "footer" %}
  </div>

  {% include "javascripts" %}
  {% include "edicy-tools" %}
</body>
</html>
