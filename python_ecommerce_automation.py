import unittest
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.action_chains import ActionChains
import time


class MyStoreTest(unittest.TestCase):

    def setUp(self):
        self.browser = webdriver.Firefox()
    
    def test_title(self):
        self.browser.get('http://automationpractice.com/index.php')
        header = self.browser.find_element(By.ID, 'header_logo')
        self.assertTrue(header.is_displayed())

    def test_search_bar(self):
        self.browser.get('http://automationpractice.com/index.php')
        elem = self.browser.find_element_by_name('search_query')
        elem.clear()
        elem.send_keys("dress")
        self.browser.find_element_by_name('submit_search').click()

    def test_hover_and_category_click(self):
        driver = self.browser
        driver.get('http://automationpractice.com/index.php')
        element_to_hover_over = driver.find_element_by_xpath(".//a[contains(text(), 'Women')]")

        hover = ActionChains(driver).move_to_element(element_to_hover_over)
        hover.perform()

        ele_to_click = driver.find_element_by_xpath(".//a[contains(text(), 'T-shirts')]")
        time.sleep(10)
        ele_to_click.click()

    def test_carousel(self):
        driver = self.browser
        driver.get('http://automationpractice.com/index.php')
        driver.find_element_by_class_name("bx-next").click()
    
    def test_click_quick_view(self):
        driver = self.browser
        driver.get('http://automationpractice.com/index.php')

        driver.execute_script("window.scrollTo(0, 1000)")


        element_to_hover_over = driver.find_element_by_class_name('product_img_link')
        hover = ActionChains(driver).move_to_element(element_to_hover_over)
        hover.perform()

        element_to_click = driver.find_element_by_xpath(".//span[contains(text(), 'Quick view')]")
        time.sleep(10)
        element_to_click.click()

    def tearDown(self):
        self.browser.close()

if __name__ == "__main__":
    unittest.main()