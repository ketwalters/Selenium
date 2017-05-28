require "selenium-webdriver"

class Login_Base
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @driver.navigate.to "https://www.orbitz.com/"
  end

  def wait
    sleep 10
  end

  def teardown
    @driver.quit
  end
end

class Login < Login_Base
  def login_flight
    begin_login
    choose_flight
  end

  def account_login
    @driver.find_element(:css, "button#header-account-signin-button span").click
    wait
  end

  def email_login(email_address)
    @driver.find_element(:id, "signin-loginid").send_keys(email_address)
  end

  def login_password(password)
    @driver.find_element(:id, "signin-password").send_keys(password)
  end

  def submit_button
    @driver.find_element(:css, "button#submitButton span").click
  end

  def flying_from_to(origin, destination)
    @driver.find_element(:css, "li#all-in-flight-header-link a").click
    wait
    @driver.find_element(:id, "flight-origin").send_keys(origin)
    @driver.find_element(:id, "flight-destination").send_keys(destination)
  end 

  def flight_dates(depart_date, return_date)
    @driver.find_element(:id, "flight-departing").send_keys(depart_date)
    @driver.find_element(:id, "flight-returning").send_keys(return_date)
  end

  def adults_children(child_num)
    @driver.find_element(:id, "flight-adults").find_element(:css,"option[value='2']").click
    @driver.find_element(:id, "flight-children").find_element(:css,"option[value='1']").click
    if child_num > 0
      @driver.find_element(:id, "flight-age-select-1").find_element(:css,"option[value='3']").click
    end
    @driver.find_element(:css, "button#search-button span").click
  end

  def begin_login
    setup
    account_login
    email_login("")
    login_password("")
    submit_button
  end

  def choose_flight
    flying_from_to('New York', "Miami")
    flight_dates('06/04/2017','06/07/2017')
    adults_children(1)
    teardown
  end

end
new_session = Login.new
new_session.login_flight

