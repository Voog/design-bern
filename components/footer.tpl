<footer class="footer">
  <div class="content-formatted">{% xcontent name="footer" %}</div>
  <div class="voog-reference">{% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}</div>
  
  {% if page.private? %}   
    <div class="signout-btn-pad"></div>
  {% endif %}
</footer>
