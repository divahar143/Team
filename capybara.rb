public
def driver
  # Capybara.default_driver = :selenium_chrome_headless
  Capybara.default_driver = :selenium_chrome
  @driver ||= Capybara.current_session
  @driver.driver.browser.manage.window.maximize
  @driver
end

def visit url
  driver.visit url
end

def fill_in key, value
  driver.fill_in(key, :with => value)
end

def click_button value=nil
  driver.click_button value
end

def click value=nil
  driver.click value
end

def click_link value=nil
  driver.click_link value
end

def select app, action
  driver.select('Option', :from => app)
end

def find by, value, visible=true
  driver.find(by.to_sym, value, visible: visible)
end

def has_content? value
  driver.has_content? value
end

def has_no_content? value
  driver.has_no_content? value
end

def has_css? value
  driver.has_css? value
end

def has_no_css? value
  driver.has_no_css? value
end

def has_xpath? value
  driver.has_xpath? value
end

def has_no_xpath? value
  driver.has_no_xpath? value
end

def has_link? value
  driver.has_link? value
end

def has_no_link? value
  driver.has_no_link? value
end

def has_button? value
  driver.has_button? value
end

def has_no_button? value
  driver.has_no_button? value
end

def has_field? value
  driver.has_field? value
end

def has_no_field? value
  driver.has_no_field? value
end

def has_checked_field? value
  driver.has_checked_field? value
end

def has_unchecked_field? value
  driver.has_unchecked_field? value
end

def has_table? value
  driver.has_table? value
end

def has_no_table? value
  driver.has_no_table? value
end

def has_select? value
  driver.has_select? value
end

def has_no_select? value
  driver.has_no_select? value
end

def set_selenium_window_size(width, height)
  driver.current_window.resize_to(width, height)
end
