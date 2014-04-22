<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}
  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  <meta property="og:description" content="{{ page.description }}">
  <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fbimage }}"><!-- TODO: Add image location data tag -->

  <link rel="stylesheet" href="/assets/admin/tools/0.1.0/edicy-tools.css">

  {{ blog.rss_link }}
</head>

<body class="blog-page js-bgpicker-body-image" style="background-image: url('{{ page.data.body_image}}');">
  <a class="js-bgpicker-body-settings" data-bg-image="{{ page.data.body_image }}" data-bg-color="{{ page.data.body_color }}"></a>
  <div class="background-color fixed js-bgpicker-body-color" {% if page.data.body_color %}style="background-color: {{ page.data.body_color }};{% if page.data.body_image %} opacity: 0.5;{% endif %}"{% endif %}></div>

  <div class="container">
    {% include "header" %}
    {% include "sub-menu" %}
    {% include "tags-blog" %}

    <main class="content" role="main">
      <div class="content-inner">
        {% addbutton %}
        {% for article in articles %}
          <article class="post">
            <div class="post-left">
              <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | date : "%b %d, %Y" }}</time>
            </div>

            <div class="post-right">
              <h2 class="post-title"><a href="{{ article.url }}">{{ article.title }}</a></h2>
              <div class="post-excerpt content-formatted">{{ article.excerpt }}</div>
              <a href="{{ article.url }}" class="post-link">Read more</a>
            </div>
          </article>
        {% endfor %}
      </div>
    </main>

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
  {% include "bgpicker" %}
  <script>
    $(document).ready(function() {
      currentUrl = window.location.href;
      blogUrl = "{{ site.url }}/{{ page.path }}";
      if (currentUrl === blogUrl) {
        $(".js-all-tags").addClass("active");
      };
    });

    site.initBlogPage();
  </script>
</body>
</html>
