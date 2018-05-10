<section class="content-topbar">
  {% if blog.has_tags? %}
    <nav class="menu-tags menu-sub">
      <div class="tags-left">
        <span class="tags-title">{{ 'filter_posts' | lc }}</span>
      </div>
      <div class="tags-right">
        <ul class="menu">
          <li class="menu-item">
            <a class="menu-link js-tags-all" href="/{{ blog.page.path_with_lang }}">{{ 'all_posts' | lc }}</a>
          </li>
          {% for tag in blog.tags %}
            {% assign activestr = " " %}
            {% for tmptag in tags %}
              {% if tmptag.name == tag.name %}
                {% assign activestr = " active" %}
              {% endif %}
            {% endfor %}
            <li class="menu-item">
              <a class="menu-link{{ activestr }}" href="/{{ blog.page.path_with_lang }}/tagged/{{ tag.path }}">{{ tag.name }}</a>
            </li>
          {% endfor %}
        </ul>
      </div>
    </nav>
  {% endif %}
</section>
