module ApplicationHelper

  def csrf_token
    <<-HTML.html_safe
      <input type="hidden" name="authenticity_token"
        value="#{form_authenticity_token}">
    HTML
  end

  def signout_button

    <<-HTML.html_safe
      <form class="signout-button" action="#{session_url}" method="post">
        #{csrf_token}
        <input type="hidden" name="_method" value="delete">
        <button class="signout">Sign Out</button>
      </form>
    HTML
  end

  def logo
    <<-HTML.html_safe
      <svg version="1.1"
           baseProfile="full"
           width="30" height="30"
           xmlns="http://www.w3.org/2000/svg">
        <circle cx="15" cy="15" r="15" fill="#00ffff" />
      </svg>

    HTML
  end

  def home_url
    if signed_in?
      return '#'
    else
      return root_url
    end
  end

  def google_tracker
    return nil unless Rails.env.production?

    <<-HTML.html_safe
      <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-61523731-1', 'auto');
        ga('send', 'pageview');
      </script>

    HTML
  end

end
