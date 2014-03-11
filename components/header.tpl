<header class="header">
  <section class="header-left">
    <div class="header-title">{% unless editmode %}<a href="{{ site.root_item.url }}">{% endunless %}{% editable site.header %}{% unless editmode %}</a>{% endunless %}</div>
    <button id="mobile-menu-toggle" class="menu-btn">
      <div class="menu-stripe"></div>
      <div class="menu-stripe"></div>
      <div class="menu-stripe"></div>
    </button>
  </section>
  
  <section class="header-right">
    <nav class="main-menu">
      {% include "nav-menu" %}
      <div class="mobile-lang-menu lang-menu">
        {% include "lang-menu" %}
      </div>
    </nav>
    
    {% if site.search.enabled %}
      <section class="search cfx">
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
        <button id="lang-menu-toggle" class="toggle-btn lang-menu-toggle lang-flag {% for language in site.languages %}{% if language.selected? %}{{ language.code }}{% endif %}{% endfor %}">Choose language</button>
        <div id="toggleable-lang-menu" class="lang-menu-popover">
          {% include "lang-menu" %}
        </div>
      </nav>
    {% endif %}
  </section>
</header>