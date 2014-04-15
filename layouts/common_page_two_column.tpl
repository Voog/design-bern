<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head>
    {% include "html-head" %}
    <meta property="og:url" content="{{ site.url }}">
    <meta property="og:title" content="{{ site.name }}">
    <meta property="og:description" content="{{ page.description }}">
    <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fbimage }}"><!-- TODO: Add image location data tag -->
  </head>

  <body class="common-page">
    <div class="container">
      {% include "header" %}
      <!--{% include "sub-menu" %}--> <!-- TODO: Screws up the layout if no sub menu element present -->

      <main class="content" role="main">
        <div class="content-left">
          <section class="content-formatted">
            {% content %}
          </section>
        </div>
        <div class="content-right">
          <section class="content-formatted">
            {% content name="content_right_test" %}
          </section>
        </div>
      </main>

      {% include "footer" %}
    </div>

    {% include "javascripts" %}
    <script>site.initCommonPage();</script>
    <script src="{{ javascripts_path }}/autogrow.js"></script>
    <script src="{{ javascripts_path }}/ajaxForm.js"></script>
    <script>
      $('.form_field_textarea').autogrow();
      $(".content-formatted form").edicyAjaxForm();
    </script>
    <!-- TODO: Add body background picker -->
  </body>
</html>
