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
    return nil
    <<-HTML.html_safe
      <svg version="1.1"
           baseProfile="full"
           width="40" height="40"
           xmlns="http://www.w3.org/2000/svg">
        <circle cx="16" cy="16" r="5" fill="#00ffff" />
        <circle cx="16" cy="32" r="5" fill="#ff00ff" />
        <circle cx="32" cy="25" r="5" fill="#ffff00" />
      </svg>

    HTML
  end

end
