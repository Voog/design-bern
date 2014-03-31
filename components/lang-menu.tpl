<ul class="menu nav-menu">
  {% for language in site.languages %}
    <li><a class="lang-flag {{ language.code }}{% if language.selected? %} active{% endif %}" href="{{ language.url }}">{{ language.title }}</a></li>
  {% endfor %}
  {% if editmode %}<li class="add-lang-btn">{% languageadd %}</li>{% endif %}
</ul>
