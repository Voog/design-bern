<footer class="footer">
  <div class="content-formatted">
    {%- assign footer_content_title = "footer" | lce -%}
    {%- assign footer_content_title_tooltip = "content_tooltip_all_pages_same_language" | lce -%}
    {% xcontent name="footer" title=footer_content_title title_tooltip=footer_content_title_tooltip %}
  </div>
  <div class="voog-reference">{% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}</div>
  {% if page.private? %}
  <div class="signout-btn-margin"></div>
  {% endif %}
</footer>
