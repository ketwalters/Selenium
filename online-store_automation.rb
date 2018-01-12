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
    product_category('iPads')
    product_page('Apple iPad 2 16GB, Wi-Fi, 9.7in – Black')
    add_to_cart
    checkout
    teardown
  end

  def product_category(product)
    @driver.action.move_to(@driver.find_element(:link, 'Product Category')).perform
    @driver.find_element(:link, product).click
    wait
  end

  def product_page (item)
    @driver.find_element(:link, item).click
  end

  def add_to_cart
    @driver.find_element(:name, "Buy").click
    wait
  end

  def checkout
    @driver.find_element(:class, "cart_icon").click
    wait
    @driver.find_element(:class, "step2").click
  end

end

new_session = Start.new
new_session.begin

