def login(username, password)
  visit_url '/' if current_path != '/'
  click_link('Login')
  fill_in 'user_session_username', :with => username
  fill_in 'user_session_password', :with => password
  click_button('Login')
  dismiss_one_signal_popup
  dismiss_abandoned_popup
end

def logout
  visit_url '/logout'
  sleep 3
end

def dismiss_one_signal_popup
   click_button("No Thanks") if page.has_css?(".onesignal-popover-dialog")
end


def dismiss_abandoned_popup
  if(page.has_button?('close')) || page.has_css?('.mfp-close')
    if current_path.include? '/p'
      find('.mfp-close').click
    else
      click_button('close')
    end
  end
end

def visit_url(url)
  visit url
  dismiss_one_signal_popup
  dismiss_abandoned_popup
end