<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}
  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  {% unless page.description == nil or page.description == "" %}<meta property="og:description" content="{{ page.description }}">{% endunless %}
  {% comment %}<!-- TODO: Add functionality after the CMS is going to support it -->{% endcomment %}
  {% if page.data.fb_image %}<meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fb_image }}"><!-- TODO: Add functionality -->{% endif %}

  {{ site.stats_header }}
</head>

<body class="common-page js-bgpicker-body-image">

  <div class="container">
    {% include "header" %}
    {% include "menu-level-2" %}

    <main class="content two-columns" role="main">
      <div class="content-left">
        <section class="content-formatted">
          {% content %}
        </section>
      </div>
      <div class="content-right">
        <section class="content-formatted">
          {% content name="content_right" %}
        </section>
      </div>
    </main>

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
</body>
</html>
