<header class="header js-header{% if site.search.enabled %} search-enabled{% endif %}">
  <div class="header-left js-header-left">
    <div class="header-title content-formatted">{% unless editmode %}<a class="header-link" href="{{ site.root_item.url }}">{% endunless %}{% editable site.header %}{% unless editmode %}</a>{% endunless %}</div>

    {% if site.search.enabled %}
      <button class="search-btn search-close-btn js-search-close-btn js-prevent-sideclick">
        <svg width="20px" height="20px" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
          <path d="M19.58,3.539 C19.58,3.539 12.916,10.216 12.916,10.216 C12.916,10.216 19.456,16.769 19.456,16.769 C20.211,17.526 20.211,18.751 19.457,19.506 C18.702,20.262 17.48,20.263 16.725,19.506 C16.725,19.506 10.185,12.953 10.185,12.953 C10.185,12.953 3.532,19.619 3.532,19.619 C2.767,20.385 1.529,20.384 0.765,19.619 C0.001,18.853 0,17.612 0.765,16.846 C0.765,16.846 7.417,10.18 7.417,10.18 C7.417,10.18 0.868,3.618 0.868,3.618 C0.113,2.861 0.114,1.636 0.868,0.881 C1.622,0.125 2.845,0.124 3.6,0.881 C3.6,0.881 10.149,7.443 10.149,7.443 C10.149,7.443 16.812,0.766 16.812,0.766 C17.577,0 18.816,0 19.58,0.766 C20.344,1.531 20.345,2.773 19.58,3.539 Z"></path>
        </svg>
      </button>

      <button class="search-btn search-open-btn js-search-open-btn js-prevent-sideclick">
        <svg width="20px" height="20px" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
          <path d="M20,17.675 C20,18.296 19.755,18.88 19.31,19.319 C18.865,19.758 18.274,20 17.645,20 C17.016,20 16.425,19.758 15.98,19.319 C15.98,19.319 11.946,15.335 11.946,15.335 C10.825,15.9 9.56,16.226 8.216,16.226 C3.678,16.226 0,12.594 0,8.113 C0,3.632 3.678,0 8.216,0 C12.753,0 16.431,3.632 16.431,8.113 C16.431,9.573 16.035,10.939 15.352,12.122 C15.352,12.122 19.31,16.031 19.31,16.031 C19.755,16.47 20,17.054 20,17.675 ZM8.217,1.954 C4.77,1.954 1.976,4.713 1.976,8.117 C1.976,11.52 4.77,14.279 8.217,14.279 C11.663,14.279 14.457,11.52 14.457,8.117 C14.457,4.713 11.663,1.954 8.217,1.954 Z"></path>
        </svg>
      </button>
    {% endif %}

    <button class="menu-btn js-menu-btn js-prevent-sideclick">
      <span class="menu-stripe"></span>
      <span class="menu-stripe"></span>
      <span class="menu-stripe"></span>
    </button>
  </div>

  <div class="header-right js-header-right">
    <nav class="menu-main js-menu-main js-popover js-prevent-sideclick">
      {% include "menu-level-1" %}

      {% if editmode or site.has_many_languages? %}
        <div class="menu-lang js-menu-lang {% if flags_state %}flags-enabled{% else %}flags-disabled{% endif %}">
          {% include "menu-lang" %}
        </div>
      {% endif %}
    </nav>

    {% include "search" %}

    {% if editmode or site.has_many_languages? %}
      <nav class="menu-lang js-menu-lang {% if flags_state %}flags-enabled{% else %}flags-disabled{% endif %}">
        <button class="menu-lang-btn js-menu-lang-btn lang-flag lang-flag-{{ page.language_code }}">
          {% if editmode or flags_state == false %}
            <span class="lang-title">
              {% for language in site.languages %}{% if language.selected? %}{{ language.title }}{% endif %}{% endfor %}
              <span class="ico-popover-toggle">▼</span>
            </span>
          {% endif %}
        </button>
        <div class="menu-lang-popover js-menu-lang-popover js-popover">
          {% include "menu-lang" %}
        </div>
      </nav>
    {% endif %}
  </div>
</header>
