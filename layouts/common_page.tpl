<!DOCTYPE html>
<html lang="{{ page.language_code }}">
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
      {% include "sub-menu" %}
      
      <main class="content" role="main">
        <div class="content-inner">
          <section class="content-formatted cfx">
            {% content %}
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
  </body>
</html>