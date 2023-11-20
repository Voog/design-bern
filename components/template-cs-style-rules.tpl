body {
  font-family: var(--main-font-family);
  color: var(--content-body-text-color);
}

.header-title, .header-title .header-link {
  font-size: var(--header-body-font-size);
  font-style: var(--header-body-font-style);
  font-weight: var(--header-body-font-weight);
  color: var(--header-body-text-color);
  -webkit-text-decoration: var(--header-body-text-decoration);
          text-decoration: var(--header-body-text-decoration);
  text-transform: var(--header-body-text-transform);
}
.header-title:hover, .header-title .header-link:hover {
  font-size: var(--header-body-font-size);
  font-style: var(--header-body-hover-font-style);
  font-weight: var(--header-body-hover-font-weight);
  color: var(--header-body-hover-text-color);
  -webkit-text-decoration: var(--header-body-hover-text-decoration);
          text-decoration: var(--header-body-hover-text-decoration);
  text-transform: var(--header-body-hover-text-transform);
}

.content-topbar,
.content,
.content.two-columns,
.content .content-inner {
  background-color: var(--content-background-color);
}

.menu-main .menu .menu-item .menu-link {
  font-style: var(--menu-main-font-style);
  font-weight: var(--menu-main-font-weight);
  color: var(--menu-main-color);
  -webkit-text-decoration: var(--menu-main-text-decoration);
          text-decoration: var(--menu-main-text-decoration);
  text-transform: var(--menu-main-text-transform);
  opacity: 0.7;
}
@media screen and (min-width: 841px) {
  .menu-main .menu .menu-item .menu-link {
    font-size: var(--menu-main-font-size);
  }
}
.menu-main .menu .menu-item .menu-link.active {
  font-style: var(--menu-main-active-font-style);
  font-weight: var(--menu-main-active-font-weight);
  color: var(--menu-main-active-color);
  -webkit-text-decoration: var(--menu-main-active-text-decoration);
          text-decoration: var(--menu-main-active-text-decoration);
  text-transform: var(--menu-main-active-text-transform);
  opacity: 0.5;
}
.menu-main .menu .menu-item .menu-link.active:hover {
  color: var(--menu-main-active-color);
}
.menu-main .menu .menu-item .menu-link:hover {
  font-style: var(--menu-main-hover-font-style);
  font-weight: var(--menu-main-hover-font-weight);
  color: var(--menu-main-hover-color);
  -webkit-text-decoration: var(--menu-main-hover-text-decoration);
          text-decoration: var(--menu-main-hover-text-decoration);
  text-transform: var(--menu-main-hover-text-transform);
  opacity: 0.5;
}

.menu-sub .menu .menu-item .menu-link {
  font-size: var(--menu-sub-font-size);
  font-style: var(--menu-sub-font-style);
  font-weight: var(--menu-sub-font-weight);
  color: var(--menu-sub-color);
  -webkit-text-decoration: var(--menu-sub-text-decoration);
          text-decoration: var(--menu-sub-text-decoration);
  text-transform: var(--menu-sub-text-transform);
  opacity: 0.5;
}
.menu-sub .menu .menu-item .menu-link.active {
  font-style: var(--menu-sub-active-font-style);
  font-weight: var(--menu-sub-active-font-weight);
  color: var(--menu-sub-active-color);
  -webkit-text-decoration: var(--menu-sub-active-text-decoration);
          text-decoration: var(--menu-sub-active-text-decoration);
  text-transform: var(--menu-sub-active-text-transform);
  opacity: 1;
}
.menu-sub .menu .menu-item .menu-link.active:hover {
  color: var(--menu-sub-active-color);
}
.menu-sub .menu .menu-item .menu-link:hover {
  font-style: var(--menu-sub-hover-font-style);
  font-weight: var(--menu-sub-hover-font-weight);
  color: var(--menu-sub-hover-color);
  -webkit-text-decoration: var(--menu-sub-hover-text-decoration);
          text-decoration: var(--menu-sub-hover-text-decoration);
  text-transform: var(--menu-sub-hover-text-transform);
  opacity: 1;
}

.post-page .post post-title,
.post .post-title a,
.blog-pate .post-date,
.post-page .post .post-header-inner,
.comments .comments-title {
  color: var(--secondary-color-content);
}

@media screen and (min-width: 1021px) {
  .content .content-formatted {
    font-size: var(--content-body-font-size);
    line-height: var(--content-body-line-height);
  }
}
.footer .content-formatted {
  font-size: var(--footer-body-font-size);
  font-style: var(--footer-body-font-style);
  font-weight: var(--footer-body-font-weight);
  color: var(--footer-body-color);
  -webkit-text-decoration: var(--footer-body-text-decoration);
          text-decoration: var(--footer-body-text-decoration);
  text-transform: var(--footer-body-text-transform);
}
.light-background .content-formatted, .light-background .content-formatted h1, .light-background .content-formatted h2, .light-background .content-formatted h3, .light-background .content-formatted h4, .light-background .content-formatted h5, .light-background .content-formatted h6, .light-background .content-formatted p, .light-background .content-formatted ul, .light-background .content-formatted ol, .light-background .content-formatted table {
  color: var(--secondary-color-content);
}
.dark-background .content-formatted, .dark-background .content-formatted h1, .dark-background .content-formatted h2, .dark-background .content-formatted h3, .dark-background .content-formatted h4, .dark-background .content-formatted h5, .dark-background .content-formatted h6, .dark-background .content-formatted p, .dark-background .content-formatted ul, .dark-background .content-formatted ol, .dark-background .content-formatted table {
  color: var(--third-color);
}
.content-formatted h1 {
  color: var(--headings-title-color);
}
.content-formatted h1,
.content-formatted h1 a,
.content-formatted h1 a:hover {
  font-size: var(--headings-title-font-size);
  font-style: var(--headings-title-font-style);
  font-weight: var(--headings-title-font-weight);
  line-height: var(--headings-title-line-height);
  text-align: var(--headings-title-text-alignment);
  -webkit-text-decoration: var(--headings-title-text-decoration);
          text-decoration: var(--headings-title-text-decoration);
  text-transform: var(--headings-title-text-transform);
}
.content-formatted h2 {
  color: var(--headings-heading-color);
}
.content-formatted h2,
.content-formatted h2 a,
.content-formatted h2 a:hover {
  font-size: var(--headings-heading-font-size);
  font-style: var(--headings-heading-font-style);
  font-weight: var(--headings-heading-font-weight);
  line-height: var(--headings-heading-line-height);
  text-align: var(--headings-heading-text-alignment);
  -webkit-text-decoration: var(--headings-heading-text-decoration);
          text-decoration: var(--headings-heading-text-decoration);
  text-transform: var(--headings-heading-text-transform);
}
.content-formatted h3,
.content-formatted h4,
.content-formatted h5,
.content-formatted h6 {
  color: var(--headings-subheading-color);
}
.content-formatted h3,
.content-formatted h3 a,
.content-formatted h3 a:hover,
.content-formatted h4,
.content-formatted h4 a,
.content-formatted h4 a:hover,
.content-formatted h5,
.content-formatted h5 a,
.content-formatted h5 a:hover,
.content-formatted h6,
.content-formatted h6 a,
.content-formatted h6 a:hover {
  font-size: var(--headings-subheading-font-size);
  font-style: var(--headings-subheading-font-style);
  font-weight: var(--headings-subheading-font-weight);
  line-height: var(--headings-subheading-line-height);
  text-align: var(--headings-subheading-text-alignment);
  -webkit-text-decoration: var(--headings-subheading-text-decoration);
          text-decoration: var(--headings-subheading-text-decoration);
  text-transform: var(--headings-subheading-text-transform);
}
.content-formatted a {
  font-weight: var(--content-link-font-weight);
  font-style: var(--content-link-font-style);
  -webkit-text-decoration: var(--content-link-text-decoration);
          text-decoration: var(--content-link-text-decoration);
  text-transform: var(--content-link-text-transform);
  color: var(--content-link-color);
}
.content-formatted a:hover {
  font-weight: var(--content-link-hover-font-weight);
  font-style: var(--content-link-hover-font-style);
  -webkit-text-decoration: var(--content-link-hover-text-decoration);
          text-decoration: var(--content-link-hover-text-decoration);
  text-transform: var(--content-link-hover-text-transform);
  color: var(--content-link-hover-color);
}
.front-page .content-formatted pre,
.front-page .content-formatted code {
  color: var(--secondary-color-content);
}
.content-formatted table th,
.content-formatted table td {
  padding: var(--table-padding);
  font-size: var(--table-font-size);
  border-top-style: var(--table-border-style);
  border-bottom-style: var(--table-border-style);
}
.content-formatted .custom-btn,
.content-formatted .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-btn-wrap .edy-product-widget-item-btn {
  padding: calc(var(--content-button-padding) - 13px) calc(var(--content-button-padding) - 10px);
  font-size: var(--content-button-font-size);
  font-style: var(--content-button-font-style);
  font-weight: var(--content-button-font-weight);
  -webkit-text-decoration: var(--content-button-text-decoration);
          text-decoration: var(--content-button-text-decoration);
  text-transform: var(--content-button-text-transform);
  border-color: var(--content-button-color);
  -webkit-box-shadow: var(--content-button-border-width) var(--content-button-border-width) 0 rgba(0, 0, 0, 0.1);
          box-shadow: var(--content-button-border-width) var(--content-button-border-width) 0 rgba(0, 0, 0, 0.1);
}
.content-formatted .custom-btn:hover,
.content-formatted .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-btn-wrap .edy-product-widget-item-btn:hover {
  font-style: var(--content-button-hover-font-style);
  font-weight: var(--content-button-hover-font-weight);
  -webkit-text-decoration: var(--content-button-hover-text-decoration);
          text-decoration: var(--content-button-hover-text-decoration);
  text-transform: var(--content-button-hover-text-transform);
  border-color: var(--content-button-hover-color);
}
.content-formatted .custom-btn:not(.custom-btn-disabled),
.content-formatted .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-btn-wrap .edy-product-widget-item-btn:not(.custom-btn-disabled) {
  color: var(--content-button-color);
  background-color: var(--content-button-background-color);
}
.content-formatted .custom-btn:not(.custom-btn-disabled):hover,
.content-formatted .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-btn-wrap .edy-product-widget-item-btn:not(.custom-btn-disabled):hover {
  color: var(--content-button-hover-color);
  background-color: var(--content-button-hover-background-color);
}
.dark-background .content-formatted .custom-btn,
.dark-background .content-formatted .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-btn-wrap .edy-product-widget-item-btn {
  -webkit-box-shadow: var(--content-button-border-width) var(--content-button-border-width) 0 rgba(0, 0, 0, 0.1);
          box-shadow: var(--content-button-border-width) var(--content-button-border-width) 0 rgba(0, 0, 0, 0.1);
}
.light-background .content-formatted .custom-btn,
.light-background .content-formatted .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-btn-wrap .edy-product-widget-item-btn {
  -webkit-box-shadow: var(--content-button-border-width) var(--content-button-border-width) 0 rgba(0, 0, 0, 0.2);
          box-shadow: var(--content-button-border-width) var(--content-button-border-width) 0 rgba(0, 0, 0, 0.2);
}
.content-formatted .edy-buy-button-price-container .edy-buy-button-price-original,
.content-formatted .edy-buy-button-price-container .edy-buy-button-effective-price {
  color: var(--content-body-text-color);
}
.dark-background .content-formatted .edy-buy-button-price-container .edy-buy-button-price-original,
.dark-background .content-formatted .edy-buy-button-price-container .edy-buy-button-effective-price {
  color: var(--third-color);
}

.content-formatted .form_field_textfield, .content-formatted .form_field_textarea, .content-formatted .form_field_select {
  font-size: var(--form-field-font-size);
  color: var(--form-field-color);
  -webkit-box-shadow: var(--form-field-border-width) var(--form-field-border-width) 0 rgba(0, 0, 0, 0.1);
          box-shadow: var(--form-field-border-width) var(--form-field-border-width) 0 rgba(0, 0, 0, 0.1);
}
.dark-background .content-formatted .form_field_textfield, .dark-background .content-formatted .form_field_textarea, .dark-background .content-formatted .form_field_select {
  color: var(--secondary-color-content);
  -webkit-box-shadow: var(--form-field-border-width) var(--form-field-border-width) 0 rgba(0, 0, 0, 0.1);
          box-shadow: var(--form-field-border-width) var(--form-field-border-width) 0 rgba(0, 0, 0, 0.1);
}
.light-background .content-formatted .form_field_textfield, .light-background .content-formatted .form_field_textarea, .light-background .content-formatted .form_field_select {
  color: var(--third-color);
  -webkit-box-shadow: var(--form-field-border-width) var(--form-field-border-width) 0 rgba(0, 0, 0, 0.2);
          box-shadow: var(--form-field-border-width) var(--form-field-border-width) 0 rgba(0, 0, 0, 0.2);
}
.content-formatted .form_field, .content-formatted .form_field .form_field_label, .content-formatted .form_field .edy-fe-label {
  font-size: var(--form-label-font-size);
  color: var(--form-field-color);
}
.dark-background .content-formatted .form_field, .dark-background .content-formatted .form_field .form_field_label, .dark-background .content-formatted .form_field .edy-fe-label {
  color: var(--third-color);
}
.light-background .content-formatted .form_field, .light-background .content-formatted .form_field .form_field_label, .light-background .content-formatted .form_field .edy-fe-label {
  color: var(--secondary-color-content);
}
.content-formatted .form_submit input {
  font-size: var(--content-button-font-size);
  padding: calc(var(--content-button-padding) - 13px) calc(var(--content-button-padding) - 10px);
  color: var(--content-button-color);
  background-color: var(--content-button-background-color);
  -webkit-box-shadow: var(--form-field-border-width) var(--form-field-border-width) 0 rgba(0, 0, 0, 0.1);
          box-shadow: var(--form-field-border-width) var(--form-field-border-width) 0 rgba(0, 0, 0, 0.1);
  font-style: var(--content-button-font-style);
  font-weight: var(--content-button-font-weight);
  -webkit-text-decoration: var(--content-button-text-decoration);
          text-decoration: var(--content-button-text-decoration);
  text-transform: var(--content-button-text-transform);
}
.content-formatted .form_submit input:hover {
  font-style: var(--content-button-hover-font-style);
  font-weight: var(--content-button-hover-font-weight);
  color: var(--content-button-hover-color);
  -webkit-text-decoration: var(--content-button-hover-text-decoration);
          text-decoration: var(--content-button-hover-text-decoration);
  text-transform: var(--content-button-hover-text-transform);
  background-color: var(--content-button-hover-background-color);
}
.dark-background .content-formatted .form_submit input {
  -webkit-box-shadow: var(--form-field-border-width) var(--form-field-border-width) 0 rgba(0, 0, 0, 0.1);
          box-shadow: var(--form-field-border-width) var(--form-field-border-width) 0 rgba(0, 0, 0, 0.1);
}
.light-background .content-formatted .form_submit input {
  -webkit-box-shadow: var(--form-field-border-width) var(--form-field-border-width) 0 rgba(0, 0, 0, 0.2);
          box-shadow: var(--form-field-border-width) var(--form-field-border-width) 0 rgba(0, 0, 0, 0.2);
}
.content-formatted .form_area .feedback-error, .content-formatted .form_area .feedback-success, .content-formatted .form_area .form_error, .content-formatted .form_area .form_notice {
  -webkit-box-shadow: var(--form-field-border-width) var(--form-field-border-width) 0 rgba(0, 0, 0, 0.1);
          box-shadow: var(--form-field-border-width) var(--form-field-border-width) 0 rgba(0, 0, 0, 0.1);
}
.dark-background .content-formatted .form_area .feedback-error, .dark-background .content-formatted .form_area .feedback-success, .dark-background .content-formatted .form_area .form_error, .dark-background .content-formatted .form_area .form_notice {
  -webkit-box-shadow: var(--form-field-border-width) var(--form-field-border-width) 0 rgba(0, 0, 0, 0.1);
          box-shadow: var(--form-field-border-width) var(--form-field-border-width) 0 rgba(0, 0, 0, 0.1);
}
.light-background .content-formatted .form_area .feedback-error, .light-background .content-formatted .form_area .feedback-success, .light-background .content-formatted .form_area .form_error, .light-background .content-formatted .form_area .form_notice {
  -webkit-box-shadow: var(--form-field-border-width) var(--form-field-border-width) 0 rgba(0, 0, 0, 0.2);
          box-shadow: var(--form-field-border-width) var(--form-field-border-width) 0 rgba(0, 0, 0, 0.2);
}

.product-content .product-price {
  color: var(--content-area-product-price__color);
  font-size: var(--content-area-product-price__font-size);
  font-weight: var(--content-area-product-price__font-weight);
  font-style: var(--content-area-product-price__font-style);
}
.product-content .product-price .product-price-final {
  -webkit-text-decoration: var(--content-area-product-price__text-decoration);
          text-decoration: var(--content-area-product-price__text-decoration);
}
.product-content .product-description {
  color: var(--content-area-product-description__color);
  font-size: var(--content-area-product-description__font-size);
  font-weight: var(--content-area-product-description__font-weight);
  font-style: var(--content-area-product-description__font-style);
  -webkit-text-decoration: var(--content-area-product-description__text-decoration);
          text-decoration: var(--content-area-product-description__text-decoration);
}
.product-content .content-item-title h1 {
  color: var(--content-area-product-title__color);
  font-size: var(--content-area-product-title__font-size);
  font-weight: var(--content-area-product-title__font-weight);
  font-style: var(--content-area-product-title__font-style);
  -webkit-text-decoration: var(--content-area-product-title__text-decoration);
          text-decoration: var(--content-area-product-title__text-decoration);
  text-align: var(--content-area-product-title__alignment);
}

.dark-background .edy-product-widget-grid .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-title,
.dark-background .edy-product-widget-grid .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-link {
  color: var(--third-color);
}
.dark-background .edy-product-widget-grid .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-description {
  color: var(--third-color);
  opacity: 0.7;
}
.dark-background .edy-product-widget-grid .edy-product-widget-item .edy-product-widget-item-top-outer .edy-product-widget-item-top.edy-product-widget-item-without-image {
  border: 1px solid var(--third-color);
  opacity: 0.5;
}
.dark-background .edy-product-widget-grid .edy-product-widget-item .edy-product-widget-item-details-flex-wrap .edy-product-widget-item-out-of-stock,
.dark-background .edy-product-widget-grid .edy-product-widget-item .edy-product-widget-item-details-flex-wrap .edy-product-widget-item-btn {
  color: var(--third-color);
}
.dark-background .edy-product-widget-grid .edy-product-widget-item:hover .edy-product-widget-item-price {
  opacity: 0;
}

.dark-background .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-header .edy-product-widget-item-title .edy-product-widget-item-link {
  color: var(--third-color);
}
.dark-background .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-header .edy-product-widget-item-out-of-stock {
  color: var(--third-color);
}
.dark-background .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-description {
  color: var(--third-color);
}
.dark-background .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-without-image {
  border: 1px solid var(--third-color);
  opacity: 0.5;
}

.edy-product-widget-filter-sort option {
  color: var(--secondary-color-content);
}

.dark-background .edy-product-widget-item-price-original,
.dark-background .edy-product-widget-item-price-final,
.dark-background .edy-product-widget-filter-name,
.dark-background .edy-product-widget-filter-sort,
.dark-background .edy-product-widget-filter-label,
.dark-background .edy-product-widget-filter-search-input {
  color: var(--third-color);
}
.dark-background .edy-product-widget-item-price-original {
  opacity: 0.4;
}