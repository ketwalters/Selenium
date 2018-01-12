require "selenium-webdriver"
require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'csv'

class Login_Base
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @driver.navigate.to "https://www.leapforceathome.com/qrp/core/login"
  end

  def wait
    sleep 10
  end

  def teardown
    @driver.quit
  end
end

class Leapforce < Login_Base
  def login
    @driver.find_element(:name, "username").send_keys("keturahwalters@gmail.com")
    @driver.find_element(:name, "password").send_keys("mpp23045")
    @driver.find_element(:name, "login").click
  end

  def feedback
    wait
    @driver.find_element(:link, "").click
  end

  def needs_met
    wait
    page = HTTParty.get('https://www.leapforceathome.com/qrp/core/vendors/needs_met_feedbacks/list/1')
    puts nokogiri_page = Nokogiri::HTML(page)
    #@driver.find_element(:link, "where the wild things are trailer").click
    #@driver.find_element(:link, "where the wild things are trailer").click
    #wait
    #ele = @driver.find_element(:class, "orangewrap").click
    #ele.send_keys(:control,)
  end

  def start
    setup
    login
    feedback
    needs_met
    teardown
  end
end

a = Leapforce.new
a.start


