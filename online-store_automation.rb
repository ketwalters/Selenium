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
    choose_and_check
    checkout_form
    teardown
  end

  def choose_and_check
    product_category('iPads')
    product_page('Apple iPad 2 16GB, Wi-Fi, 9.7in – Black')
    add_to_cart
    checkout
  end

  def checkout_form
    @driver.find_element(:id, "wpsc_checkout_form_9").send_keys("test123@test.com")
    @driver.find_element(:id, "wpsc_checkout_form_2").send_keys("Kay")
    @driver.find_element(:id, "wpsc_checkout_form_3").send_keys("Clarke")
    @driver.find_element(:id, "wpsc_checkout_form_4").send_keys("1203 Main Street")
    @driver.find_element(:id, "wpsc_checkout_form_5").send_keys("Brooklyn")
    @driver.find_element(:id, "uniform-wpsc_checkout_form_7").find_element(:css,"option[value='US']").click
    @driver.find_element(:id, "wpsc_checkout_form_8").send_keys("10001")
    @driver.find_element(:id, "wpsc_checkout_form_18").send_keys("123-345-6789")
    @driver.find_element(:class, "input-button-buy").click
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
    wait
  end

end

new_session = Start.new
new_session.begin

