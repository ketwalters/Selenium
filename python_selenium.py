import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.ui import Select

def init_driver():
    driver = webdriver.Firefox()
    driver.wait = WebDriverWait(driver, 5)
    return driver

def navigate_to_page(driver, query):
  driver.get('http://adam.goucher.ca/parkcalc/')

def test_lot_dropdown_works():
  mySelect = Select(driver.find_element(By.ID, "Lot"))
  mySelect.select_by_visible_text("Economy Parking")

def test_entry_date_time():
  elem = driver.find_element_by_name('EntryTime')
  elem.clear()
  elem.send_keys("9:00")

  driver.find_elements_by_xpath(".//input[@type='radio' and @value='AM']")[0].click

  elem = driver.find_element_by_name('EntryDate')
  elem.clear()
  elem.send_keys("1/14/2018")

def test_leaving_date_time():
  elem = driver.find_element_by_name('ExitTime')
  elem.clear()
  elem.send_keys("1:00")

  driver.find_elements_by_xpath(".//input[@type='radio' and @value='PM']")[1].click

  elem = driver.find_element_by_name('ExitDate')
  elem.clear()
  elem.send_keys("1/14/2018")

if __name__ == "__main__":
  driver = init_driver()
  navigate_to_page(driver, "Selenium")
  test_lot_dropdown_works()
  test_entry_date_time()
  test_leaving_date_time()
  time.sleep(5)
  driver.quit()



