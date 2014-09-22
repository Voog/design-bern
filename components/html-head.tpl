{% comment %}<!-- IE SETTINGS -->{% endcomment %}
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->

{% comment %}<!-- BASIC META INFO -->{% endcomment %}
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
{% unless page.keywords == nil or page.keywords == "" %}<meta name="keywords" content="{{ page.keywords }}">{% endunless %}
{% unless page.description == nil or page.keywords == "" %}<meta name="description" content="{{ page.description }}">{% endunless %}

{% comment %}<!-- FAV ICON -->{% endcomment %}
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/favicon.ico" type="image/ico">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
{% comment %}<!-- TODO: Add functionality after the CMS is going to support it -->{% endcomment %}
{% if site.data.touch_icon %}<link rel="apple-touch-icon" href="{{ site.data.touch_icon }}">{% endif %}

{% comment %}<!-- MODERNIZR - HTML5 SUPPORT FOR OLDER BROWSERS, SVG SUPPORT DETECTION ETC -->{% endcomment %}
<script src="{{ javascripts_path }}/modernizr.min.js"></script>

{% comment %}<!-- STYLESHEETS -->{% endcomment %}
{% stylesheet_link "main.min.css" %}
<!--[if lt IE 9]>{% stylesheet_link "ie8.min.css" %}<![endif]-->

{% comment %}<!-- SITE TITLE -->{% endcomment %}
{% capture page_title %}{% if article %}{{ article.title }} — {{ page.site_title }}{% else %}{% if site.root_item.selected? %}{{ page.site_title }}{% else %}{{ page.title }} — {{ page.site_title }}{% endif %}{% endif %}{% endcapture %}
<title>{{ page_title }}</title>

{% comment %}<!-- FACEBOOK OPENGRAPH -->{% endcomment %}
<!-- https://developers.facebook.com/tools/debug - Debug after each modification -->
{% comment %}<!-- TODO: Add admin value editing support after the CMS is going to support it -->{% endcomment %}
{% if site.data.fb_admin %}<meta property="fb:admins" content="{{ site.data.fb_admin }}">{% endif %}
<meta property="og:type" content="{% if article %}article{% else %}website{% endif %}">
<meta property="og:url" content="{{ site.url }}{% if article %}{{ article.url | remove_first:'/' }}{% else %}{{ page.url | remove_first:'/' }}{% endif %}">
<meta property="og:title" content="{{ page_title | escape }}">
<meta property="og:site_name" content="{{ page.site_title | escape }}">

{% comment %}Article page OG & meta tags.{% endcomment %}
{% if article %}
  {% comment %}TODO: Add functionality to set custom Facebook OG image if the CMS is going to support it.{% endcomment %}
  {% comment %}Article page OG image tags.{% endcomment %}
  {% if article.data.fb_image %}
    <meta property="og:image" content="{{ article.data.fb_image }}">
  {% elsif page.data.fb_image %}
    <meta property="og:image" content="{{ page.data.fb_image }}">
  {% elsif site.data.fb_image %}
    <meta property="og:image" content="{{ site.data.fb_image }}">
  {% endif %}

  {% comment %}Article page description tags.{% endcomment %}
  <meta property="og:description" content="{{ article.excerpt | strip_html | truncatewords: 200, '...' }}">
  <meta name="description" content="{{ article.excerpt | strip_html | truncatewords: 200, '...' }}">

{% comment %}Content page OG & meta tags.{% endcomment %}
{% else %}
  {% comment %}"Front page" type content pages OG image tags.{% endcomment %}
  {% if front_page == true %}
    {% unless page.data.cover_image == '' %}
      {% if page.data.cover_image == nil %}
        <meta property="og:image" content="{{ site.url }}{{ cover_image | remove_first: '/' }}">
      {% else %}
        <meta property="og:image" content="{{ cover_image }}">
      {% endif %}
    {% endunless %}

  {% comment %}All other content pages OG image tags.{% endcomment %}
  {% else %}
    {% comment %}TODO: Add functionality to set custom Facebook OG image if the CMS is going to support it.{% endcomment %}
    {% if page.data.fb_image %}
      <meta property="og:image" content="{{ page.data.fb_image }}">
    {% elsif site.data.fb_image %}
      <meta property="og:image" content="{{ site.data.fb_image }}">
    {% endif %}
  {% endif %}

  {% comment %}Content pages description tags (if specific description is added under the page settings).{% endcomment %}
  {% unless page.description == nil or page.description == "" %}
    <meta property="og:description" content="{{ page.description }}">
    <meta name="description" content="{{ page.description }}">

  {% else %}
    {% comment %}Blog page description tags.{% endcomment %}
    {% if blog %}
      {% for article in articles %}
        {% if forloop.first %}
          <meta property="og:description" content="{{ article.excerpt | strip_html | truncatewords: 200, '...' }}">
          <meta name="description" content="{{ article.excerpt | strip_html | truncatewords: 200, '...'  }}">
        {% endif %}
      {% endfor %}

    {% comment %}Content pages description tags (fallback behaviour to read from the content area).{% endcomment %}
    {% else %}
      {% unless editmode %}
        {% capture content %}{% content %}{% endcapture %}
        {% assign content_length = content | strip_html | strip_newlines | remove: ' ' | size %}
        {% if content_length > 0 %}
          <meta property="og:description" content="{{ content | strip_html | escape | strip_newlines | truncatewords: 200, '...' }}">
          <meta name="description" content="{{ content | strip_html | escape | strip_newlines | truncatewords: 200, '...' }}">
        {% endif %}
      {% endunless %}
    {% endif %}
  {% endunless %}
{% endif %}

{% if blog %}{{ blog.rss_link }}{% endif %}
{{ site.stats_header }}
