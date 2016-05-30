<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "edicy-tools-variables" %}
  {% include "html-head" content_page: true %}
</head>

<body class="blog-page js-bgpicker-body-image">
  <div class="container js-container">
    {% include "header" %}
    {% include "tags-blog" %}

    <main class="content" role="main">
      <div class="content-inner">
        {% addbutton %}
        {% for article in articles %}
          <article class="post">
            <div class="post-left">
              <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | format_date:"long" }}</time>
            </div>

            <div class="post-right">
              <h2 class="post-title"><a href="{{ article.url }}">{{ article.title }}</a></h2>
              <div class="post-excerpt content-formatted">{{ article.excerpt }}</div>
              <a href="{{ article.url }}" class="post-link">{{ "read_more" | lc }}</a>
            </div>
          </article>
        {% endfor %}
      </div>
    </main>

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
  {% include "edicy-tools" %}
  <script>
    $(document).ready(function() {
      currentUrl = window.location.href;
      blogUrl = '{{ site.url }}{{ page.path }}';
      if (currentUrl === blogUrl) {
        $('.js-tags-all').addClass('active');
      };
    });

    site.initBlogPage();
  </script>
</body>
</html>
