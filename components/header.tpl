<header class="site-header cfx">
  <div class="header-inner-left">
    <section class="header-logo cfx">
      <h2>{% editable site.header %}</h2>
    </section>
  </div>

  <div class="header-inner-right">
    {% include "main-menu" %}
    {% include "search" %}
    {% include "lang-menu" %}
    <section class="mobile-menu-btn-wrap">
      <div class="mobile-menu-stripe"></div>
      <div class="mobile-menu-stripe"></div>
      <div class="mobile-menu-stripe"></div>
    </section>
  </div>
</header>

{% include "mobile-menu" %}