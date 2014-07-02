<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {{ site.stats_header }}
</head>

<body class="common-page two-column-page js-bgpicker-body-image">

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
