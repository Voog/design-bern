<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head>
    {% include "html-head" %}
    <meta property="og:url" content="{{ site.url }}">
    <meta property="og:title" content="{{ site.name }}">
    <meta property="og:description" content="{{ page.description }}">
    <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fbimage }}"><!-- TODO: Add image location data tag -->
  </head>

  <body class="front-page">
    <div class="container">
      {% include "header" %}

      <main class="content" role="main">
        <div class="bg-color" style="background-color: #06b; background-color: rgba(0, 102, 187, 0.5);"></div>
        <div class="content-inner" style="background-image: url('{{ photos_path }}/front-page-background.jpg');">
          <section class="content-formatted">
            {% content %}
          </section>
        </div>
      </main>

      {% include "footer" %}
    </div>

    {% include "javascripts" %}
    <script src="{{ javascripts_path }}/autogrow.js"></script>
    <script src="{{ javascripts_path }}/ajaxForm.js"></script>
    <script>
      $('.form_field_textarea').autogrow();
      $(".content-formatted form").edicyAjaxForm();
    </script>
  </body>
</html>
