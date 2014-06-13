<header class="header">
  <section class="header-left">
    <div class="header-title content-formatted">{% unless editmode %}<a href="{{ site.root_item.url }}">{% endunless %}{% editable site.header %}{% unless editmode %}</a>{% endunless %}</div>
    <button class="search-btn js-search-btn">Search</button>

    <button class="menu-btn js-menu-btn">
      <span class="menu-stripe"></span>
      <span class="menu-stripe"></span>
      <span class="menu-stripe"></span>
    </button>
  </section>

  <section class="header-right js-header-right">
    <nav class="menu-main js-menu-main js-popover">
      {% include "menu-level-1" %}

      {% if editmode or site.has_many_languages? %}
        <div class="menu-lang">
          {% include "menu-lang" %}
        </div>
      {% endif %}
    </nav>

    {% include "search" %}

    {% if editmode or site.has_many_languages? %}
      <nav class="menu-lang js-menu-lang">
        <button class="menu-lang-btn js-menu-lang-btn lang-flag {% for language in site.languages %}{% if language.selected? %}lang-flag-{{ language.code }}{% endif %}{% endfor %}">Choose language</button>
        <div class="menu-lang-popover js-menu-lang-popover js-popover">
          {% include "menu-lang" %}
        </div>
      </nav>
    {% endif %}
  </section>
</header>
