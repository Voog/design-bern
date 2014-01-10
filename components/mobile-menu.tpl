<nav class="mobile-menu-wrap cfx">
  <ul class="menu menu-horizontal cfx">
    {% unless site.root_item.hidden? %}
      <li>
        <a href="{{site.root_item.url}}" {% if site.root_item.selected? %} class="active"{% endif %}>{{site.root_item.title}}</a>
      </li>
    {% endunless %}
    
    {% for item in site.visible_menuitems %}
      <li>
        <a href="{{ item.url }}" {% if item.selected? %} class="active"{% endif %}{% unless item.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}>{{ item.title }}</a>
        {% if item.selected? %}
          <ul class="menu menu-horizontal mobile-sub-menu cfx">
            {% for submenu in item.children %}
              <li><a href="{{ submenu.url }}" {% if submenu.selected? %} class="active"{% endif %}{% unless submenu.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}>{{ submenu.title }}</a></li>
            {% endfor %}
          </ul>
        {% endif %}
      </li>  
    {% endfor %}
    
    {% for language in site.languages %}
      <li><a href="{{ language.url }}" class="mobile-lang flag {{ language.code }}{% if language.selected? %} active{% endif %}">{{ language.title }}</a></li>
    {% endfor %}
  </ul>
</nav>