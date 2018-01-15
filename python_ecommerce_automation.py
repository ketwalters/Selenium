import unittest
from selenium import webdriver
from selenium.webdriver.common.by import By

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

    def tearDown(self):
        self.browser.close()

if __name__ == "__main__":
    unittest.main()