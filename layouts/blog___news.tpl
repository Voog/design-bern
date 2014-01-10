<!DOCTYPE html>
<html lang="{% for language in site.languages %}{% if language.selected? %}{{ language.code }}{% endif %}{% endfor %}">
  <head>
    {% include "html-head" %}
    {{ blog.rss_link }}
  </head>
  <body>
    <div class="page-wrap cfx">
    
      {% include "header" %}
      {% include "tags-blog-listing" %}

      <section class="content-wrap cp-content-wrap cfx">
        {% addbutton %}
        {% for article in articles %}
          <article class="excerpt-wrap">
            <div class="excerpt-inner-left">
              <time datetime="{{ article.created_at | date : "%Y-%m-%d" }}" class="excerpt-date">{{ article.created_at | date : "%b %d, %Y" }}</time>
            </div>
            <div class="excerpt-inner-right">
              <h2 class="excerpt-post-title"><a href="{{ article.url }}">{{ article.title }}</a></h2>
              <div class="excerpt-content">{{ article.excerpt }}</div>
              <a href="{{ article.url }}" class="link-btn">Read more</a>
            </div>
          </article>
        {% endfor %}
      </section>
      
      {% include "footer" %}
    </div>

    {% include "javascripts" %}
    <script>
      $(document).ready(function() {
        currentUrl = window.location.href;
        blogUrl = "{{ site.url }}/{{ page.path }}";
        if (currentUrl === blogUrl) {
          $(".blog-main a").addClass("active");
        };
      });
    </script>
  </body>
</html>