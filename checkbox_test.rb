require "selenium-webdriver"

driver = Selenium::WebDriver.for :chrome
driver.navigate.to "https://formy-project.herokuapp.com/checkbox"

checkbox_1 = driver.find_element(id: 'checkbox-1')
checkbox_1.click

checkbox_2 = driver.find_element(id: 'checkbox-2')
checkbox_2.click

checkbox_3 = driver.find_element(id: 'checkbox-3')
checkbox_3.click
