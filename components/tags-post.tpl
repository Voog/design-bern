<section class="content-topbar">
  {% include "tags-translations" %}
  <nav class="menu-tags menu-sub">
    <div class="tags-left">
      <span class="tags-title">{{ tags_title }}</span>
    </div>
    {% if editmode %}
      <div class="tags-right">
        {% editable article.tags %}
      </div>
    {% else %}
      <nav class="tags-right">
        <ul class="menu">
          <li><a href="/{{ site.blogs.first.page.path }}">{{ tags_all }}</a></li>
          {% for tag in article.tags %}
            <li><a href="/{{ site.blogs.first.page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a></li>
          {% endfor %}
        </ul>
      </nav>
    {% endif %}
  </nav>
</section>
