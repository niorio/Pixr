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

end
