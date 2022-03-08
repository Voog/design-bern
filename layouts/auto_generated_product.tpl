<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "edicy-tools-variables" %}
  {% include "html-head" content_page: true %}
</head>

{%- capture bottom_content_html -%}
  {%- unless editmode -%}
    {%- content bind=product name="content" -%}
  {%- endunless -%}
{%- endcapture -%}

{%- assign bottom_content_size = bottom_content_html | strip | size -%}

{%- capture gallery_content_html -%}
  {%- unless editmode -%}
    {%- content bind=product name="gallery" -%}
  {%- endunless -%}
{%- endcapture -%}

{%- assign gallery_content_size = gallery_content_html | strip | size -%}

<body class="common-page">
  <div class="container js-container">
    {% include "header" %}
    {% include "menu-level-2" %}

    <main class="content product-content" role="main">
      <div class="content-inner{% if has_children %} with-submenu{% endif %}">

        {% include "menu-breadcrumbs-sd" %}

        <div class="flex_row flex_row-2 mar_0-32-neg" data-search-indexing-allowed="true">
          <div class="flex_row-2--item-50">
            <div class="mar_0-32 p-rel js-product-page-image-wrap">
              {%- if product.image != blank -%}
                {%- assign item_image_state = "with-image" -%}
              {%- else -%}
                {%- assign item_image_state = "without-image" -%}
              {%- endif -%}

              <div class="content-illustrations">
                <div class="content-item-box {{ item_image_state }} mar_b-32 js-content-item-box" data-item-type="page">
                  <div class="item-top product-image">
                    {%- if product.image != blank- %}
                      <div class="top-inner aspect-ratio-inner">
                        {%- assign image_class = "item-image not-cropped" -%}
                        {% image product.image target_width: "1280" class: image_class loading: "lazy" %}
                      </div>
                    {%- endif -%}
                  </div>
                </div>
              </div>
            </div>
            {%- if gallery_content_size > 0 or editmode -%}
              <section class="content-formatted content-gallery js-product-gallery" data-search-indexing-allowed="true">
                {% content bind=product name="gallery" %}
              </section>
            {%- endif -%}
          </div>

          <div class="flex_row-2--item-50 js-product-content-right">
            <div class="mar_0-32 flex_col t-sticky">
              <div class="content-formatted content-item-title" data-search-indexing-allowed="true">
                <h1>{%- editable product.name -%}</h1>
              </div>

              <div class="product-price">
                {%- if product.price_max_with_tax != product.price_min_with_tax -%}
                  {{ product.price_min_with_tax | money_with_currency: product.currency -}}
                  <span class="product-price-divider">–</span>
                {%- endif -%}
                {{ product.price_max_with_tax | money_with_currency: product.currency -}}
              </div>

              <section class="content-formatted" data-search-indexing-allowed="true">
                {%- if editmode or product.description != blank -%}
                  <div class="product-description">
                    {%- editable product.description -%}
                  </div>
                {%- endif -%}

                <div class="buy-btn-content js-buy-btn-content">
                  {% include "buy-button" %}
                </div>

                {% content bind=product %}
              </section>
            </div>
          </div>
        </div>
        {%- if bottom_content_size > 0 or editmode -%}
          <section
            class="content-product-wide content-formatted"
            data-search-indexing-allowed="true">
            {% content bind=product name="content" %}
          </section>
        {%- endif -%}
      </div>
    </main>

    {% include "footer" %}
  </div>

  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "edicy-tools" %}

  <script>
    if (site) {
      site.handleProductPageContent();
      {%- if product and editmode %}
        site.handleProductImageClick({{ product.id }});
      {% endif -%}
    }
  </script>
</body>
</html>