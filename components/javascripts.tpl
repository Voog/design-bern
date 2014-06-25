{% comment %}<!-- SITE WIDE JAVASCRIPTS -->{% endcomment %}
<script src="{{ javascripts_path }}/jquery.js?2"></script>
<script src="{{ javascripts_path }}/main.js?2"></script>
<script src="{{ javascripts_path }}/overthrow.js?2"></script>

{% if site.search.enabled %}
  <script src="http://static.voog.com/libs/edicy-search/1.0.0/edicy-search.js"></script>
  <script>
    var search = new VoogSearch($('.js-search-form').get(0), {
      per_page: 3,
      lang: '{{ page.language_code }}',
      resultsContainer: null,
      sideclick: true,
      updateOnKeypress: false
    });
  </script>
{% endif %}

{% comment %}<!-- GOOGLE ANALYTICS INITIATION -->{% endcomment %}
{% unless editmode %}{{ site.analytics }}{% endunless %}
