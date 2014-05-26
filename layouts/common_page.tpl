<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}
  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  {% unless page.description == nil or page.description == "" %}<meta property="og:description" content="{{ page.description }}">{% endunless %}
  {% if page.data.fb_image %}<meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fb_image }}">{% comment %}<!-- TODO: Add functionality -->{% endcomment %}{% endif %}
</head>

<body class="common-page js-bgpicker-body-image">
  <div class="container">
    {% include "header" %}
    {% include "menu-level-2" %}

    <main class="content" role="main">
      <div class="content-inner">
        <section class="content-body content-formatted">
          {% content %}
        </section>
      </div>
    </main>

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
</body>
</html>
