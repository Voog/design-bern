<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "edicy-tools-variables" %}
  {% include "html-head" content_page: true %}
</head>

<body class="common-page js-bgpicker-body-image">
  <div class="container js-container">
    {% include "header" %}
    {% include "menu-level-2" %}

    <main class="content" role="main">
      <div class="content-inner{% if has_children %} with-submenu{% endif %}">
        {% include "menu-breadcrumbs" %}
        {% include "product-list-block" %}
        <section class="content-body content-formatted" data-search-indexing-allowed="true" {{ edy_intro_edit_text }}>
          {% content %}
        </section>
      </div>
    </main>

    {% include "footer" %}
  </div>

  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "edicy-tools" %}
</body>
</html>
