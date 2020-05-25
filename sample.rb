require "selenium-webdriver"

driver = Selenium::Webdriver.for :chrome
driver.navigate.to "http://google.com"

element = driver.find_element(name: 'q')
element.click
element.send_keys "Hello WebDriver!"
element.submit

driver.quit