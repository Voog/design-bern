{% for item in site.visible_menuitems %}
  {% if item.selected? and item.children? or editmode %}
    <nav class="sub-menu-wrap sub-nav centered cfx">
      <div class="sub-menu-inner cfx">
        <ul class="menu menu-horizontal cfx">
          {% if editmode or item.children? %}
            {% for subitem in item.visible_children %}
              <li><a href="{{ subitem.url }}" {% if subitem.selected? %} class="active"{% endif %}{% unless subitem.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}>{{ subitem.title }}</a></li>  
            {% endfor %}
          {% endif %}
          {% if editmode %}<li>{% menubtn item.hidden_children %}</li>{% endif %}
          {% if editmode %}<li>{% menuadd parent="item" %}</li>{% endif %}
        </ul>
      </div>
    </nav>
  {% endif %}
{% endfor %}