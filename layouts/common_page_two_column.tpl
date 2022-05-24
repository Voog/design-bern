<!DOCTYPE html>
{%- include "template-settings" -%}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "edicy-tools-variables" %}
  {% include "html-head" content_page: true %}
</head>

<body class="common-page two-column-page js-bgpicker-body-image">

  <div class="container js-container">
    {% include "header" %}
    {% include "menu-level-2" %}

    {% capture content_default_html %}{% unless editmode %}{% content %}{% endunless %}{% endcapture %}
    {% capture content_default_size %}{{ content_default_html | size | minus : 1 }}{% endcapture %}
    {% unless content_default_size contains "-" %}
      {% assign content_default_has_content = true %}
    {% endunless %}

    {% capture content_right_html %}{% unless editmode %}{% content name="content_right" %}{% endunless %}{% endcapture %}
    {% capture content_right_size %}{{ content_right_html | size | minus : 1 }}{% endcapture %}
    {% unless content_right_size contains "-" %}
      {% assign content_right_has_content = true %}
    {% endunless %}

    <main class="content two-columns" role="main">
      {%- assign content_default_title = "content" | lce -%}
      {%- assign content_default_title_tooltip = "content_tooltip_specific_page" | lce -%}

      {% if editmode or content_default_has_content %}
        <div class="content-left{% if has_children and editmode != true %} with-submenu{% endif %}{% unless editmode or content_right_has_content %} left-full{% endunless %}">
          <section class="content-formatted">
            {% content title=content_default_title title_tooltip=content_default_title_tooltip %}
          </section>
        </div>
      {% endif %}

      {% if editmode or content_right_has_content %}
        <div class="content-right{% if has_children %} with-padding{% endif %}{% unless editmode or content_default_has_content %} right-full{% endunless %}">
          <section class="content-formatted">
            {% content name="content_right" title=content_default_title title_tooltip=content_default_title_tooltip %}
          </section>
        </div>
      {% endif %}
    </main>

    {% include "footer" %}
  </div>

  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "edicy-tools" %}
</body>
</html>
