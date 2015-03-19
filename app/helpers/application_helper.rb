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

end
