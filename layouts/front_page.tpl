<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}
  <link rel="stylesheet" href="/assets/admin/tools/0.1.0/edicy-tools.css">

  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  <meta property="og:description" content="{{ page.description }}">
  <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fbimage }}"><!-- TODO: Add image location data tag -->
</head>

<body class="front-page">

  <div class="container">

    {% include "header" %}
    <main class="content" role="main">
      <a class="js-bgpicker-cover-settings" data-bg-image="{{ page.data.cover_image }}" data-bg-color="{{ page.data.cover_color }}"></a>
      <div class="background-image stretch js-bgpicker-cover-image"{% if page.data.cover_image %} style="background-image: url('{{ page.data.cover_image }}');"{% endif %}></div>
      <div class="background-color stretch js-bgpicker-cover-color"{% if page.data.cover_color %} style="background-color: {{ page.data.cover_color }};{% if page.data.cover_image %} opacity: 0.5;{% endif %}"{% endif %}></div>
      <div class="content-inner">
        <section class="content-body content-formatted">{% content %}</section>
      </div>
    </main>

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
  {% include "bgpicker" %}
</body>
</html>
