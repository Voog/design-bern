<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "edicy-tools-variables" %}
  {% include "html-head" content_page: true %}
</head>

<body class="post-page js-bgpicker-body-image">

  <div class="container js-container">
    {% include "header" %}

    <main class="content" role="main">
      <div class="content-inner">
        <article class="post">
          <header class="post-header">
            <h2 class="post-title">{% editable article.title %}</h2>
            <div class="post-header-inner">
              <span class="post-author">{{ article.author.name }}</span>
              <span class="separator">-</span>
              <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | format_date: "long" }}</time>
            </div>
          </header>

          <section class="post-content">
            <div class="post-excerpt content-formatted">{% editable article.excerpt %}</div>
            <div class="post-body content-formatted">{% editable article.body %}</div>
          </section>
        </article>

        {% include "tags-post" %}
      </div>
    </main>

    <section class="comments content-formatted">
      {% if article.comments_count > 0 %}
        <h2 class="comments-title">{{ 'post_has_replies' | lcc : article.comments_count }}</h2>

        <div class="comment-messages">
          {% for comment in article.comments reversed %}
            <div class="comment edy-site-blog-comment">{{ comment.body_html }} ({{ comment.author }}, {{ comment.created_at | format_date: "long" }}) {% removebutton %}</div>
          {% endfor %}
        </div>
      {% endif %}

      {% include "comment-form" %}
    </section>

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
  {% include "edicy-tools" %}
  <script>site.initArticlePage();</script>
</body>
</html>
