{% comment %}<!-- SITE WIDE JAVASCRIPTS -->{% endcomment %}
<script src="{{ javascripts_path }}/jquery.js?2"></script>
<script src="{{ javascripts_path }}/main.js?2"></script>
<script src="{{ javascripts_path }}/overthrow.js?2"></script>

{% comment %}<!-- SITE SEARCH INITIATION -->{% endcomment %}
<script src="{{ javascripts_path }}/edicy-search.js?2"></script>
<script type="text/javascript">
  var search = new VoogSearch($('.js-search-form').get(0), {
    per_page: 3,
    lang: '{{ page.language_code }}'
  });
</script>

{% comment %}<!-- GOOGLE ANALYTICS INITIATION -->{% endcomment %}
{% unless editmode %}{{ site.analytics }}{% endunless %}
