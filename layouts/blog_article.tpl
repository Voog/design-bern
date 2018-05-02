<!DOCTYPE html>
{% include "blog-article-variables" %}
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
              {% assign article_year = article.created_at | format_date: "%Y" | to_num %}

              {% if article_year == current_year %}
                {% assign article_date_format = "long_without_year" %}
              {% else %}
                {% assign article_date_format = "long" %}
              {% endif %}

              <time class="post-date" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: article_date_format }}</time>
            </div>
          </header>

          <section class="post-content">
            <div class="post-excerpt content-formatted" {{ edy_intro_edit_text }}>{% editable article.excerpt %}</div>
            <div class="post-body content-formatted">{% editable article.body %}</div>
            <div class="post-body content-formatted">{% content name="additional_body" bind="Article" %}</div>
          </section>
        </article>

        {% include "tags-post" %}

        {% if article.older or article.newer %}
          <div class="post-nav">
            <div class="post-nav-inner">
              {% if article.older %}
                <a class="post-nav-link {% if article.newer %}post-nav-link-half{% else %}post-nav-link-full{% endif %}" href="{{ article.older.url }}">
                  <div class="post-nav-link-inner">
                    <div class="post-nav-direction">{{ "previous" | lc }}</div>
                    <div class="post-nav-title">{{ article.older.title }}</div>
                  </div>
                </a>
              {% endif %}

              {% if article.newer %}
                <a class="post-nav-link {% if article.older %}post-nav-link-half{% else %}post-nav-link-full{% endif %}" href="{{ article.newer.url }}">
                  <div class="post-nav-link-inner">
                    <div class="post-nav-direction">{{ "next" | lc }}</div>
                    <div class="post-nav-title">{{ article.newer.title }}</div>
                  </div>
                </a>
              {% endif %}
            </div>
          </div>
        {% endif %}
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
  
  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "edicy-tools" %}
  <script>site.initArticlePage();</script>
</body>
</html>
