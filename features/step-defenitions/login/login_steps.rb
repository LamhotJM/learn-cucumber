Given(/^there is user that have been registered$/) do
  @username = ENV['USERNAME']
  @password = ENV['PASSWORD']
end

When(/^user login$/) do
  login(@username, @password)
end

Then(/^user will see flash message "([^"]*)"$/) do |flash|
  expect_flash_message_to_have(flash)
end

Then(/^user will see their name on the navbar$/) do
  expect_navbar_have_to_have ENV['USERNAME']
end
