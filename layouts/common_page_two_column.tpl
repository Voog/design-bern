<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}
  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  <meta property="og:description" content="{{ page.description }}">
  <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fbimage }}"><!-- TODO: Add image location data tag -->

  <link rel="stylesheet" href="/assets/admin/tools/0.1.0/edicy-tools.css">
</head>

<body class="common-page js-bgpicker-body-image">

  <div class="container">
    {% include "header" %}
    {% include "sub-menu" %}

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
