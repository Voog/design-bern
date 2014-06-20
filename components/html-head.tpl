<!-- IE SETTINGS -->
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->

<!-- BASIC META INFO -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
{% unless page.keywords == nil or page.keywords == "" %}<meta name="keywords" content="{{ page.keywords }}">{% endunless %}
{% unless page.description == nil or page.keywords == "" %}<meta name="description" content="{{ page.description }}">{% endunless %}

<!-- FAV ICON -->
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/favicon.ico" type="image/ico">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
{% comment %}<!-- TODO: Add functionality after the CMS is going to support it -->{% endcomment %}
{% if site.data.touch_icon %}<link rel="apple-touch-icon" href="{{ site.data.touch_icon }}">{% endif %}

<!-- MODERNIZR - HTML5 SUPPORT FOR OLDER BROWSERS, SVG SUPPORT DETECTION ETC -->
<script src="{{ javascripts_path }}/modernizr.js?3"></script>

<!-- STYLESHEETS -->
<link rel="stylesheet" href="http://static.voog.com/libs/edicy-search/1.0.0/edicy-search.css?3">
{% stylesheet_link "main.css?3" %}
<!--[if lt IE 9]>{% stylesheet_link "ie8.css?3" %}<![endif]-->

<!-- SITE TITLE -->
<title>{% if article %}{{ article.title }} — {{ page.site_title }}{% else %}{% if site.root_item.selected? %}{{ page.site_title }}{% else %}{{ page.title }} — {{ page.site_title }}{% endif %}{% endif %}</title>

<!-- FACEBOOK OPENGRAPH -->
{% comment %}<!-- Page specific opengraph tags are located in each page template -->{% endcomment %}
{% comment %}<!-- TODO: Add functionality after the CMS is going to support it -->{% endcomment %}
{% if site.data.fb_admin %}<meta property="fb:admins" content="{{ site.data.fb_admin }}">{% endif %}
<meta property="og:type" content="website">
<!-- https://developers.facebook.com/tools/debug - Debug after each modification -->
