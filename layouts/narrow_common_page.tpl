<!DOCTYPE html>
<html lang="{% for language in site.languages %}{% if language.selected? %}{{ language.code }}{% endif %}{% endfor %}">
  <head>
    {% include "html-head" %}
  </head>
  <body>
    <div class="page-wrap cfx">
      {% include "header" %}
      {% include "sub-menu" %}

      <section class="content-wrap cp-content-wrap content-narrow cfx">
        <div class="content-narrow-inner">
          {% contentblock name="cp-title" %}
            <h1 style="text-align: center;">This is where your products live</h1>
          {% endcontentblock %}
          {% content %}
        </div>
      </section>
      {% include "footer" %}
    </div>

    {% include "javascripts" %}
  </body>
</html>