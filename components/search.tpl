{% if site.search.enabled %}
  <div class="search js-search js-popover js-prevent-sideclick">
    <form id="search" class="search-form js-search-form" method="get" action="#">
      <input id="onpage_search" class="search-input js-search-input" type="text" name="" placeholder="{{ 'search_this_site' | lc }}">
      <button class="search-btn search-submit">
        <svg width="16" height="16" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">
          <path d="M16 14.14c0 .497-.196.964-.552 1.316-.356.35-.83.544-1.332.544-.503 0-.976-.194-1.332-.544L9.54 12.252c-.895.45-1.893.73-2.968.73C2.942 12.98 0 10.074 0 6.49 0 2.906 2.943 0 6.572 0c3.63 0 6.572 2.906 6.572 6.49 0 1.166-.336 2.244-.88 3.19l3.184 3.145c.356.35.552.818.552 1.315zM6.573 1.563c-2.757 0-4.992 2.207-4.992 4.93s2.236 4.93 4.993 4.93c2.758 0 4.992-2.207 4.992-4.93s-2.234-4.93-4.992-4.93z"></path>
        </svg>
      </button>
    </form>

    <div class="voog-search-modal">
      <div class="voog-search-modal-inner js-voog-search-modal-inner"></div>
    </div>
  </div>
{% endif %}
