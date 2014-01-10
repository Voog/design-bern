<script src="{{ javascripts_path }}/jquery-1.10.2.min.js"></script>
<script src="{{ javascripts_path }}/main.js"></script>
<script src="{{ javascripts_path }}/retina-1.1.0.min.js"></script>
<script src="{{ javascripts_path }}/jquery.edicyAjaxForm.js"></script>
<script>
  $(".content-wrap form").edicyAjaxForm();
</script>
{% if site.search.enabled %}
  <script src="http://static.edicy.com/assets/site_search/3.0/site_search.js?1"></script>
  <script>
    var edys_site_search_options = {
      texts: { noresults: "{{ "search_noresults"|lc }}" },
      default_stylesheet_enabled: false
    }
  </script>
{% endif %}
{% unless editmode %}{{ site.analytics }}{% endunless %}