require_relative "../spec_helper"
require_relative "../../lib/loginpage"
require_relative "../../lib/homepage"
require_relative "../../lib/accountpage"
require_relative "../../lib/urls"

=begin
UI Automation Task
Log in to Web App.
Navigate to the Account Summary page 
Confirm that the page gets displayed properly and 
confirm that the number of accounts that are being displayed is actually right.
=end


describe "Account" do
  before {
  @user = "amitd"
  @url = UrlValues.new(browser)
  @login_page = LoginPage.new(browser)
  @home_page = HomePage.new(browser)
  @account_page = AccountPage.new(browser)
  @browser.goto(@url.url_loc(@user, "HOME"))
}


  it "logs in and then goes to the account page using link on home page" do
    email_val = 'Jay8212@hotmail.com'
    password_val = "password123"
    @login_page.login(email_val, password_val)
    @home_page.go_to_account_page
    if (@browser.div :class => '.Pagination-left').exists?
    	puts "Account Page Loaded"
    end
    @account_page.validate_accounts(2)
    @login_page.logout   
  end

  it "goes directly to the account page after logging in" do
  	email_val = 'Jay8212@hotmail.com'
    password_val = "password123"
    @login_page.login(email_val, password_val)
    @browser.goto(@url.url_loc(@user, "ACCOUNT"))
    if (@browser.div :class => '.Pagination-left').exists?
    	puts "Account Page Loaded"
    end
    @account_page.validate_accounts(2)
    @login_page.logout 
  end

end
