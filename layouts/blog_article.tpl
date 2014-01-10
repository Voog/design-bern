<!DOCTYPE html>
<html lang="{% for language in site.languages %}{% if language.selected? %}{{ language.code }}{% endif %}{% endfor %}">
  <head>
    {% include "html-head" %}
  </head>
  <body>
    <div class="page-wrap cfx">
      {% include "header" %}
      {% include "tags-article" %}

      <article class="content-wrap cp-content-wrap cfx">
        <h2 class="post-title">{% editable article.title %}</h2>
        <div class="post-sub-title">
          <span class="author">{{ article.author.name | capitalize }} - </span>
           <time datetime="{{ article.created_at | date : "%Y-%m-%d" }}" class="post-date">{{ article.created_at | date : "%B %d, %Y" }}</time>
        </div>
        <div class="post-excerpt-content">{% editable article.excerpt %}</div>
        <div class="post-content">{% editable article.body %}</div>
      </article>

      <section class="comment-wrap">
        <h2 class="comment-title">{% case article.comments_count %}{% when 0 %}{{"no_comments"|lc}}{% else %}{{"comments_for_count" | lc}}: <span class="edy-site-blog-comments-count">{{article.comments_count}}</span>{% endcase %}</h2>
        
        {% for comment in article.comments %}
          <div class="comment">{{ comment.body }} {{ comment.author }}, ({{ comment.created_at | date : "%b %d, %Y" }})</div>
        {% endfor %}
        
        {% include "comment-form" %}
      </section>

      {% include "footer" %}
    </div>
    {% include "javascripts" %}
    <script>
      $(document).ready(function() {
        if ($('#add-comment-wrap').hasClass('form_with_errors') === true) {
          $("html, body").scrollTop($('#add-comment-wrap').offset().top);
        }
      });
    </script>
  </body>
</html>