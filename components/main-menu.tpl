<nav class="main-menu-wrap cfx">
  <ul class="menu menu-horizontal cfx">
    {% unless site.root_item.hidden? %}
      <li>
        <a href="{{site.root_item.url}}" {% if site.root_item.selected? %} class="active"{% endif %}>{{site.root_item.title}}</a>
      </li>
    {% endunless %}
    {% for item in site.visible_menuitems %}
      <li><a href="{{ item.url }}" {% if item.selected? %} class="active"{% endif %}{% unless item.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}>{{ item.title }}</a></li>  
    {% endfor %}
    {% if editmode %}
      <li>{% menubtn site.hidden_menuitems %}</li>
      <li>{% menuadd %}</li>
   {% endif %}
  </ul>
</nav>