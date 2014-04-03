<header class="header">
  <section class="header-left">
    <div class="header-title">{% unless editmode %}<a href="{{ site.root_item.url }}">{% endunless %}{% editable site.header %}{% unless editmode %}</a>{% endunless %}</div>
  </section>

  <section class="header-right">
    <button class="menu-btn js-menu-btn">
      <span class="menu-stripe"></span>
      <span class="menu-stripe"></span>
      <span class="menu-stripe"></span>
    </button>

    <nav class="main-menu js-main-menu">
      {% include "nav-menu" %}
      {% if editmode or site.has_many_languages? %}
      <div class="mobile-lang-menu lang-menu">
          {% include "lang-menu" %}
        </div>
      {% endif %}
    </nav>

    {% if site.search.enabled %}
      <section class="search">
        <form id="search" class="edys-search" method="get" action="#">
          <div class="search-left">
            <input id="onpage_search" class="edys-search-input" type="text" placeholder="Search" name="">
          </div>
          <div class="search-right">
            <input class="search-submit" type="submit" value="" name="">
          </div>
        </form>
        <div id="customsearch"></div>
      </section>
    {% endif %}

    {% if editmode or site.has_many_languages? %}
      <nav class="lang-menu">
        <button class="lang-menu-btn js-lang-menu-btn lang-flag {% for language in site.languages %}{% if language.selected? %}{{ language.code }}{% endif %}{% endfor %}">Choose language</button>
        <div class="lang-menu-popover js-lang-menu-popover">
          {% include "lang-menu" %}
        </div>
      </nav>
    {% endif %}
  </section>
</header>
