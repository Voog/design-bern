<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
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
