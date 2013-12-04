Given(/^I am on the Midnight home page$/) do
  '/'
end

When(/^I click on the Register button$/) do
  '/register'
end

Then(/^the page title should be Midnight \- Register$/) do
  page.should have_css('head title', :text => 'Midnight - Register')
end
