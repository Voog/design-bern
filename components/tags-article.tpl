<section class="content-topbar">
  <div class="tags sub-menu">
    <div class="tags-left">
      <span class="tags-title">Filter posts</span>
    </div>
    {% if editmode %}
      <div class="tags-right">
        {% editable article.tags %}
      </div>
    {% else %}
      <nav class="tags-right">
        <ul class="menu">
          <li><a href="/{{ site.blogs.first.page.path }}">{% case page.language_code %}{% when 'et' %}Kõik teemad{% else %}All topics{% endcase %}</a></li>
          {% for tag in article.tags %}
            <li><a href="/{{ site.blogs.first.page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a></li>
          {% endfor %}
        </ul>
      </nav>
    {% endif %}
  </div>
</section>
