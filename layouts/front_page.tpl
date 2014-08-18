<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {% if editmode %}<link rel="stylesheet" href="/assets/admin/tools/0.1.3/edicy-tools.css">{% endif %}
  {% include "bg-picker-variables" %}
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
  {% include "bg-picker" %}
</body>
</html>
