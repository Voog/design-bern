{% if editmode %}
  <div class="tags">
    <div class="tags-editor">{% editable article.tags %}</div>
  </div>
{% else %}
  {% unless article.tags == empty %}
    <div class="tags">
      <div class="tags-icon">
        <svg xmlns="http://www.w3.org/2000/svg" width="16.002" height="16.004" viewBox="0 0 16.002 16.004">
          <path fill="#333" d="M15.528 9.104C14.458 8.032 6.425 0 6.425 0H0v6.426l9.103 9.103s1.07 1.07 2.142 0l4.284-4.284c-.002 0 1.07-1.072-.002-2.142M4.283 4.284c-.59.59-1.55.592-2.142 0-.59-.59-.59-1.55 0-2.142.593-.592 1.55-.59 2.143 0 .592.592.592 1.55 0 2.142"/>
        </svg>
      </div>

      <nav class="menu-tags">
        <ul class="menu">
          {% for tag in article.tags %}
            <li class="menu-item"><a class="menu-link" href="/{{ article.page.path_with_lang }}/tagged/{{ tag.path }}">{{ tag.name }}</a>{% unless forloop.last %},{% endunless %}</li>
          {% endfor %}
        </ul>
      </nav>
    </div>
  {% endunless %}
{% endif %}
