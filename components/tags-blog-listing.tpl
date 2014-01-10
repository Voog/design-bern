{% if site.has_language_tags? %}
  <nav class="sub-menu-wrap">
    <div class="sub-menu-inner">
      <div class="filters-wrap">
        <div class="filters-label">Filter posts</div>
        <ul class="menu menu-horizontal tag-menu">
          <li class="blog-main"><a href="/{{ site.blogs.first.page.path }}">{% case page.language_code %}{% when 'et' %}Kõik teemad{% else %}All topics{% endcase %}</a></li>
          {% for tag in site.language_tags %}
            {% assign activestr = " " %}
            {% for tmptag in tags %}
              {% if tmptag.name == tag.name %}
                {% assign activestr = " class='active'" %}
              {% endif %}
            {% endfor %}
            <li><a {{ activestr }} href="/{{ site.blogs.first.page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a></li>
          {% endfor %}
        </ul>
      </div>
    </div>
  </nav>
{% endif %}