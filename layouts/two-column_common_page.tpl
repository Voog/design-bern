<!DOCTYPE html>
<html lang="et">
  <head>
    {% include "html-head" %}
  </head>
  <body>
    <div class="page-wrap cfx">
      {% include "header" %}

      <section class="content-wrap cp-content-wrap pad-0 cfx">
        <section class="content-inner-half pad-46-5 cfx">
          {% contentblock name="left-content" %}
            <h1>Contact us</h1>
            <div class="content cfx">
              My Company 2013.<br>
              Visit us at 1192 Cambridge Street, Cambridge, MA 02139<br>
              Call us +1 617-576-1950<br>
              Email us at <a href="mailto:email@yourname.com">email@yourname.com</a>
            </div>
          {% endcontentblock %}
        </section>

        <section class="content-inner-half cfx">
          {% contentblock name="right-content" %}
            <iframe src="http://maps.google.com/maps?f=q&amp;hl=en&amp;q=boston@42.3584308,-71.0597732&amp;ie=UTF8&amp;ll=42.3584308,-71.0597732&amp;z=12&amp;iwloc=A&amp;output=embed" width="100%" height="525" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
           {% endcontentblock %}
        </section>
      </section>

      {% include "footer" %}
    </div>
    
    {% include "javascripts" %}
  </body>
</html>