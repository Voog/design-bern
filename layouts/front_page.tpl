<!DOCTYPE html>
<html lang="{{ page.language_code }}">
  <head>
    {% include "html-head" %}
  </head>
  <body>
    <div class="page-wrap cfx">
      {% include "header" %}

      <section class="content-wrap fp-content-wrap cfx">
        <div class="fp-content-align-middle cfx">
          <div class="fp-content cfx">
            <h1>{% contentblock %}Introduce your company (or yourself) here. Click around, try out how to edit text, choose a different design theme, upload pictures etc. This site is fully customizable — you can add, delete, modify any text or pictures as you desire.{% endcontentblock %}</h1>
          </div>
        </div>
      </section>
      {% include "footer" %}
    </div>

    {% include "javascripts" %}
  </body>
</html>