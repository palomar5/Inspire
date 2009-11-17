Before do
  include Authlogic::TestCase
  activate_authlogic
end

Given /I am not logged in/ do
  @user_session = UserSession.find
  @user_session.destroy if @user_session
end

Given /I am logged in/ do
  Given 'an user with email "loggedin@fg.hi" and password "123456"'
  When 'I go to the login page'
  And 'I fill in "email_address" with "loggedin@fg.hi"'
  And 'I fill in "password" with "123456"'
  And 'I press "login"'
  controller.session["user_credentials"].should == @user.persistence_token
end

Given /^a(n| non activated) user with email "([^\"]*)" and password "([^\"]*)"$/ do |activated, email, password|
  @user = User.create!(:email => email, :password => password)
  @user.activate! unless activated == ' non activated'
end
