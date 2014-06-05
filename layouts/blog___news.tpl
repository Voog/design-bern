<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}
  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  {% unless page.description == nil or page.description == "" %}<meta property="og:description" content="{{ page.description }}">{% endunless %}
  {% comment %}<!-- TODO: Add functionality after the CMS is going to support it -->{% endcomment %}
  {% if page.data.fb_image %}<meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fb_image }}">{% comment %}<!-- TODO: Add functionality -->{% endcomment %}{% endif %}

  {{ blog.rss_link }}

  {{ site.stats_header }}
</head>

<body class="blog-page js-bgpicker-body-image">

  <div class="container">
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
              <a href="{{ article.url }}" class="post-link">Read more</a>
            </div>
          </article>
        {% endfor %}
      </div>
    </main>

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
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
