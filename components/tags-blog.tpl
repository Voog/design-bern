<section class="content-topbar">
  {% if site.has_language_tags? %}
    <nav class="menu-tags menu-sub">
      <div class="tags-left">
        <span class="tags-title">{{ 'filter_posts' | lc }}</span>
      </div>
      <div class="tags-right">
        <ul class="menu">
          <li class="menu-item">
            <a class="menu-link js-tags-all" href="/{{ page.path }}">All posts</a> {% comment %}/* TODO: Add multilanguge tag */{% endcomment %}
          </li>
          {% for tag in site.language_tags %}
            {% assign activestr = " " %}
            {% for tmptag in tags %}
              {% if tmptag.name == tag.name %}
                {% assign activestr = " active" %}
              {% endif %}
            {% endfor %}
            <li class="menu-item">
              <a class="menu-link{{ activestr }}" href="/{{ page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a>
            </li>
          {% endfor %}
        </ul>
      </div>
    </nav>
  {% endif %}
</section>
