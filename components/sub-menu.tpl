{% for item in site.visible_menuitems %}
  {% if item.selected? and item.children? or editmode %}
    <section class="content-topbar">
      <nav class="sub-menu">
        <ul class="menu nav-menu">
          {% if editmode or item.children? %}
            {% for subitem in item.visible_children %}
              <li><a{% if subitem.selected? %} class="active"{% endif %}{% unless subitem.translated? %} class="untranslated fci-editor-menuadd"{% endunless %} href="{{ subitem.url }}">{{ subitem.title }}</a></li>
            {% endfor %}
          {% endif %}
          {% if item.hidden_children.size > 0 %}<li>{% menubtn item.hidden_children %}</li>{% endif %}
          {% if editmode %}<li class="add-page-btn">{% menuadd parent="item" %}</li>{% endif %}
        </ul>
      </nav>
    </section>
  {% endif %}
{% endfor %}
