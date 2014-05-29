<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}

  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  {% comment %}<!-- TODO: Add functionality after the CMS is going to support it -->{% endcomment %}
  {% unless page.description == nil or page.description == "" %}<meta property="og:description" content="{{ page.description }}">{% endunless %}
  {% if page.data.fb_image %}<meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fb_image }}">{% endif %}

  <link rel="stylesheet" href="/assets/admin/tools/0.1.1/edicy-tools.css">
  {% include "bg-picker-variables" %}

  {{ site.stats_header }}
</head>

<body class="front-page">
  <div class="container">
    {% include "header" %}

    <main class="content" role="main">
      {% if editmode %}<button class="bgpicker-btn js-bgpicker-cover-settings" data-bg-image="{{ cover_image }}" data-bg-color="{{ cover_color }}"></button>{% endif %}
      <div class="background-image stretch js-bgpicker-cover-image"{{ cover_image_style }}></div>
      <div class="background-color stretch js-bgpicker-cover-color"{{ cover_color_style }}></div>
      <div class="content-inner">
        <section class="content-body content-formatted">{% content %}</section>
      </div>
    </main>

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
  {% include "bg-picker" %}
</body>
</html>
