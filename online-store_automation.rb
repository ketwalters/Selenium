require "selenium-webdriver"

class Base

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @driver.navigate.to "http://store.demoqa.com/"
  end

  def wait
    sleep 10
  end

  def teardown
    @driver.quit
  end

end

class Start < Base

  def begin
    setup
    product_category
    teardown
  end

  def product_category
    @driver.action.move_to(@driver.find_element(:link, 'Product Category')).perform
    @driver.find_element(:link, "iPads" ).click
    wait
  end

end

new_session = Start.new
new_session.begin

