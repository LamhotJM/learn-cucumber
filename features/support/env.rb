require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'rspec/retry'
require 'pry'
require 'securerandom'

require 'dotenv'
Dotenv.load

#Setup Capybara host and driver
Capybara.app_host = ENV['BASE_URL']
Capybara.default_driver = :selenium

# Default max_wait_time = 2
Capybara.default_max_wait_time = 2

#Screenshot Settings
Capybara::Screenshot.autosave_on_failure = true
Capybara::Screenshot.webkit_options = { width: 1366, height: 768 }
Capybara.save_path = "screenshots"

After do |scenario|
  if scenario.failed?
    timestamp = "#{Time.now.getutc}"
    screenshot_name = "screenshot-#{scenario.title}-#{timestamp}.png"
    screenshot_path = "#{screenshot_name}"
    Capybara.page.save_screenshot(screenshot_path)
  end
end

#Selenium WebDriver Profile Configuration
Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.timeout = 120 #default 60
  Capybara::Selenium::Driver.new(app,  http_client: client)
end

#Initiate browser window size
Before do
  page.driver.browser.manage.window.resize_to(1366, 768)
end