<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}"s>
  <head>
    {% include "html-head" %}
    <meta property="og:url" content="{{ site.url }}">
    <meta property="og:title" content="{{ site.name }}">
    <meta property="og:description" content="{{ page.description }}">
    <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fbimage }}"><!-- TODO: Add image location data tag -->
  </head>

  <body class="post-page">
    <div class="container">
      {% include "header" %}

      <main class="content" role="main">
        {% include "tags-article" %}
        <div class="content-inner">
          <article class="post">
            <header class="post-header">
              <h2 class="post-title">{% editable article.title %}</h2>
              <div class="post-header-inner">
                <span class="post-author">{{ article.author.name | capitalize }}</span>
                <span class="separator">-</span>
                <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | date : "%B %d, %Y" }}</time>
              </div>
            </header>

            <section class="post-content">
              <div class="post-excerpt content-formatted">{% editable article.excerpt %}</div>
              <div class="post-body content-formatted">{% editable article.body %}</div>
            </section>
          </article>
        </div>
      </main>

      <section class="comments content-formatted">
        {% case article.comments_count %}{% when 0 %}{% else %}<h2 class="comment-title">{{"comments_for_count" | lc}}: <span class="edy-site-blog-comments-count">{{article.comments_count}}</span></h2>{% endcase %}

        {% for comment in article.comments reversed %}
          <div class="comment">{{ comment.body }} ({{ comment.author }}, {{ comment.created_at | date : "%b %d, %Y" }})</div>
        {% endfor %}

        {% include "comment-form" %}
      </section>

      {% include "footer" %}
    </div>

    {% include "javascripts" %}
    <script>site.initArticlePage();</script>
    <script src="{{ javascripts_path }}/autogrow.js"></script>
    <script>
      $('.form_field_textarea').autogrow();
    </script>
    <!-- TODO: Add body background picker -->
  </body>
</html>
