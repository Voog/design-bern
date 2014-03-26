<section class="content-topbar">
  {% if site.has_language_tags? %}
    <nav class="tags sub-menu">
      <div class="tags-left">
        <span class="tags-title">Filter posts</span>
      </div>
      <div class="tags-right">
        <ul class="menu">
          <li class="blog-main"><a href="/{{ site.blogs.first.page.path }}">{% case page.language_code %}{% when 'et' %}Kõik teemad{% else %}All topics{% endcase %}</a></li>
          {% for tag in site.language_tags %}
            {% assign activestr = " " %}
            {% for tmptag in tags %}
              {% if tmptag.name == tag.name %}
                {% assign activestr = "class='active'" %}
              {% endif %}
            {% endfor %}
            <li {{ activestr }}><a href="/{{ site.blogs.first.page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a></li>
          {% endfor %}
        </ul>
      </div>
    </nav>
  {% endif %}
</section>
