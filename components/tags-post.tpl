<section class="content-topbar">
  <nav class="menu-tags menu-sub">
    {% include "tags-variables" %}
    <div class="tags-left">
      <span class="tags-title">{{ tags_post_title }}</span>
    </div>
    {% if editmode %}
      <div class="tags-right">
        {% editable article.tags %}
      </div>
    {% else %}
      <nav class="tags-right">
        <ul class="menu">
          <li class="menu-item">
            <a class="menu-link" href="{{ site.url }}{{ site.blogs.first.page.path }}">{{ tags_all }}</a>
          </li>
          {% for tag in article.tags %}
            <li class="menu-item"><a class="menu-link" href="{{ site.url }}{{ site.blogs.first.page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a></li>
          {% endfor %}
        </ul>
      </nav>
    {% endif %}
  </nav>
</section>
